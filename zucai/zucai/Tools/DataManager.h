//
//  DataManager.h
//  iELearning
//
//  Created by MAC on 12/06/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#define isPortraitPad ([[UIApplication sharedApplication] statusBarOrientation]== UIDeviceOrientationPortrait||[[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortraitUpsideDown)
//横屏
#define isLandscapePad ([[UIApplication sharedApplication] statusBarOrientation]==UIDeviceOrientationLandscapeLeft|| [[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationLandscapeRight)

#define MAIN_SCREEN_WIDTH (isPortraitPad ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

#define MAIN_SCREEN_HEIGHT (isPortraitPad ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define ZOOM(length) (length)*((isPortraitPad ? MAIN_SCREEN_WIDTH : MAIN_SCREEN_HEIGHT)) /320.0

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
// 高德地图apikey
#define APIKEY @"67f6725bbe22c3f7d922ad68331d8a5d"


#import <Foundation/Foundation.h>
#import "UIColor+ColorExtension.h"
#import <Masonry.h>
#import "UserInfoModel.h"
#import "Config.h"
@interface DataManager : NSObject


@property (readwrite) BOOL autoScroll;
@property (readwrite) BOOL updateInfo;
@property (strong, nonatomic) NSString *host;
@property (strong, nonatomic) NSString *hostURL;
@property (readwrite) int maxDownloadOperationCount;
@property (readonly, nonatomic) BOOL isLogin;


@property (strong, nonatomic) UserInfoModel *userInfo;

+ (DataManager *)sharedManager;
- (void)getUserMessage: (NSDictionary *)userDic;
- (void)clearUserMessage;
- (void)getUserMessageFromUserDefaults;
- (NSURL *)appendHTMLURL:(NSURL *)url;


@end
