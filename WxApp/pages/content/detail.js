const util = require('../../utils/util.js')
const app = getApp()
Page({
    data: {
        info: [],
        cart: false,
    },

    onLoad: function (e) {
        let that = this

        // 获取商品详情
        util.wxRequest('Category/getCategory', {id: e.id}, res => {
            that.setData({info: res.data});
        })
    },

    // 分享
    onShareAppMessage: function () {
        let that = this;
        return {
            title: that.data.info.name,
            path: 'pages/index/index', // 路径，传递参数到指定页面
            imageUrl: that.data.info.thumb_image, // 分享的封面图
            success: function (res) {
                wx.showToast({
                    title: '转发成功',
                })
            },
            fail: function (res) {
                wx.showToast({
                    title: '转发失败',
                    icon: "none"
                })
            }
        }
    },
})