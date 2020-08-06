const user = require('/utils/user.js');
const storage = require('/utils/storage.js');
App({
    onLaunch: function () {
        // storage.removeStorage('token')
        user.wxLogin("User/wxAppLogIn")
        user.wxAuthUserInfo('User/wxAppAuthUser')
    },
    globalData: {
        debug: true,
        user_info: false,
        user_auth: false,
        api_host: 'http://www.home.com/api/',
        // api_host: 'https://mini-jd.7758521.work/api/',
        // api_host: 'https://jxm.bowangyun.net/api/',
        token: false,
        storage_time: 2592000,
        location: null,
    }
})