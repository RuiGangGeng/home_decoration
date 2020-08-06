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

    // 获取行业分类
    util.wxRequest("Index/getCategories", {shop_id:2}, res => {
      res.code === 200 && that.setData({
        categories: res.data
      })
    })
  },
})
