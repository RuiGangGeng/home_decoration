// pages/grzx/pj.js
const util = require('../../utils/util.js')
Page({
    data: {
        one_2: 0,
        two_2: 6,
        param: {
            refund_apply_msg: ''
        },
        id: 0,
        info: null,
    },

    onLoad(e) {
        this.data.id = e.id
        // 获取订单详情
        util.wxRequest("Order/getOrder", {id: e.id}, res => {
            if (res.code === 200) {
                res.data.createtime = res.data.createtime ? util.formatTime(new Date(res.data.createtime * 1000)) : res.data.createtime
                res.data.pay_time = res.data.pay_time ? util.formatTime(new Date(res.data.pay_time * 1000)) : res.data.pay_time
                res.data.delivery_time = res.data.delivery_time ? util.formatTime(new Date(res.data.delivery_time * 1000)) : res.data.delivery_time
                res.data.receiving_time = res.data.receiving_time ? util.formatTime(new Date(res.data.receiving_time * 1000)) : res.data.receiving_time
                res.data.refund_apply_time = res.data.refund_apply_time ? util.formatTime(new Date(res.data.refund_apply_time * 1000)) : res.data.refund_apply_time
                res.data.refund_agree_time = res.data.refund_agree_time ? util.formatTime(new Date(res.data.refund_agree_time * 1000)) : res.data.refund_agree_time
                res.data.refund_refuse_time = res.data.refund_refuse_time ? util.formatTime(new Date(res.data.refund_refuse_time * 1000)) : res.data.refund_refuse_time
                res.data.updatetime = res.data.updatetime ? util.formatTime(new Date(res.data.updatetime * 1000)) : res.data.updatetime
                res.data.back_time = res.data.back_time ? util.formatTime(new Date(res.data.back_time * 1000)) : res.data.back_time
                res.data.platform_refuse_time = res.data.platform_refuse_time ? util.formatTime(new Date(res.data.platform_refuse_time * 1000)) : res.data.platform_refuse_time
                res.data.platform_agree_time = res.data.platform_agree_time ? util.formatTime(new Date(res.data.platform_agree_time * 1000)) : res.data.platform_agree_time

                this.setData({info: res.data});
            }
        })
    },

    in_xin: function (e) {
        var in_xin = e.currentTarget.dataset.in;
        var one_2;
        if (in_xin === 'use_sc2') {
            one_2 = Number(e.currentTarget.id);
        } else {
            one_2 = Number(e.currentTarget.id) + this.data.one_2;
        }
        this.setData({
            one_2: one_2,
            two_2: 6 - one_2
        })
    },

    // 提交退款申请
    confirmRefund: function () {
        let that = this
        if (that.data.param.refund_apply_msg === '') {
            wx.showToast({title: '请输入评价内容', icon: 'none'})
            return false
        }
        if (that.data.one_2 === 0) {
            wx.showToast({title: '请点选评分', icon: 'none'})
            return false
        }

        let param = {
            id: that.data.id,
            refund_apply_msg: that.data.param.refund_apply_msg,
            mark: that.data.one_2,
        }

        util.wxRequest("Order/evaluate", param, res => {
            wx.showToast({title: res.msg, icon: res.code === 200 ? 'success' : 'none'})
            setTimeout(function () {
                wx.navigateBack()
            }, 200)
        })
    },

    // 字段输入
    bindInput: function (e) {
        let field = e.currentTarget.dataset.field
        let param = this.data.param;
        param[field] = e.detail.value
        this.setData({param})
    },
})