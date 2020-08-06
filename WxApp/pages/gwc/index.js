const util = require('../../utils/util.js')
const user = require('../../utils/user.js')
const storage = require('../../utils/storage.js');
const app = getApp()
Page({
    data: {
        goods: [
            {
                code: "0001",
                goodsName: '绿色无污染新鲜现摘水果小黄瓜',
                goodsPrice: '178.99',
                goodsYj: '178.99',
                img: '../../image/cp_tu.png',
                num: '1',
            },
            {
                code: "0002",
                goodsName: '绿色无污染新鲜现摘水果小黄瓜',
                goodsPrice: '178.99',
                goodsYj: '178.99',
                img: '../../image/cp_tu.png',
                num: '1',
            },
        ],
        totalPrice: '0.00',
        num: '0',
        address: null,
        onAsync: false,
        param: {
            back_msg: '',
            refund_refuse_msg: '',
        },
        refund: false,
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
                allNum += parseInt(newList[i].num)
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
                newCount += newList[i].goodsPrice * newList[i].num
            }
        }
        that.setData({
            // newCount: newCount.toFixed(2),
            totalPrice: newCount,
        })
    },

    onLoad: function () {
        let id = storage.getStorage('generateOrder_address_id');
        if (id) {
            storage.removeStorage('generateOrder_address_id')
            util.wxRequest("Address/getAddress", {id: id}, res => {
                res.code === 200 && this.setData({address: res.data, 'param.address_id': res.data.id})
            })
            this.setData({onAsync: false})
        } else {
            util.wxRequest("Address/getDefaultAddress", {}, res => {
                res.code === 200 && this.setData({address: res.data, 'param.address_id': res.data.id})
            })
        }
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

})