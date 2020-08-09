const app = getApp()
const util = require('../../utils/util.js');

Page({
    data: {
        info: null,
        auth: false,
        has_auth: false
    },

    onShow: function () {
        if (app.globalData.user_auth) {
            this.bindAuth()
        } else {
            app.userAuthReadyCallback = () => {
                this.bindAuth()
            }
        }
    },

    auth(e) {
        if(!this.data.has_auth){
            this.setData({auth: true})
        }else {
            wx.navigateTo({url:e.currentTarget.dataset.url})
        }
    },

    bindAuth() {
        this.setData({has_auth: true})
        this.loadData()
    },

    loadData() {
        util.wxRequest("User/getUserInfo", {}, res => {
            this.setData({info: res.data})
        })
    },
})