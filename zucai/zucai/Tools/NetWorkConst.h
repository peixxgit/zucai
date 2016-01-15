//
//  NetWorkConst.h
//  Yosemite
//
//  Created by 安笑 on 15/5/20.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 注册和登陆
// 登陆
extern NSString *const NetWorkLogin;
/// 获取验证码
extern NSString *const NetWorkRegisterVerification
;

// 注册
extern NSString *const NetWorkRegister;

// 忘记密码
extern NSString *const NetWorkForgetPasswords;

// 找回密码获取验证码
extern NSString *const NetWorkFindPasswordVerification;

// 修改密码
extern NSString *const NetWorkPasswordsChange;

// 意见反馈
extern NSString *const NetWorkFeedback;
// 更改头像
extern NSString *const NetWorkChangeHeadImage;
// 修改昵称
extern NSString *const NetWorkChangeNickName;
// 每日签到
extern NSString *const NetWorkSignIn;

// 关于我们
extern NSString *const NetWorkAbout;
// 产品介绍
extern NSString *const NetWorkProductIntroduction;
// 客服电话
extern NSString *const NetWorkCustomerServiceTelephone;
// 首页顶部广告位
extern NSString *const NetWorkHomeADHTML5;
// 首页中部广告位
extern NSString *const NetWorkHomeMiddleADHTML5;
// 首页定位接口
extern NSString *const NetWorkHomeLocation;
// 首页推荐接口
extern NSString *const NetWorkHomeRecommend;
@interface NetWorkConst : NSObject

@end
