<?php

namespace addons\alioss\controller;

use app\common\model\Attachment;
use OSS\Core\OssException;
use OSS\OssClient;
use think\addons\Controller;
use think\Config;

/**
 * 阿里OSS
 *
 */
class Index extends Controller
{

    public function index()
    {
        $this->error("当前插件暂无前台页面");
    }

    /**
     * 获取签名
     */
    public function params()
    {
        Config::set('default_return_type', 'json');

        $name = $this->request->post('name');
        $md5 = $this->request->post('md5');
        $auth = new \addons\alioss\library\Auth();
        $params = $auth->params($name, $md5);
        $this->success('', null, $params);
        return;
    }

    /**
     * 服务器中转上传文件
     */
    public function upload()
    {
        Config::set('default_return_type', 'json');
        if (!session('admin') && !$this->auth->id) {
            $this->error("请登录后再进行操作");
        }
        $config = get_addon_config('alioss');

        $endpoint = "http://" . $config['endpoint'];

        $file = $this->request->file('file');
        if (!$file || !$file->isValid()) {
            $this->error("请上传有效的文件");
        }
        $fileInfo = $file->getInfo();

        $filePath = $file->getRealPath() ?: $file->getPathname();

        preg_match('/(\d+)(\w+)/', $config['maxsize'], $matches);
        $type = strtolower($matches[2]);
        $typeDict = ['b' => 0, 'k' => 1, 'kb' => 1, 'm' => 2, 'mb' => 2, 'gb' => 3, 'g' => 3];
        $size = (int)$config['maxsize'] * pow(1024, isset($typeDict[$type]) ? $typeDict[$type] : 0);

        $suffix = strtolower(pathinfo($fileInfo['name'], PATHINFO_EXTENSION));
        $suffix = $suffix ? $suffix : 'file';

        $md5 = md5_file($filePath);
        $search = ['{year}', '{mon}', '{month}', '{day}', '{filemd5}', '{suffix}', '{.suffix}'];
        $replace = [date("Y"), date("m"), date("m"), date("d"), $md5, $suffix, '.' . $suffix];
        $object = ltrim(str_replace($search, $replace, $config['savekey']), '/');

        $mimetypeArr = explode(',', strtolower($config['mimetype']));
        $typeArr = explode('/', $fileInfo['type']);

        //检查文件大小
        if (!$file->checkSize($size)) {
            $this->error("起过最大可上传文件限制");
        }

        //验证文件后缀
        if ($config['mimetype'] !== '*' &&
            (
                !in_array($suffix, $mimetypeArr)
                || (stripos($typeArr[0] . '/', $config['mimetype']) !== false && (!in_array($fileInfo['type'], $mimetypeArr) && !in_array($typeArr[0] . '/*', $mimetypeArr)))
            )
        ) {
            $this->error(__('上传格式限制'));
        }

        $savekey = '/' . $object;

        $uploadDir = substr($savekey, 0, strripos($savekey, '/') + 1);
        $fileName = substr($savekey, strripos($savekey, '/') + 1);
        //先上传到本地
        $splInfo = $file->move(ROOT_PATH . '/public' . $uploadDir, $fileName);
        if ($splInfo) {
            $extparam = $this->request->post();
            $filePath = $splInfo->getRealPath() ?: $splInfo->getPathname();

            $sha1 = sha1_file($filePath);
            $imagewidth = $imageheight = 0;
            if (in_array($suffix, ['gif', 'jpg', 'jpeg', 'bmp', 'png', 'swf'])) {
                $imgInfo = getimagesize($splInfo->getPathname());
                $imagewidth = isset($imgInfo[0]) ? $imgInfo[0] : $imagewidth;
                $imageheight = isset($imgInfo[1]) ? $imgInfo[1] : $imageheight;
            }
            $params = array(
                'admin_id'    => session('admin.id'),
                'user_id'     => $this->auth->id,
                'filesize'    => $fileInfo['size'],
                'imagewidth'  => $imagewidth,
                'imageheight' => $imageheight,
                'imagetype'   => $suffix,
                'imageframes' => 0,
                'mimetype'    => $fileInfo['type'],
                'url'         => $uploadDir . $splInfo->getSaveName(),
                'uploadtime'  => time(),
                'storage'     => 'local',
                'sha1'        => $sha1,
                'extparam'    => json_encode($extparam),
            );
            $attachment = new Attachment;
            $attachment->data(array_filter($params));
            $attachment->save();

            //上传到远程
            try {
                $ossClient = new OssClient($config['app_id'], $config['app_key'], $endpoint);
                $ossClient->uploadFile($config['bucket'], $object, $filePath);
            } catch (OssException $e) {
                $this->error('上传失败');
                return;
            }
            $url = '/' . $object;

			unset($splInfo);
            // 删除服务器文件
            if(file_exists($object)){
                unlink($object);
            }

            //上传成功后将存储变更为alioss
            $attachment->storage = 'alioss';
            $attachment->save();

            $this->success("上传成功", null, ['url' => $url]);
        } else {
            $this->error('上传失败');
        }
        return;
    }

    /**
     * 回调
     */
    public function notify()
    {
        Config::set('default_return_type', 'json');
        $size = $this->request->post('size');
        $name = $this->request->post('name');
        $md5 = $this->request->post('md5');
        $type = $this->request->post('type');
        $signature = $this->request->post('signature');
        $policy = $this->request->post('policy');
        $url = $this->request->post('url');
        $suffix = substr($name, stripos($name, '.') + 1);
        $auth = new \addons\alioss\library\Auth();
        if ($auth->check($signature, $policy)) {
            $attachment = Attachment::getBySha1($md5);
            if (!$attachment) {
                $params = array(
                    'admin_id'    => (int)session('admin.id'),
                    'user_id'     => (int)cookie('uid'),
                    'filesize'    => $size,
                    'imagewidth'  => 0,
                    'imageheight' => 0,
                    'imagetype'   => $suffix,
                    'imageframes' => 0,
                    'mimetype'    => $type,
                    'url'         => $url,
                    'uploadtime'  => time(),
                    'storage'     => 'alioss',
                    'sha1'        => $md5,
                );
                Attachment::create($params);
            }
            $this->success();
        } else {
            $this->error(__('You have no permission'));
        }
        return;
    }

}
