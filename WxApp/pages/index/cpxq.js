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
    }

})