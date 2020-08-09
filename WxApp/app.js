const user = require('/utils/user.js');
const storage = require('/utils/storage.js');
App({
    onLaunch: function () {
        // storage.removeStorage('token')
        user.wxLogin("User/wxAppLogIn")
        user.wxAuthUserInfo('User/wxAppAuthUser')
        let cart = storage.getStorage('cart').length || 0
        this.setCartNum(String(cart))
    },
    globalData: {
        debug: true,
        user_info: false,
        user_auth: false,
        api_host: 'https://baiwan.7758521.work/api/',
        token: false,
        storage_time: 2592000,
        location: {
            latitude:39.906930,
            longitude:116.397570,
        }
    },
    // 购物车底部导航数字
    setCartNum: function(number) {
        // if (number * 1 > 0) {
        //     wx.setTabBarBadge({ index: 2, text: number })
        // } else {
        //     wx.hideTabBarRedDot({ index: 2 })
        // }
    },
})