// pages/index/bkxq.js
Page({

	/**
	 * 页面的初始数据
	 */
	data: {
		activeIndex: 0,
		swiperList: [{
			id: 0,
			type: 'image',
			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big84000.jpg'
		}, 
		{
			id: 1,
			type: 'image',
			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big84001.jpg',
		},
		{
			 id: 2,
			 type: 'image',
				url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big39000.jpg'
		 }, 
		{
			id: 3,
			type: 'image',
			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big10001.jpg'
	 }],
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

	},
	changeImg(e) {
		let that = this
		that.activeIndex = e.detail.current
		this.setData({
		activeIndex: e.detail.current
		});
		// console.log(that.activeIndex);
		},
		showLength() {
		return this.swiperList.length
		},
})