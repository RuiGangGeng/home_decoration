const util = require('../../utils/util.js')
const user = require('../../utils/user.js')
const storage = require('../../utils/storage.js');
const app = getApp()
Page({
    data: {
        goods: [],
        totalPrice: '0.00',
        num: '0',
        address: null,
        onAsync: false,
        param: {
            refund_refuse_msg: '',
        },
        refund: false,
        selectAllStatus: false,
        auth: false,
    },

    // 单个选中
    change: function (e) {
        var that = this;
        const index = e.currentTarget.dataset.index; // 获取data- 传进来的index
        var goods = that.data.goods; // 获取购物车列表
        var selectAllStatus = that.data.selectAllStatus; //获取全选状态
        const selected = goods[index].selected; // 获取当前商品的选中状态
        goods[index].selected = !selected; // 改变状态
        goods[index]['selected'] = !selected;
        //判断有一个没有选中，全选取消
        var j = 0;
        for (var i = 0; i < goods.length; i++) {
            if (goods[i].selected == true) {
                j++;
                continue;
            } else {
                selectAllStatus = false;
            }
        }
        if (j == goods.length) {
            selectAllStatus = true;
        }
        //如果都选中，全选也选中实现
        that.setData({
            goods: goods,
            selectAllStatus: selectAllStatus,
        });
        //调用计算数目方法
        that.countNum()
        //计算金额
        that.count()
    },

    change_(e) {
        var that = this
        const index = e.currentTarget.dataset.index
        const parent = e.currentTarget.dataset.parent
        var goods = that.data.goods; // 获取购物车列表
        var selectAllStatus = that.data.selectAllStatus; //获取全选状态
        const selected = goods[parent].goods[index].selected; // 获取当前商品的选中状态
        goods[parent].goods[index].selected = !selected; // 改变状态
        var j = 0;
        for (var i = 0; i < goods.length; i++) {
            if (goods[i].selected == true) {
                j++;
                continue;
            } else {
                selectAllStatus = false;
            }
        }
        if (j == goods.length) {
            selectAllStatus = true;
        }
        this.setData({goods: goods})
        //调用计算数目方法
        that.countNum()
        //计算金额
        that.count()
    },

    // 全选事件
    selectAll: function (e) {
        var that = this;
        var selectAllStatus = that.data.selectAllStatus; // 是否全选状态
        selectAllStatus = !selectAllStatus;
        var goods = that.data.goods;
        for (var i = 0; i < goods.length; i++) {
            goods[i].selected = selectAllStatus;
            goods[i]['selected'] = selectAllStatus; // 改变所有商品状态
        }
        that.setData({
            selectAllStatus: selectAllStatus,
            goods: goods
        });

        //调用计算数目方法
        that.countNum()
        //计算金额
        that.count()
    },

    //计算数量
    countNum: function () {
        var that = this
        //遍历数组，把既选中的num加起来
        var newList = that.data.goods
        var allNum = 0
        for (var i = 0; i < newList.length; i++) {
            if (newList[i].selected) {
                allNum++
                // allNum += parseInt(newList[i].num)
            }
        }
        that.setData({
            num: allNum
        })
    },

    //计算金额方法
    count: function () {
        var that = this
        //选中的订单，数量*价格加起来
        var goodsPrice = parseFloat(that.data.goods.goodsPrice)
        var newList = that.data.goods
        var newCount = 0.00
        for (var i = 0; i < newList.length; i++) {
            if (newList[i].selected) {
                newCount += newList[i].price * 1
            }
            if (newList[i].goods) {
                for (var j = 0; j < newList[i].goods.length; j++) {
                    if (newList[i].goods[j].selected) {
                        newCount += newList[i].goods[j].price * 1
                    }
                }
            }
        }
        that.setData({
            // newCount: newCount.toFixed(2),
            totalPrice: newCount,
        })
    },

    onShow: function () {
        let id = storage.getStorage('generateOrder_address_id');
        if (id) {
            storage.removeStorage('generateOrder_address_id')
            util.wxRequest("Address/getAddress", {id: id}, res => {
                res.code === 200 && this.setData({address: res.data, 'param.address_id': res.data.id})
            })
            this.setData({onAsync: false})
        } else {
            if (!this.data.address) {
                util.wxRequest("Address/getDefaultAddress", {}, res => {
                    res.code === 200 && this.setData({address: res.data, 'param.address_id': res.data.id})
                })
            }
        }

        // 购物车处理
        let cart = storage.getStorage('cart') || []
        let carts = [];
        let arr = [];
        for (let i of cart) {
            carts.push(i.good_ids)
            for (let j of cart) {
                if (!arr.includes(j.id)) {
                    arr.push(j.id)
                }
            }
        }
        util.wxRequest("Cart/getCarts", {shop_id: JSON.stringify(carts)}, res => {
            if (res.code === 200) {
                for (let i = 0; i < res.data.length; i++) {
                    cart[i].goods = []
                    for (let j = 0; j < res.data[i].length; j++) {
                        if (!arr.includes(res.data[i][j].id)) {
                            cart[i].goods.push(res.data[i][j])
                        }
                    }
                }
            }
            this.setData({goods: cart})
        })
        this.setData({goods: cart ? cart : [], selectAllStatus: false})
        cart && this.selectAll()
    },

    onHide() {
        this.setData({refund: false})
    },

    // 提交退单信息
    confirmBack: function () {
        let that = this
        if (that.data.param.back_msg === '') {
            wx.showToast({title: '请输入退单原由', icon: 'none'})
            return false
        }
        let param = {id: that.data.param.id, back_msg: that.data.param.back_msg}
        util.wxRequest("Order/confirmBack", param, res => {
            if (res.code === 200) {
                wx.showToast({title: res.msg})
                setTimeout(function () {
                    that.setData({list: [], page: 0})
                    that.loadData()
                }, 2000)
            } else {
                wx.showModal({
                    title: '警告',
                    content: res.msg,
                    showCancel: false,
                    success(res) {
                        if (res.confirm) {
                            that.setData({list: [], page: 0})
                            that.loadData()
                        }
                    }
                })
            }
        }, () => {
        }, () => {
            that.setData({back: false})
        })
    },

    go(e) {
        let id = e.currentTarget.dataset.id
        wx.navigateTo({url: "/pages/index/cpxq?id=" + id})
    },

    // 申请退款
    refund: function () {
        if (app.globalData.user_auth) {
            this.setData({refund: true})
        } else {
            this.setData({auth: true})
            app.userAuthReadyCallback =  () =>{
                this.setData({auth: false})
                this.refund()
            }
        }
    },

    sub() {
        let that = this
        if (!that.data.address) {
            wx.showModal({
                title: '温馨提示',
                content: '您还没有收货地址，点击确定添加地址',
                showCancel: false,
                success(res) {
                    if (res.confirm) {
                        wx.navigateTo({url: '/pages/mine/address/add'})
                    }
                }
            })
            return false
        }

        that.setData({onAsync: true, refund: false})

        let newList = that.data.goods
        let arr = [];
        for (let i = 0; i < newList.length; i++) {
            if (newList[i].selected) {
                arr.push(newList[i].id)
            }
            if (newList[i].goods) {
                for (let j = 0; j < newList[i].goods.length; j++) {
                    if (newList[i].goods[j].selected) {
                        arr.push(newList[i].goods[j].id)
                    }
                }
            }
        }
        that.data.param.good_ids = arr.join(',')
        //调用订单创建接口
        util.wxRequest('Pay/pay', that.data.param, res => {
            if (res.code === 200) {
                // 发起支付
                wx.requestPayment({
                    timeStamp: res.data.package.timeStamp,
                    nonceStr: res.data.package.nonceStr,
                    package: res.data.package.package,
                    signType: res.data.package.signType,
                    paySign: res.data.package.sign,
                    complete() {
                        wx.showLoading({title: '查询订单状态', mask: true})
                        util.wxRequest('Pay/queryPayResult', {order_id: res.data.out_trade_no}, res => {
                            wx.hideLoading()
                            storage.removeStorage('cart')
                            wx.navigateTo({url: '/pages/wd/yfk'})
                        })
                    }
                })
            } else {
                wx.showModal({
                    title: '温馨提示',
                    content: res.msg,
                    showCancel: false,
                    success: function () {
                    }
                })
            }
        })
    },

    // 字段输入
    bindInput: function (e) {
        let field = e.currentTarget.dataset.field
        let param = this.data.param;
        param[field] = e.detail.value
        this.setData({param})
    },

    bindAuth() {
        this.refund()
    },
})