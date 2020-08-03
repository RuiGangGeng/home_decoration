<?php


namespace app\api\library;

use Exception;

class WxPay
{
    /**
     * 对象实例
     * @var object
     */
    private static $instance;

    /**
     * 接口地址
     * @var string
     */
    private $url;

    /**
     * 是否需要证书请求
     * @var bool
     */
    private $ssl = false;

    /**
     * 证书
     * @var string
     */
    private $ssl_cert;

    /**
     * 密钥
     * @var string
     */
    private $ssl_key;

    /**
     * 证书路径数组 理论上无限创建
     * @var array
     */
    private $file = [];

    /**
     * 微信商户平台 操作密钥
     * @var string
     */
    private $key;

    /**
     * 商户订单号
     * @var string
     */
    public $out_trade_no;

    /**
     * 需要签名的数据
     * @var array
     */
    private $data = [];

    /**
     * 请求接口返回的数据
     * @var array
     */
    private $response;

    /**
     * 初始化
     * @param $appid string 小程序 appid
     * @param $mch_id integer 微信商户平台 商户号
     * @param $key string 微信商户平台 操作密钥
     */
    private function __construct($appid, $mch_id, $key)
    {
        $this->data['appid']     = $appid;
        $this->data['mch_id']    = $mch_id;
        $this->data['nonce_str'] = $this->getRandChar(32);
        $this->key               = $key;
    }

    /**
     * 初始化
     * @param $appid string 小程序 appid
     * @param $mch_id integer 微信商户平台 商户号
     * @param $key string 微信商户平台 操作密钥
     * @return WxPay|object
     */
    public static function instance($appid, $mch_id, $key)
    {
        //如果不存在实例，则返回实例
        if (empty(self::$instance)) {
            self::$instance = new self($appid, $mch_id, $key);
        }
        return self::$instance;
    }

    /**
     * 统一下单
     * @param $openid string 用户标识
     * @param $body string 商品名称
     * @param $total_fee float 支付价格
     * @param $notify_url string 回调通知地址
     * @param $out_trade_no bool string 商户订单号
     * @param $trade_type string 交易类型
     * @return array
     * @throws Exception
     */
    public function create($openid, $body, $total_fee, $notify_url, $out_trade_no = false, $trade_type = 'JSAPI')
    {
        if (!$out_trade_no) {
            $out_trade_no = date("YmdHis") . $this->getRandChar(6);
        }
        $this->url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';

        $this->data['openid']           = $openid;
        $this->data['body']             = $body;
        $this->data['total_fee']        = $total_fee * 100;
        // $this->data['total_fee']     = 1;
        $this->data['out_trade_no']     = $out_trade_no;
        $this->out_trade_no             = $out_trade_no;
        $this->data['notify_url']       = $notify_url;
        $this->data['trade_type']       = $trade_type;
        $this->data['spbill_create_ip'] = $this->getRealIp();

        // 微信段返回的预支付数据包
        $this->sign()->request()->exception();

        // 再次签名
        $data['appId']     = $this->data['appid'];
        $data['timeStamp'] = (string)time();
        $data['nonceStr']  = $this->getRandChar(32);
        $data['package']   = 'prepay_id=' . $this->response['prepay_id'];
        $data['signType']  = 'MD5';
        $this->data        = $data;

        $this->sign();

        return $this->data;
    }

    /**
     * 查询订单
     * @param bool $order_id 订单号
     * @param bool $type true 微信订单号，false 商户订单号
     * @return mixed
     * @throws Exception
     */
    public function query($order_id, $type = false)
    {
        $this->url = 'https://api.mch.weixin.qq.com/pay/orderquery';

        $type ? $this->data['transaction_id'] = $order_id : $this->data['out_trade_no'] = $order_id;

        return $this->sign()->request()->exception();
    }

    /**
     * 申请退款
     * 约定【商户退款单号】同传入的订单号一样
     * 约定【退款金额】同支付金额一样 即全额退款
     * @param $ssl_cert string 证书 可选路径或内容 但是要统一
     * @param $ssl_key string 密钥 可选路径或内容 但是要统一
     * @param $total_fee float 订单金额
     * @param $notify_url string 通知地址
     * @param $order_id string 订单号
     * @param $type bool true 微信订单号，false 商户订单号
     * @return mixed
     * @throws Exception
     */
    public function refund($ssl_cert, $ssl_key, $total_fee, $notify_url, $order_id, $type = false)
    {
        $this->url = 'https://api.mch.weixin.qq.com/secapi/pay/refund';

        $type ? $this->data['transaction_id'] = $order_id : $this->data['out_trade_no'] = $order_id;

        $this->data['total_fee']     = $total_fee * 100;
        $this->data['refund_fee']    = $total_fee * 100;
        // $this->data['total_fee']  = 1;
        // $this->data['refund_fee'] = 1;
        $this->data['out_refund_no'] = $order_id;
        $this->data['notify_url']    = $notify_url;

        $this->ssl      = true;
        $this->ssl_key  = $ssl_key;
        $this->ssl_cert = $ssl_cert;

        return $this->sign()->request()->exception();
    }

    /**
     * 签名
     * @return WxPay
     */
    private function sign()
    {
        $this->data['sign'] = strtoupper(md5($this->arrayToUrl($this->data) . '&key=' . $this->key));
        return $this;
    }

    /**
     * 请求
     * @return WxPay
     * @throws Exception
     */
    private function request()
    {
        $data = $this->arrayToXml($this->data);

        if ($this->ssl) {
            // 判断是否是文件或者是路径
            if (file_exists($this->ssl_cert)) {
                $data = $this->postData($data, $this->url, true, $this->ssl_cert, $this->ssl_key);
            } else {
                // 生成证书 临时文件
                $data = $this->postData($data, $this->url, true, $this->setTempPath('cert', $this->ssl_cert), $this->setTempPath('key', $this->ssl_key));
            }
        } else {
            $data = $this->postData($data, $this->url);
        }

        $this->response = $this->xmlToArray($data);

        return $this;
    }

    /**
     * 异常
     * @return mixed
     * @throws Exception
     */
    private function exception()
    {
        // 通信标识
        if ($this->response['return_code'] !== 'SUCCESS') throw new Exception($this->response['return_msg'], 500);
        // 请求标识
        if ($this->response['result_code'] !== 'SUCCESS') throw new Exception($this->response['err_code_des'], 500);
        // 查询订单时特有的结果标识
        if (isset($this->response['trade_state'])) if ($this->response['trade_state'] !== "SUCCESS") throw new Exception($this->response['trade_state_desc'], 500);

        return $this->response;
    }

    /**
     * 获取指定长度的随机字符串
     * @param int $length 长度
     * @return string|null
     */
    private function getRandChar($length)
    {
        $str    = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max    = strlen($strPol) - 1;
        for ($i = 0; $i < $length; $i++) {
            $str .= $strPol[rand(0, $max)];
        }
        return $str;
    }

    /**
     * 数组转 url
     * @param array $arr 数组
     * @return false|string
     */
    private function arrayToUrl($arr)
    {
        $buff = "";
        ksort($arr);
        foreach ($arr as $k => $v) {
            $buff .= $k . "=" . $v . "&";
        }
        $reqPar = '';
        if (strlen($buff) > 0) {
            $reqPar = substr($buff, 0, strlen($buff) - 1);
        }
        return $reqPar;
    }

    /**
     * 数组转 xml
     * @param array $arr 数组
     * @return string 返回xml数据
     */
    private function arrayToXml($arr)
    {
        $xml = "<xml>";
        foreach ($arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
        }
        $xml .= "</xml>";
        return $xml;
    }

    /**
     * xml转 数组
     * @param string $xml xml数据
     * @return array|mixed 返回数组
     */
    private function xmlToArray($xml)
    {
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $xmlString = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);
        return json_decode(json_encode($xmlString), true);
    }

    /**
     * 获取客户端IP地址
     * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
     * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
     * @return mixed
     */
    private function getRealIp($type = 0, $adv = true)
    {
        $type = $type ? 1 : 0;
        static $ip = null;
        if (null !== $ip) {
            return $ip[$type];
        }

        if ($adv) {
            if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
                $pos = array_search('unknown', $arr);
                if (false !== $pos) {
                    unset($arr[$pos]);
                }
                $ip = trim(current($arr));
            } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
                $ip = $_SERVER['HTTP_CLIENT_IP'];
            } elseif (isset($_SERVER['REMOTE_ADDR'])) {
                $ip = $_SERVER['REMOTE_ADDR'];
            }
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        // IP地址合法验证
        $long = sprintf("%u", ip2long($ip));
        $ip   = $long ? [$ip, $long] : ['0.0.0.0', 0];
        return $ip[$type];
    }

    /**
     * post https请求，CURLOPT_POSTFIELDS xml格式
     * @param string $data 数据
     * @param string $url 地址
     * @param bool $ssl 是否需要证书
     * @param string $cert 证书文件路径
     * @param string $key 密钥文件路径
     * @return bool|string
     * @throws Exception
     */
    private function postData($data, $url, $ssl = false, $cert = '', $key = '')
    {
        // 初始化curl
        $ch = curl_init();
        // 请求地址
        curl_setopt($ch, CURLOPT_URL, $url);
        // 设置不检验SSL
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        // 设置不检验主机名
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        // 设置header
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        // 要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        // post提交方式
        curl_setopt($ch, CURLOPT_POST, TRUE);
        // 提交的数据
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        if ($ssl) {
            // 证书类型
            curl_setopt($ch, CURLOPT_SSLCERTTYPE, 'PEM');
            // 证书路径
            curl_setopt($ch, CURLOPT_SSLCERT, $cert);
            // 密钥类型
            curl_setopt($ch, CURLOPT_SSLKEYTYPE, 'PEM');
            // 密钥地址
            curl_setopt($ch, CURLOPT_SSLKEY, $key);
        }

        // 运行curl
        $data = curl_exec($ch);

        // 返回结果
        if ($data) {
            curl_close($ch);
            return $data;
        } else {
            throw new Exception(curl_getinfo($ch), 500);
        }
    }

    /**
     * 根据内容生成临时文件路径
     * @param $key string 用来获取临时文件的 key 重复set会覆盖之前的数据
     * @param $content string 内容
     * @return mixed 临时文件路径
     */
    private function setTempPath($key, $content)
    {
        $this->file[$key] = tmpfile();
        fwrite(end($this->file), $content);
        $path = stream_get_meta_data(end($this->file));
        return $path['uri'];
    }

    /**
     * 根据 key 获取临时文件路径
     * @param $key string 用来获取临时文件的 key
     * @return mixed 临时文件路径
     */
    private function getTempPath($key)
    {
        $path = stream_get_meta_data($this->file[$key]);
        return $path['uri'];
    }
}
