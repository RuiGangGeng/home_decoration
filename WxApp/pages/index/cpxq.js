// pages/index/bkxq.js
const util = require('../../utils/util.js')
const user = require('../../utils/user.js')
const storage = require('../../utils/storage.js')
let app = getApp()
Page({

    data: {
        shop_id: 0,
        activeIndex: 0,
        swiperList: [],
        info: null,
        cart: null,
        auth: false,
        like: false,
        in_cart: !1
    },

    onLoad: function (e) {
        // 获取商品详情
        this.setData({
            shop_id: e.id
        })
        util.wxRequest("Good/getGood", {id: e.id}, res => {
            this.setData({
                swiperList: res.data.images,
                info: res.data,
            });
        })
        if (app.globalData.user_auth) {
            this.getLike()
        } else {
            app.userAuthReadyCallback = this.getLike()
        }
    },

    changeImg(e) {
        let that = this
        that.activeIndex = e.detail.current
        this.setData({
            activeIndex: e.detail.current
        });
    },

    showLength() {
        return this.swiperList.length
    },

    getLike() {
        util.wxRequest("Index/like_", {shop_id: this.data.shop_id}, res => {
            res.code === 200 && this.setData({like: true})
        })
    },

    like: function () {
        let that = this
        let like = this.data.like
        if (app.globalData.user_auth) {
            util.wxRequest("Index/like", {shop_id: that.data.shop_id}, res => {
                if (res.code === 200) {
                    wx.showToast({title: like ? "取消成功" : '收藏成功'})
                    that.setData({like: !like})
                }
            })
        } else {
            this.setData({auth: true})
        }
    },

    bindAuth() {
        this.getLike()
    },

    addCart() {
        let cart = storage.getStorage('cart') || false
        if (!cart) cart = []
        let in_cart = false
        for (let i of cart) {
            if (i.id === Number(this.data.shop_id)) {
                wx.showModal({
                    title: '温馨提示',
                    content: '您已经将该服务添加购物车',
                    showCancel: false,
                })
                in_cart = true
                this.setData({in_cart: !0})
            }
        }
        if (!in_cart) {
            this.data.info.selected = true
            cart.push(this.data.info)
            wx.showToast({title: '添加成功'})
        }
        storage.setStorage('cart', cart, 20 * 60)
    },

    buy() {
        let cart = storage.getStorage('cart') || false
        if (!cart) cart = []
        let in_cart = false
        for (let i of cart) {
            if (i.id === Number(this.data.shop_id)) {
                in_cart = true
                this.setData({in_cart: !0})
                wx.switchTab({url: '/pages/gwc/index'})
            }
        }
        if (!in_cart) {
            this.data.info.selected = true
            cart.push(this.data.info)
            wx.switchTab({url: '/pages/gwc/index'})
            storage.setStorage('cart', cart, 20 * 60)
        }
    }
})