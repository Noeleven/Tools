use tingyun
TRUNCATE table api;
INSERT INTO `api` (`method`,`des`,`version`)
VALUES
('api.com.user.updateContact','修改联系人信息','1.0.0'),
('api.com.goods.getGoodsList','酒店房型列表','1.0.0'),
('api.com.init.config','获取推送配置','1.0.0'),
('api.com.hotel.search.keywordAutoComplete','7.1酒店搜索关键字自动补全','1.0.0'),
('api.com.route.order.checkRouteOrder','线路下单校验','1.0.0'),
('api.com.search.searchHotel','酒店搜索','1.0.0'),
('api.com.resorthotel.getGoodsList','度假酒店房型列表','1.0.0'),
('api.com.train.trains.findTrainsByCondition','站站车次查询','1.0.0'),
('api.com.route.product.getRouteProductGroupDate','线路团期表','1.0.0'),
('api.com.hotel.search.destinationAutoComplete','7.1酒店搜索目的地自动补全','1.0.0'),
('api.com.route.search.searchRoute','线路搜索','1.0.0'),
('api.com.train.city.selectall','获取全部有效城市','1.0.0'),
('api.com.ticket.weather.getWeatherInfo','获取天气预报信息（7.4）','1.0.0'),
('api.com.user.updateUserInfo','更新用户基本信息','1.0.0'),
('api.com.cmt.addUsefulCount','点赞数加一接口','1.0.0'),
('api.com.duiba.get.userpoint','获取用户点数','1.0.0'),
('api.com.ticket.goods.getGoods','门票商品列表接口','1.0.0'),
('api.com.comment.getCmtComment','获取新系统点评','1.0.0'),
('api.com.validateCode.checkImageAuthCode','校验【注册】是否需要图片验证码','1.0.0'),
('api.com.user.sso.login','客户端【普通登录】接口','1.0.0'),
('api.com.favorite.addFavorite','新版添加收藏','1.0.0'),
('api.com.user.getOrderCmtLatitudes','获得订单点评维度','1.0.0'),
('api.com.validateCode.register','发送【注册】短信验证码接口','1.0.0'),
('api.com.duiba.deduct.point','','1.0.0'),
('api.com.customizaion.getCusProductDetails','获取定制游产品详细信息','1.0.0'),
('api.com.user.getMoneyInfo','获取缓存中的用户信息','1.0.0'),
('api.com.order.guessEnjoy','支付完成页面，猜你喜欢','1.0.0'),
('api.com.groupbuy.getGroupbuyOrSecKillDetail','查询团购/秒杀详情','1.0.0'),
('api.com.visa.product.getVisaGroupDate','签证时间价格接口','1.0.0'),
('api.com.user.getCoupon','获取优惠券列表','1.0.0'),
('api.com.product.getProductDetail','查询酒店详情','1.0.0'),
('api.com.route.search.searchRouteOutbound','线路搜索列表-出境游','1.0.0'),
('api.com.ship.getShipGoods','获取邮轮舱房','1.0.0'),
('api.com.user.sso.fastlogin.getMsgAuthCode','【快速登录】获取短信验证码','1.0.0'),
('api.com.route.order.countRoutePrice','【免登陆快捷下单】线路计算价格','1.0.0'),
('api.com.trip.hotDestList','热门目的地接口','1.0.0'),
('api.com.user.geteTicketDetail','电子票详情','1.0.0'),
('api.com.validateCode.createNewValidateCode','生成【登录/注册/匿名下单】图片验证码','1.0.0'),
('api.com.ticket.order.inputTicketOrder','门票填写订单','1.0.0'),
('api.com.trip.other.postlosc','下单后LOSC码提交接口','1.0.0'),
('api.com.user.geteTicket','电子票列表','1.0.0'),
('api.com.user.getUserProvinceCities','查询指定的省市信息列表','1.0.0'),
('api.com.cmt.getLatitudeScores','获取各品类点评维度评分','1.0.0'),
('api.com.ship.computeRoomsAndPriceByPersons','计算邮轮房间数和价格','1.0.0'),
('api.com.route.order.createOrder','【免登陆快捷下单】创建订单','1.0.0'),
('api.com.route.search.searchRouteInland','线路搜索列表-国内游','1.0.0'),
('api.com.groupbuy.getHotCollections','查询爆款频道页数据','1.0.0'),
('api.com.anonymous.order.checkImageAuthCode','校验【匿名下单】是否需要图形验证码','1.0.0'),
('api.com.train.other.contacts','获取乘客','1.0.0'),
('api.com.biz.synTime','为Android提供时间同步接口','1.0.0'),
('api.com.groupbuy.getMyRemindingList','我的提醒列表(7.4版本)','1.0.0'),
('api.com.home.homeSearch','首页搜索改版查询爆款频道页数据','1.0.0'),
('api.com.ship.search.searchShip','邮轮搜索','1.0.0'),
('api.com.user.getUser','查询用户个人信息','1.0.0'),
('api.com.groupbuy.getAbroadIndexList','首页出境游(7.1版本)','2.0.0'),
('api.com.groupbuy.getArroundIndexList','首页周边游(7.1版本)','2.0.0'),
('api.com.groupbuy.getSeckillListByProductMark','获取秒杀的列表By产品标签（尾品爆款秒杀）(7.4版本)','1.0.0'),
('api.com.groupbuy.getShipIndexList','首页游轮(7.1版本)','2.0.0'),
('api.com.resorthotel.getGoodsDetail','度假酒店房型详情','1.0.0'),
('api.com.duiba.handle.duibanotice','','1.0.0'),
('api.com.route.order.inputRouteOrder','线路填写订单','1.0.0'),
('api.com.train.trains.findSeatsByCondition','站站坐席查询','1.0.0'),
('api.com.other.checkVersion','检查客户端版本接口','1.0.0'),
('api.com.route.search.searchRouteAround','线路搜索列表-周边游','1.0.0'),
('api.com.order.getRefundReasons','获取退款原因','1.0.0'),
('api.com.order.getRefundProgressDetails','获取退款详情接口','1.0.0'),
('api.com.ticket.order.createOrder','提交门票订单','1.0.0'),
('api.com.train.other.getLvUser','获取登录用户信息','1.0.0'),
('api.com.order.cancellOrder','取消订单','1.0.0'),
('api.com.route.quickorder.registerQuickOrder','【免登陆快捷下单】填写订单','1.0.0'),
('api.com.route.search.chanelPageAroudRoute','客户端7.5版本周边游频道页里面酒+景跟团游亲子游接口标签调用的接口','1.0.0'),
('api.com.user.sso.fastlogin','客户端【短信验证码快速登陆】接口','1.0.0'),
('api.com.msgcenter.getRedPoint','查看消息中心未读个数','1.0.0'),
('api.com.duiba.freelogin.url','兑吧免登陆url','1.0.0'),
('api.com.ticket.goods.getCombProductDetail','获取门票套餐产品详情','1.0.0'),
('api.com.order.getWaitPaymentTimeSecond','获取支付等待时间','1.0.0'),
('api.com.hotel.search.getHomeHotelConditions','7.1酒店搜索首页获取价格/星级','1.0.0'),
('api.com.groupbuy.getTicketIndexList','首页门票(7.1版本)','2.0.0'),
('api.com.groupbuy.getSellPackageInfo','秒杀团购详情页套餐接口(7.4版本)','1.0.0'),
('api.com.user.getNewCouponCount','计算优惠券数量','1.0.0'),
('api.com.visa.product.province','选择省份接口','1.0.0'),
('api.com.route.search.autoCompleteRoute','线路搜索自动补全','1.0.0'),
('api.com.trip.dest.searchRouteAround','目的地聚合页-主题页面的线路列表','1.0.0'),
('api.com.user.anonymous.order.getMsgAuthCode','发送【匿名下单】短信验证码接口','1.0.0'),
('api.com.seckill.getSeckillStatus','获取秒杀状态','1.0.0'),
('api.com.hotel.search.getHotelCities4H5','7.3.2度假酒店搜索酒店城市列表','1.0.0'),
('api.com.route.traffic.changeTraffic','线路更换交通since7.4','1.0.0'),
('api.com.ticket.product.getDetails','门票产品详情','1.0.0'),
('api.com.ship.computeRoomsAndPrice','计算邮轮房间数和价格','1.0.0'),
('api.com.user.sso.register','客户端【普通注册】接口','1.0.0'),
('api.com.favorite.getFavoriteList','新版收藏列表','1.0.0'),
('api.com.order.getOrder','查询机票火车票，VST订单详情','1.0.0'),
('api.com.init.addDeviceToken','初始化token','1.0.0'),
('api.com.route.common.product.getRouteDetails','查询线路产品详情（7.5）','1.0.0'),
('api.com.user.getContact','获取用户相关的所有联系人','1.0.0'),
('api.com.pass.getVstPassInfos','获得vst通过信息','1.0.0'),
('api.com.route.search.searchAllCategory','7.4线路搜索列表-出境游-搜索频道','1.0.0'),
('api.com.groupbuy.getIndexSeckillList','获取APP首页立即抢秒杀产品列表(7.4版本)','1.0.0'),
('api.com.ticket.search.searchTicket','门票搜索','1.0.0'),
('api.com.user.getBonusInfo','','1.0.0'),
('api.com.order.getOrderList','按状态查询订单列表','1.0.0'),
('api.com.train.callback.draw','出票通知回调','1.0.0'),
('api.com.ship.getProductDetail','获取组合邮轮详情','1.0.0'),
('api.com.route.product.getRouteDetails','线路产品详情','1.0.0'),
('api.com.validateCode.login.checkImageAuthCode','校验【登录】是否需要图形验证码','1.0.0'),
('api.com.trip.dest.destHomePageCount','目的地聚合页景点酒店签证button数量','1.0.0'),
('api.com.resorthotel.order.inputOrder','度假酒店填写订单','1.0.0'),
('api.com.resorthotel.getMoneyDetails','度假酒店费用明细','1.0.0'),
('api.com.route.quickorder.countRoutePriceQuickOrder','【免登陆快捷下单】线路快捷下单计算价格','1.0.0'),
('api.com.goods.getPopInfo','填写订单页弹出层','1.0.0'),
('api.com.groupbuy.getGroupbuyIndex','查询团购首页数据','1.0.0'),
('api.com.groupbuy.getSynchronProductList','同步提醒产品(7.4版本)','1.0.0'),
('api.com.order.getRedPointCount','显示红点数合并接口','1.0.0'),
('api.com.groupbuy.getChinaIndexList','首页国内游(7.1版本)','2.0.0'),
('api.com.hotel.search.getHotelCities','7.1酒店搜索酒店城市列表','1.0.0'),
('api.com.route.order.getUserCouponList','获得适用该订单且用户下的有效的优惠券','1.0.0'),
('api.com.cmt.getCmtLatitudesByPlaceId','通过目的地获取点评维度','1.0.0'),
('api.com.search.autoCompleteHotelCities','酒店搜索城市列表','1.0.0'),
('api.com.cmt.cutUsefulCount','点赞数减一接口','1.0.0'),
('api.com.ticket.quickorder.countQuickTicketPrice','门票快捷下单计算价格','1.0.0'),
('api.com.ship.getShipIntroduction','获取邮轮介绍','1.0.0'),
('api.com.pass.getVstPassImage','获得vst通关码图片','1.0.0'),
('api.com.tdk.queryTdkRule','查询TitleDescriptionTitle规则','1.0.0'),
('api.com.ticket.goods.getGoodsTimePrice','门票时间价格表','1.0.0'),
('api.com.cmt.getCmtCommentList','点评列表','1.0.0'),
('api.com.visa.product.search','签证产品(规格)列表','1.0.0'),
('api.com.version.redirectUrl','版本号跳转重定向','1.0.0'),
('api.com.search.searchRouteHotel','7.4.1首页搜索酒店tab页用','1.0.0'),
('api.com.ticket.search.autoCompleteTicket','门票搜索自动补全','1.0.0'),
('api.com.comment.getHotelComments','获取酒店评论','1.0.0'),
('api.com.ticket.goods.getGoodsDetail','门票商品详情','1.0.0'),
('api.com.trip.dest.destInfo','目的地信息接口','1.0.0'),
('api.com.file.uploadImg','上传图片接口','1.0.0'),
('api.com.ticket.order.checkTicketOrder','门票下单校验','1.0.0'),
('api.com.user.geteTicketCount','电子票数量','1.0.0'),
('api.com.train.date.holiday','预售天内的节假日','1.0.0'),
('api.com.user.addContact','新增联系人','1.0.0'),
('api.com.route.order.getContractUrls','获取合同','1.0.0'),
('api.com.order.paySuccess','订单成功页面','1.0.0'),
('api.com.group.getGroupBuyStatus','获取团购状态','1.0.0'),
('api.com.cmt.getCmtActivity','获取点评活动通知接口','1.0.0'),
('api.com.home.getStations','新版获取出发站点信息（7.2）','1.0.0'),
('api.com.ticket.quickorder.checkTicketQuickOrder','校验门票快捷下单订单','1.0.0'),
('api.com.route.search.getFreeTourFromTicet','自由行/景+酒搜索','1.0.0'),
('api.com.search.getVerPlaceList','酒店搜索获取地标商圈和景区','1.0.0'),
('api.com.ticket.order.getTicketCircusActInfos','获长隆门票场次信息（7.4）','1.0.0'),
('api.com.order.createOrder','创建酒店订单','1.0.0'),
('api.com.groupbuy.getGroupbuyList','查询团购列表页数据','1.0.0'),
('api.com.route.product.getRouteProductLine','线路详情页-行程tab','1.0.0'),
('api.com.ship.getTimePrice','获取时间价格表','1.0.0'),
('api.com.user.sso.validate.msgauthcode.register','校验【注册】短信验证码','1.0.0'),
('api.com.user.getAddress','获取常用地址','1.0.0'),
('api.com.ticket.order.countTicketPrice','门票订单计算总价','1.0.0'),
('api.com.favorite.cancelFavorite','新版取消收藏','1.0.0'),
('api.com.visa.product.getVisaDetails','签证产品(规格)详情接口','1.0.0'),
('api.com.ticket.quickorder.inputTicketQuickOrder','【免登陆快捷下单】门票快捷下单填写订单','1.0.0'),
('api.com.order.getOrderByProductType','按产品类别查询订单','1.0.0'),
('api.com.train.insurance.getTrafficInsurances','保险查询','1.0.0'),
('api.com.ticket.order.getUserCouponList','门票获取优惠券列表（7.3）','1.0.0'),
('api.com.route.product.getProductPropertyList','获取产品属性及推荐项目','1.0.0'),
('api.com.hotel.search.getKeyWordsCondition','获取关键字选择条件','1.0.0'),
('api.com.train.order.deleteorder','取消订单','1.0.0'),
('api.com.trip.other.destShare','微游模块目的地分享','1.0.0'),
('api.com.train.callback.refund','退票回调（赶火车网退票回调请求）','1.0.0'),
('api.com.groupbuy.getWeekHotCollections','7.5周爆款产品列表','1.0.0'),
('api.com.trip.client.focus','获取推荐位轮播内容','1.0.0'),
('api.com.wifi.getFetchCityList','wifi下单取/还件城市列表','1.0.0'),
('api.com.user.getBonusPayment','查询奖金存款支出记录','1.0.0'),
('api.com.user.getBindingInfo','绑定手机号时是否需要首笔订单验证','1.0.0'),
('api.com.advertise.behavior','DPS广告推送，将用户轨迹，已经订单行为推送到广告商','1.0.0'),
('api.com.validateCode.resendMsgCode','正常注册-重新获取短信验证码','1.0.0'),
('api.com.user.deleteAddress','删除常用地址','1.0.0'),
('api.com.trip.poi.search','poi搜索列表接口','1.0.0'),
('api.com.trip.destPoiList','首页-目的地-POI详情-附近POI地点列表接口','1.0.0'),
('api.com.route.common.product.getOneLineDetail','单个行程的行程详情','1.0.0'),
('api.com.train.order.getPayChannel','查询订单支付方式','1.0.0'),
('api.com.ship.countPrice','计算邮轮订单总价','1.0.0'),
('api.com.login.union.alipay.getRequestMsg','支付宝SDK登录报文生成','1.0.0'),
('api.com.ship.getShipGoodsAddition','获取邮轮附加项','1.0.0'),
('api.com.user.getCommentLatitudeInfos','','1.0.0'),
('api.com.resorthotel.createHotelQuickOrder','快捷下单','1.0.0'),
('api.com.train.activity.checkQualification','检查活动参加资格','1.0.0'),
('api.com.ship.computeRoomsAndPriceByBatch','游轮批量计算房间数和价格','1.0.0'),
('api.com.groupbuy.getGroupbuyListByProductMark','据产品标签取团购秒杀产品(7.5版本)','1.0.0'),
('api.com.order.getDesBuCancelReasons','目的地事业部酒店订单取消原因(7.5)','1.0.0'),
('api.com.ship.commitShipOrder','提交邮轮订单','1.0.0'),
('api.com.wifi.getDetails','wifi/电话卡商品商品详情页','1.0.0'),
('api.com.train.activity.currentActivity','获取当前的活动以及是否可参加','1.0.0'),
('api.com.order.cashPay','现金支付','1.0.0'),
('api.com.order.getIWATCHOrderList','IWatch订单列表按品类游玩时间排序','1.0.0'),
('api.com.route.common.product.getHotelDetail','行程结构化酒店详情','1.0.0'),
('api.com.trip.dest.guideBook','目的地攻略-获取目的地指南列表','1.0.0'),
('api.com.visa.order.createOrder','签证下单接口','1.0.0'),
('api.com.wifi.searchWifi','wifi商品搜索列表','1.0.0'),
('api.com.ticket.goods.getDistricts','门票行政区','1.0.0'),
('api.com.store.storelist','门店列表','1.0.0'),
('api.com.trip.dest.getSeoVO','根据目的地id获取是否国外父级目的地名称当前目的地名称等信息','1.0.0'),
('api.com.cmt.getShareContent','获取订单成功被点评后的分享信息','1.0.0'),
('api.com.user.isStrategyCollected','','1.0.0'),
('api.com.trip.dest.search','目的地聚合页-主题页面的线路列表','1.0.0'),
('api.com.wifiphonecard.order.inputWifiPhoneCardOrder','wifi/电话卡下单必填项以及下单页面基本信息接口','1.0.0'),
('api.com.cmt.wirteComment','写点评接口','1.0.0'),
('api.com.train.order.submitorder','提交订单到本地数据库','1.0.0'),
('api.com.certif.findEbkCertifByOrderIdAndCertifId','查询指定订单与凭证对应的详细信息，包括订单信息游客信息','1.0.0'),
('api.com.wifi.order.createWifiOrder','wifi/电话卡创建订单接口','1.0.0'),
('api.com.cmt.getRecommendedComments','7.5获取点评成功页的推荐点评信息','1.0.0'),
('api.com.file.baseUploadImg','上传图片','1.0.0'),
('api.com.visa.order.input','订单输入接口','1.0.0'),
('api.com.trip.note.hot','首页热门推荐游记接口','1.0.0'),
('api.com.groupbuy.updateRemindStatus','增加提醒的接口','1.0.0'),
('api.com.user.removeContact','删除联系人信息','1.0.0'),
('api.com.route.product.getProdStartDistrictForSale','产品的出发地列表','1.0.0'),
('api.com.train.order.displayorder','订单列表','1.0.0'),
('api.com.certif.findEbkEnquiryCertifListByParams','查询符合条件的EBK询占单信息支持分页查询','1.0.0'),
('api.com.order.checkOrder','校验订单','1.0.0'),
('api.com.pass.getPassInfos','获得super通过信息','1.0.0'),
('api.com.wifi.order.countWifiPrice','wifi/电话卡计算价格接口','1.0.0'),
('api.com.visa.order.countVisaPrice','计算总价接口','1.0.0'),
('api.com.confirm.findEbkConfirmCertifCountByParams','统计符合条件的EBK确认单数','1.0.0'),
('api.com.announcement.getEbkAnnouncementById','公告详情','1.0.0'),
('api.com.order.getIntentionOrder','意向单详情','1.0.0'),
('api.com.other.getIosHotfix','IOS热修复获取文件信息（sincev7.5）','1.0.0'),
('api.com.route.search.searchChanelPageAroudHotel','客户端7.5版本周边游频道页里面酒店搜索标签调用的接口','1.0.0'),
('api.com.announcement.getEbkAnnouncementListPrams','公告列表','1.0.0'),
('api.com.wifiphonecard.getDestList','根据关键词获取目的地列表','1.0.0'),
('api.com.order.activityShareSuccess','订单支付完成页活动-分享完成记录','1.0.0'),
('api.com.visa.order.check','检查订单（游玩人信息）','1.0.0'),
('api.com.visa.order.wechatvisasearch','微信签证审核信息查询接口','1.0.0'),
('api.com.train.losc.addLosc','添加火车票Losc','1.0.0'),
('api.com.route.product.getRouteNotice','线路详情页-须知tab','1.0.0'),
('api.com.certif.findEbkEnquiryCertifCountByParams','统计符合条件的EBK询占单数','1.0.0'),
('api.com.route.common.product.getScenicDetail','行程结构化景点详情','1.0.0'),
('api.com.search.searchGroupbuy','查询团购列表','1.0.0'),
('api.com.route.order.commitIntentionOrder','提交意向订单','1.0.0'),
('api.com.wifi.getWifiFetchCityInfo','wifi详情页内的取还信息接口','1.0.0'),
('api.com.resorthotel.order.getUserCouponList','获取该产品下用户可用优惠券列表','1.0.0'),
('api.com.trip.dest.feedback','目的地详情页反馈（想去去过）接口','1.0.0'),
('api.com.wifi.getFetchSiteList','wifi下单取/还件网点列表','1.0.0'),
('api.com.user.commitPayment','提交充值','1.0.0'),
('api.com.ticket.weather.getForeignWeatherInfo','获取国外天气预报信息（7.4.1）','1.0.0'),
('api.com.order.reSendVstOrderSms','重发短信凭证','1.0.0'),
('api.com.trip.dest.autoComplete','搜索自动完成提示数据接口','1.0.0'),
('api.com.user.updateAddress','修改常用地址','1.0.0'),
('api.com.validateCode.createValidateCodeService','创建验证码','1.0.0'),
('api.com.home.keyWordHomeSearch','客户端7.5版本开始首页搜索输入关键词后直接点击搜索调用的接口','1.0.0'),
('api.com.hotel.search.getBrandCitiesList','酒店补全后点击跳转的城市列表数据','1.0.0'),
('api.com.user.userLoginByUserNameAndPassword','用户登录验证','1.0.0'),
('api.com.resorthotel.order.checkOrder','校验订单','1.0.0'),
('api.com.user.getBonusIncome','查询奖金存款收入记录','1.0.0'),
('api.com.certif.updateEbkCertifStatus','更新指定订单与凭证对应的详细信息，包括订单信息游客信息','1.0.0'),
('api.com.store.localstore','获取当前所在地门店信息','1.0.0'),
('api.com.ship.order.getUserCouponList','获取游轮可用优惠券列表','1.0.0'),
('api.com.visa.sendAuthCodeMsg','微信签证查询接口发送短信','1.0.0'),
('api.com.route.outer.product.getOutLineDetail','出境行程详情','1.0.0'),
('api.com.phonecard.searchPhoneCard','电话卡商品搜索列表','1.0.0'),
('api.com.trip.client.hotdests','推荐目的地接口[新]','1.0.0'),
('api.com.trip.dest.more','更多目的地接口[新]','1.0.0'),
('api.com.visa.product.mail','发送邮件接口','1.0.0'),
('api.com.msgcenter.getPushMsgList','获取用户的推送消息列表','1.0.0'),
('api.com.trip.other.poiCommentsShare','微游点评成功页分享','1.0.0'),
('api.com.order.bonusPay','奖金支付','1.0.0'),
('api.com.trip.relatedGuideList','目的地攻略-相关攻略列表接口','1.0.0'),
('api.com.order.getSplitPayChannel','获取分单支付渠道','1.0.0'),
('api.com.groupbuy.deleteRemindStatus','删除提醒的接口','1.0.0'),
('api.com.user.addAddress','新增常用地址','1.0.0'),
('api.com.wifi.order.getWifiTimePrice','获取wifi下单页的时间价格表','1.0.0'),
('api.com.trip.dest.details','目的地的详情接口','1.0.0'),
('api.com.trip.dest.pic','目的地详情页照片墙接口','1.0.0'),
('api.com.route.order.showContract','展示合同','1.0.0'),
('api.com.announcement.getEbkAnnouncementCount','公告数目','1.0.0'),
('api.com.trip.note.search','游记查询接口[新]','1.0.0'),
('api.com.train.orderdetail.displaydetails','订单详情','1.0.0'),
('api.com.user.submitCmt','提交点评','1.0.0'),
('api.com.ship.checkTimePrice','检查邮轮订单时间价格表','1.0.0'),
('api.com.route.out.getLatestContacts','填写订单页加载最近联系人是否支持意向单since7.5','1.0.0'),
('api.com.user.getPaymentTarget','充值方式选择页面','1.0.0'),
('api.com.product.getPlaceRoutes','获得景点的相关自由行产品','1.0.0'),
('api.com.train.timetable.getTimetable','获取火车时刻表','1.0.0'),
('api.com.trip.aroundDestList','周边目的地列表接口','1.0.0'),
('api.com.order.commitOrdRefundOnline','提交退款申请','1.0.0'),
('api.com.order.listCreditCard','获取酒店订单信用卡列表','1.0.0'),
('api.com.trip.dest.getDestDomestic','目的地攻略-首页-世界-国内-目的地接口（按区域）','1.0.0'),
('api.com.customizaion.getDataForListPage','获取定制游列表页所需的数据','1.0.0'),
('api.com.order.cancelIntentionOrder','取消意向单','1.0.0'),
('api.com.confirm.findEbkConfirmCertifListByParams','查询符合条件的EBK确认单信息支持分页查询','1.0.0'),
('api.com.user.updateImage','更新用户头像','1.0.0'),
('api.com.tdk.queryTdkRules','tdk','1.0.0'),
('api.com.order.inputOrder','填写酒店订单','1.0.0'),
('api.com.trip.destPoiListTop3','附近POI地点列表接口(仅返回前三排名)','1.0.0'),
('api.com.recommend.getGuideRecommendCities','获得攻略推荐城市数据-国外','1.0.0'),
('api.com.search.searchGroupbuyIndex','查询团购列表','1.0.0'),
('api.com.trip.dest.poiDetail','POI详情接口','1.0.0'),
('api.com.route.inner.product.getInnerLineDetail','国内行程结构化接口信息since7.5','1.0.0'),
('api.com.ship.checkShipTravel','游轮提交游玩人和紧急联系人','1.0.0'),
('api.com.search.autoCompleteHotel','酒店自动补全','1.0.0'),
('api.com.route.product.getLocalRouteDetail','关联销售里的当地游产品详情（只有产品特色行程须知）','1.0.0'),
('api.com.wifi.findWifiListCity','获取筛选条件中的取还城市id','1.0.0'),
('api.com.cmt.getPicMarks','7.5拉取点评标签','1.0.0'),
('api.com.trip.relatedGuideInfo','目的地攻略-攻略详情接口','1.0.0'),
('api.com.trip.dest.poiList','首页-目的地-POI详情-附近POI地点列表接口','1.0.0'),
('api.com.wifi.order.checkWifiOrder','wifi/电话卡校验订单接口','1.0.0'),
('api.com.trip.destSummary','首页-目的地-目的地相关概要信息','1.0.0'),
('api.com.login.union.alipay','支付宝联合登录接口','1.0.0'),
('api.com.user.getBonusRefund','查询奖金存款退款记录','1.0.0'),
('api.com.trip.destNote','目的地攻略-目的地指南子栏目信息','1.0.0'),
('api.com.train.orderdetail.displayrefundapplication','列出可退票的乘客','1.0.0'),
('api.com.train.order.refundorder','申请退票','1.0.0'),
('api.com.trip.domesticAboraddestList','首页-我在-定位-国家地区目的地列表接口','1.0.0'),
('api.com.common.getVacations','获取节假日（sincev7.5）','1.0.0'),
('api.com.train.order.cancelorder','取消订单','1.0.0'),
('api.com.other.subSuggest','意见反馈提交(@version7.4.1接口迁移)','1.0.0'),
('api.com.ship.search.autoCompleteShip','邮轮搜索自动补全','1.0.0'),
('api.com.route.quickorder.createOrderQuickOrder','快捷匿名下单','1.0.0'),
('api.com.wifi.order.checkTimePrice','wifi/电话卡计算价格之前校验时间价格表接口','1.0.0'),
('api.com.msgcenter.pushCallBack','打开推送消息的回调','1.0.0'),
('api.com.train.other.addContact','添加/修改乘客信息','1.0.0'),
('api.com.pass.getPassImage','获得super通关码图片','1.0.0'),
('api.com.order.cancelOrder','取消酒店订单','1.0.0'),
('api.com.customizaion.createCustomization','产品定制','1.0.0'),
('api.com.file.getIcon','图片压缩','1.0.0'),
('api.com.token.saveEbkUserToken','保存tokenIMIS系统唯一标识用户供应商用户信息','1.0.0'),
('api.com.trip.recommendTravelList','目的地攻略-推荐行程列表接口','1.0.0'),
('api.com.trip.dest.getAbroadCountry','目的地攻略-首页-世界-国外-目的地接口（按大洲）','1.0.0'),
('api.com.route.product.getRouteLineDetail','行程详情（时间价格表页面）','1.0.0'),
('api.com.trip.client.areadests','搜索-国内国外热门目的地列表接口','1.0.0'),
('api.com.cmt.getRelatedList','相关点评列表','1.0.0'),
('api.com.groupbuy.getSeckillProductsByMark','根据时间和产品标签获取秒杀产品列表','1.0.0'),
('api.com.groupbuy.ticket.order.countTicketPrice','门票订单计算总价','1.0.0'),
('api.com.groupbuy.ticket.order.createOrder','提交门票订单','1.0.0'),
('api.com.groupbuy.ticket.order.inputTicketOrder','门票填写订单','1.0.0'),
('api.com.pass.getVstPassPdf','获得vst通关码图片','1.0.0'),
('api.com.route.goods.findGoodsTimePrice','商品的价格日历表','1.0.0'),
('api.com.route.goods.getHotelCombGoodsInfo','酒店套餐产品底下的商品集合接口','1.0.0'),
('api.com.user.addOrderContact','订单内游玩人保存（国内线路）','1.0.0'),
('api.com.user.addShipOrderContact','订单内游玩人保存（游轮）','1.0.0'),
('/clutter/client/validateAuthenticationCode.do','短信校验码校验',''),
('/clutter/mobile/html5/order/getGroupAdviceNote.do','获取团体通知',''),
('/clutter/client/firstLogIn.do','首次登录',''),
('/clutter/client/sendMobileAuthMessage.do','发送手机短信验证码',''),
('/clutter/client/refreshSessionId.do','刷新session',''),
('/clutter/client/updateUserPhone.do','更换手机',''),
('/clutter/client/updateUserPassWorld.do','更改密码',''),
('/clutter/client/sendAuthCode.do','发送图形验证码',''),
('/clutter/client/getSessionId.do','获取session',''),
('/*.html','html文件',''),
('/*.css','css文件',''),
('/clutter/router/rest.do','',''),
('POST/*.htm','htm文件',''),
('/login.asp','登录页',''),
('/clutter(null)','',''),
('/client-service/router/rest.do','',''),
('/new/api/router/rest.do','',''),
('/api/router/rest.do','',''),
('/trip/router/rest.do','',''),
('/clutter/trainPay/toPay.do','火车支付',''),
('/clutter/flightPay/toPay.do','飞机支付',''),
('/clutter/hotelPay/toPay.do','酒店支付',''),
('/activity/index.php','',''),
('/bullet/index.php','',''),
('/bullet/index.php?s=/Api/autoStation','',''),
('/bullet/index.php?s=/Api/getBootAd','获取引导广告',''),
('/bullet/index.php?s=/HtmlLocalization/getAppImage','获取APP首页图片',''),
('/bullet/index.php?s=/Api/getInfos','','');


TRUNCATE table ty_host;
INSERT INTO ty_host (`host_id`,`des`)
VALUES
('424892','api3g2'),
('424891','api3g'),
('41699','mlvmama');


