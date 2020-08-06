const util = require('../../utils/util.js')
const user = require('../../utils/user.js')
const storage = require('../../utils/storage.js');
const app = getApp()

Page({
    data: {
        imgUrl: [],
        categories: [],
        ggUrl: [],
        ggautoplay: true,
        _index: 0,
        onAsync: false,
        list: [],
        total: 0,
        page: 0,
        info:null
    },

    onLoad: function () {
        let that = this
        // 获取banner
        util.wxRequest("Index/getBanners", {}, res => {
            res.code === 200 && that.setData({
                imgUrl: res.data
            })
        })

        // 获取行业分类
        util.wxRequest("Index/getCategories", {}, res => {
            res.code === 200 && that.setData({
                categories: res.data
            })
        })

        // 获取行业分类
        util.wxRequest("Index/getVideos", {}, res => {
            res.code === 200 && that.setData({
                ggUrl: res.data
            })
        })

        // 获取行业分类
        // 获取优惠专区
        util.wxRequest("Index/getDiscount", {}, res => {
            res.code === 200 && that.setData({
                info: res.data
            })
        })
        that.loadData()
    },

    //事件处理函数
    bindViewTap: function (e) {
        let id = e.currentTarget.dataset.id
        this.setData({
            ggautoplay: false,
            _index: id
        })
    },

    videoPlay: function (e) {
        var _index = e.currentTarget.dataset.id
        // 停止正在播放的视频
        if (this.data._index !== 0) {
            var videoContextPre = wx.createVideoContext(String(this.data._index))
            videoContextPre.stop()
        }
        setTimeout(function () {
            //将点击视频进行播放
            var videoContext = wx.createVideoContext(String(_index))
            videoContext.play()
        }, 200)
        this.setData({_index: _index, ggautoplay: false})
    },

    bindchange: function (e) {
        this.setData({_index: e.detail.current, ggautoplay: true})
    },


    // 触底加载
    onReachBottom: function () {
        this.loadData()
    },

    // 加载列表
    loadData: function () {
        let that = this

        if (that.data.onAsync) {
            return false
        } else {
            that.setData({
                onAsync: true
            })
        }

        that.data.complete && wx.showLoading()
        setTimeout(function () {
            wx.hideLoading()
        }, 3000)

        let param = {status: 1}

        util.wxRequest("Good/getGoods", {page: that.data.page + 1, where: JSON.stringify(param)}, res => {
            let temp = that.data.list.concat(res.data.data)
            that.setData({
                page: res.data.current_page,
                total: res.data.total,
                onAsync: false,
                list: temp
            })
        })
    },

    intoMap: function () {
        wx.openLocation({
            latitude: Number(this.data.info.shop_id),
            longitude: Number(this.data.info.category_id),
            name: this.data.info.good_id,
            address: this.data.info.type_list,
            scale: 28
        })
    },


    // 下拉刷新
    onPullDownRefresh: function () {
        let that = this
        that.setData({
            page: 0,
            list: [],
            total:0,
        })
        storage.removeStorage('token')
        app.wxLoginCallback = function () {
            that.onLoad()
            wx.stopPullDownRefresh()
        }
        user.wxLogin("User/wxAppLogIn")
    },
})
