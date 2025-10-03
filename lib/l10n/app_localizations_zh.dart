// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '游客安全应用';

  @override
  String get selectLanguage => '选择您的首选语言';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get assamese => 'অসমীয়া';

  @override
  String get bengali => 'বাংলা';

  @override
  String get tamil => 'தமிழ்';

  @override
  String get telugu => 'తెలుగు';

  @override
  String get gujarati => 'ગુજરાતી';

  @override
  String get punjabi => 'ਪੰਜਾਬੀ';

  @override
  String get kannada => 'ಕನ್ನಡ';

  @override
  String get malayalam => 'മലയാളം';

  @override
  String get marathi => 'मराठी';

  @override
  String get urdu => 'اردو';

  @override
  String get french => 'Français';

  @override
  String get german => 'Deutsch';

  @override
  String get chinese => '中文';

  @override
  String get nepali => 'नेपाली';

  @override
  String get continueText => '继续';

  @override
  String get phoneVerification => '手机验证';

  @override
  String get enterPhoneNumber => '输入您的手机号码';

  @override
  String get phoneHint => '+86-1XXXXXXXXXX';

  @override
  String get sendOtp => '发送验证码';

  @override
  String get enterOtp => '输入验证码';

  @override
  String get verifyOtp => '验证';

  @override
  String get invalidOtp => '验证码无效。请重试。';

  @override
  String verificationFailed(Object error) {
    return '验证失败：$error';
  }

  @override
  String get dashboard => '仪表盘';

  @override
  String get settings => '设置';

  @override
  String get alerts => '警报';

  @override
  String get family => '家人';

  @override
  String get safetyDashboard => '安全仪表盘';

  @override
  String get recentAlerts => '最近的警报';

  @override
  String get liveVitals => '实时生命体征';

  @override
  String get locationAndRisk => '位置与风险区域';

  @override
  String get restrictedZone => '限制区域';

  @override
  String get lowRiskZone => '低风险区域';

  @override
  String youAreInZone(Object zone) {
    return '您正处于$zone。请注意周围环境。';
  }

  @override
  String get safeCardTitle => '安全';

  @override
  String get safeCardDesc => '您当前的安全评分为优。请继续保持！';

  @override
  String get tourPlan => '旅行计划';

  @override
  String get quickActions => '快捷操作';

  @override
  String get familyTracking => '家人追踪';

  @override
  String get nearbyAttractions => '附近景点';

  @override
  String get weatherAlerts => '天气';

  @override
  String get offlineModeCached => '离线模式 - 显示缓存数据';

  @override
  String get bandConnected => '手环已连接';

  @override
  String lastUpdatedMins(Object mins) {
    return '最后更新于 $mins 分钟前';
  }

  @override
  String get heartRate => '心率';

  @override
  String get spo2 => '血氧饱和度 (SpO₂)';

  @override
  String get temperature => '体温';

  @override
  String get activity => '活动';

  @override
  String get normal => '正常';

  @override
  String get last1hHeartRate => '过去1小时心率';

  @override
  String get tourPlanComingSoon => '旅行计划页面即将推出';

  @override
  String comingSoon(Object feature) {
    return '$feature 即将推出';
  }

  @override
  String get shareLocationVitals => '分享我的位置和生命体征';

  @override
  String get enableToShare => '启用以与家人分享';

  @override
  String get sosAlerts => 'SOS 警报';

  @override
  String get sosAlertsDesc => '如果您触发SOS警报，家人将立即收到通知。';

  @override
  String get sharingWith => '正在与...分享';

  @override
  String get revokeAllSharing => '撤销所有分享';

  @override
  String get revokeAllSharingDesc => '这将停止与所有人分享您的位置和生命体征。';

  @override
  String get severeWeatherWarning => '恶劣天气警报';

  @override
  String get severeWeatherDesc => '国家气象局已对您所在的地区发布强雷暴警报。请立即寻找避难所。';

  @override
  String get noInternetCached => '无网络连接。正在显示缓存的警报。';

  @override
  String get appAlert => '应用警报';

  @override
  String get governmentAlert => '政府警报';

  @override
  String get acknowledge => '知道了';

  @override
  String get moreInfo => '更多信息';

  @override
  String get dismiss => '忽略';

  @override
  String get viewDetails => '查看详情';

  @override
  String get viewMap => '查看地图';

  @override
  String get checkVitals => '检查生命体征';

  @override
  String get dismissed => '已忽略';

  @override
  String get geoFenceWarning => '地理围栏警报';

  @override
  String get geoFenceWarningDesc => '艾米丽已离开酒店附近的“安全区”。';

  @override
  String get fallDetected => '检测到摔倒';

  @override
  String get fallDetectedDesc => '检测到大卫可能发生了摔倒。';

  @override
  String get lowBattery => '电量不足';

  @override
  String get lowBatteryDesc => '莎拉的安全手环电量为20%。';

  @override
  String get geoFenceAlert => '地理围栏警报';

  @override
  String get geoFenceAlertDesc => '您正在接近一个限制区域。请返回或谨慎前行。';

  @override
  String get returnToSafety => '返回安全区';

  @override
  String get proceedWithCaution => '谨慎前行';

  @override
  String get locating => '正在定位...';

  @override
  String get weather => '天气';

  @override
  String get currentWeather => '当前天气';

  @override
  String get feelsLike => '体感温度';

  @override
  String get humidity => '湿度';

  @override
  String get wind => '风速';

  @override
  String get today => '今天';

  @override
  String get tomorrow => '明天';

  @override
  String inXDays(Object days) {
    return '$days天后';
  }

  @override
  String get nextDaysTrend => '未来几日温度趋势';

  @override
  String get profile => '个人资料';

  @override
  String get verifiedMember => '已验证成员';

  @override
  String get securityVerification => '安全与验证';

  @override
  String get passport => '护照';

  @override
  String get wallet => '钱包';

  @override
  String get personalTravelDetails => '个人与旅行信息';

  @override
  String get nationality => '国籍';

  @override
  String get dateOfBirth => '出生日期';

  @override
  String get itinerary => '行程';

  @override
  String get emergencyContacts => '紧急联系人';

  @override
  String get addContact => '添加联系人';

  @override
  String get appSettings => '应用设置';

  @override
  String get notifications => '通知';

  @override
  String get theme => '主题';

  @override
  String get language => '语言';

  @override
  String get supportLegal => '支持与法律';

  @override
  String get helpCenter => '帮助中心';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get logOut => '退出登录';

  @override
  String get connected => '已连接';

  @override
  String get disconnected => '已断开';

  @override
  String get idLabel => 'ID';

  @override
  String get band => '手环';

  @override
  String get sendEmergencyAlert => '发送紧急警报？';

  @override
  String get sosDialogBody => '这将通知有关当局和您的紧急联系人。';

  @override
  String get cancel => '取消';

  @override
  String get sendSOS => '发送SOS';

  @override
  String get geofenceAlertShort => '地理围栏警报';

  @override
  String hoursAgo(Object hours) {
    return '$hours小时前';
  }

  @override
  String get tagFamily => '家庭';

  @override
  String get tagOpenAir => '户外';

  @override
  String get tagTickets => '门票';

  @override
  String get tagHistory => '历史';

  @override
  String get tagScenic => '风景';

  @override
  String get tagFree => '免费';

  @override
  String get shareLocation => '分享位置';

  @override
  String get shareMyLocation => '分享我的位置';

  @override
  String get shareLocationDesc => '允许家人查看您的实时位置。';

  @override
  String get sharingOptions => '分享选项';

  @override
  String get generateSharingToken => '生成分享二维码/令牌';

  @override
  String get revokeAccess => '撤销访问权限';

  @override
  String get generateSharingTokenMsg => '生成分享令牌 (模拟)';

  @override
  String get accessRevokedMsg => '已撤销所有家人的访问权限 (模拟)';

  @override
  String get settingsTheme => '主题';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsPrivacy => '隐私与安全';

  @override
  String get system => '跟随系统';

  @override
  String get light => '浅色模式';

  @override
  String get dark => '深色模式';

  @override
  String get mobileVerification => '手机验证';

  @override
  String get emailVerification => '电子邮件验证';

  @override
  String get phoneNumber => '手机号码';

  @override
  String get pleaseEnterPhone => '请输入手机号码';

  @override
  String get pleaseSelectLanguage => '请选择一种语言';

  @override
  String get verificationCodeSentMock => '验证码已发送 (模拟)。请输入任意6位数字。';

  @override
  String get changePhoneNumber => '更换手机号码';

  @override
  String get useDifferentEmail => '使用其他电子邮件';

  @override
  String get emailAddress => '电子邮件地址';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCodeToEmail => '我们将向此电子邮件发送验证码。';

  @override
  String get enterOtpPrompt => '输入发送到您手机的6位数验证码';

  @override
  String get invalidOtp6 => '验证码无效。请输入6位数字。';

  @override
  String get otpHint => '------';

  @override
  String get agreeToTerms => '继续即表示您同意条款和隐私政策。';

  @override
  String get terms => '条款';

  @override
  String get sendVerificationCode => '发送验证码';

  @override
  String get error => '错误';

  @override
  String get noData => '无数据';

  @override
  String get noDataDesc => '暂时没有可用数据';

  @override
  String get refresh => '刷新';

  @override
  String get addNewTrip => '添加新行程';

  @override
  String get noUpcomingTrips => '没有即将开始的行程。点击“添加新行程”来计划一个吧！';

  @override
  String get noPastTrips => '没有过去的行程';

  @override
  String get activitiesNotes => '活动/备注';

  @override
  String get searchLocation => '搜索地点';

  @override
  String get search => '搜索';

  @override
  String get searchHint => '输入地点名称或地址';

  @override
  String get noResultsFound => '未找到结果';
}
