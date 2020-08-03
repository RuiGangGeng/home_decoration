// pages/gwc/gwc.js
const app = getApp()
Page({
	/**
	 * 页面的初始数据
	 */
	data: {
		staticImg: app.globalData.staticImg,
		goods:[
		{
		code: "0001",
		goodsName: '绿色无污染新鲜现摘水果小黄瓜',
		goodsPrice: '178.99',
		goodsYj: '178.99',
		img:'../../image/cp_tu.png',
		num: '1',
		},
		{
		code: "0002",
		goodsName: '绿色无污染新鲜现摘水果小黄瓜',
		goodsPrice: '178.99',
		goodsYj: '178.99',
		img:'../../image/cp_tu.png',
		num: '1',
		},
		],
		totalPrice:'0.00',
		num:'0',
		},
		// 单个选中
		change: function (e) {
		var that = this;
		const index = e.currentTarget.dataset.index; // 获取data- 传进来的index
		var goods = that.data.goods; // 获取购物车列表
		var selectAllStatus = that.data.selectAllStatus; //获取全选状态
		const selected = goods[index].selected; // 获取当前商品的选中状态
		goods[index].selected = !selected; // 改变状态
		goods[index]['selected'] = !selected;
		//判断有一个没有选中，全选取消
		var j = 0;
		for (var i = 0; i < goods.length; i++) {
		if (goods[i].selected == true) {
		j++;
		continue;
		} else {
		selectAllStatus = false;
		}
		}
		if (j == goods.length) {
		selectAllStatus = true;
		}
		//如果都选中，全选也选中实现
		that.setData({
		goods: goods,
		selectAllStatus: selectAllStatus,
		});
		//调用计算数目方法
		that.countNum()
		//计算金额
		that.count()
		},
		// 全选事件
		selectAll: function(e) {
		var that = this;
		var selectAllStatus = that.data.selectAllStatus; // 是否全选状态
		selectAllStatus = !selectAllStatus;
		var goods = that.data.goods;
		for (var i = 0; i < goods.length; i++) {
		goods[i].selected = selectAllStatus;
		goods[i]['selected'] = selectAllStatus; // 改变所有商品状态
		}
		that.setData({
		selectAllStatus: selectAllStatus,
		goods: goods
		});

		//调用计算数目方法
		that.countNum()
		//计算金额
		that.count()
		},
		//计算数量
		countNum: function () {
		var that = this
		//遍历数组，把既选中的num加起来
		var newList = that.data.goods
		var allNum = 0
		for (var i = 0; i < newList.length; i++) {
		if (newList[i].selected) {
		allNum += parseInt(newList[i].num)
		}
		}
		that.setData({
		num: allNum
		})
		},
		//计算金额方法
		count: function () {
		var that = this
		//选中的订单，数量*价格加起来
		var goodsPrice = parseFloat(that.data.goods.goodsPrice)
		var newList = that.data.goods
		var newCount = 0.00
		for (var i = 0; i < newList.length; i++) {
		if (newList[i].selected) {
		newCount += newList[i].goodsPrice * newList[i].num
		}
		}
		that.setData({
		// newCount: newCount.toFixed(2),
		totalPrice: newCount,
		})
		},

	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {

	},

	/**
	 * 生命周期函数--监听页面初次渲染完成
	 */
	onReady: function () {

	},

	/**
	 * 生命周期函数--监听页面显示
	 */
	onShow: function () {

	},

	/**
	 * 生命周期函数--监听页面隐藏
	 */
	onHide: function () {

	},

	/**
	 * 生命周期函数--监听页面卸载
	 */
	onUnload: function () {

	},

	/**
	 * 页面相关事件处理函数--监听用户下拉动作
	 */
	onPullDownRefresh: function () {

	},

	/**
	 * 页面上拉触底事件的处理函数
	 */
	onReachBottom: function () {

	},

	/**
	 * 用户点击右上角分享
	 */
	onShareAppMessage: function () {

	}
})