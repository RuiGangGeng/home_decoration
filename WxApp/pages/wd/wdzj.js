const util = require('../../utils/util.js');
const storage = require('../../utils/storage.js');
const app = getApp()
Page({

    data: {
        list: [],
        page: 0,
        total: 0,
        onAsync: false,
    },

    onLoad: function (options) {
        this.loadData()
    },

    // 触底加载
    onReachBottom: function () {
        this.loadData()
    },

    // 加载列表
    loadData: function () {
        let that = this

        if (that.data.onAsync) return false
        that.setData({onAsync: true})

        let param = {page: that.data.page + 1}

        util.wxRequest("User/getViews", param, res => {
            let temp = that.data.list.concat(res.data.data)
            that.setData({
                page: res.data.current_page,
                total: res.data.total,
                list: temp,
                onAsync: false
            })
        })
    },

    go(e) {
        let id = e.currentTarget.dataset.id
        wx.navigateTo({url: "/pages/index/cpxq?id=" + id})
    },
})