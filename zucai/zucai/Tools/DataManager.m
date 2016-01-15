//
//  DataManager.m
//  iELearning
//
//  Created by MAC on 12/06/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager



-(id) init{
    self = [super init];
    
    if (self){
        _maxDownloadOperationCount = 5;

        _host = @"mysqapp.qweweq.com/index.php/app/index/";
        
        _hostURL = [NSString stringWithFormat:@"http://%@",_host];
        _userInfo = [[UserInfoModel alloc]init];
        
    }
    return self;
}
- (void)getUserMessage: (NSDictionary *)userDic {
    NSError *error = nil;
//    self.userInfo = [[UserInfoModel alloc]initWithDictionary:userDic error:&error];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:_userInfo.userId forKey:@"uid"];
//    [userDefaults setObject:_userInfo.face forKey:@"face"];
//    [userDefaults setObject:_userInfo.cnname forKey:@"nickname"];
//    [userDefaults setObject:_userInfo.username forKey:@"username"];
//    [userDefaults setObject:_userInfo.integral forKey:@"integral"];
//    [userDefaults setObject:_userInfo.wallet forKey:@"wallet"];
//    [userDefaults setObject:_userInfo.sum forKey:@"sum"];
    
    [userDefaults synchronize];
}


- (void)clearUserMessage {
    
//    self.userInfo.userId = nil;
//    self.userInfo.face = nil;
//    self.userInfo.cnname = nil;
//    self.userInfo.username = nil;
//    self.userInfo.integral = nil;
//    self.userInfo.wallet = nil;
//    self.userInfo.sum = nil;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"" forKey:@"uid"];
    [userDefaults setObject:@"" forKey:@"avatar"];
    [userDefaults setObject:@"" forKey:@"nickname"];
    [userDefaults setObject:@"" forKey:@"username"];
    [userDefaults setObject:@"" forKey:@"integral"];
    [userDefaults setObject:@"" forKey:@"wallet"];
    [userDefaults setObject:@"" forKey:@"downpeople"];
}
- (void)getUserMessageFromUserDefaults {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    self.userInfo.userId = [userDefaults objectForKey:@"uid"];
//    self.userInfo.face = [userDefaults objectForKey:@"face"];
//    self.userInfo.cnname = [userDefaults objectForKey:@"nickname"];
//    self.userInfo.username = [userDefaults objectForKey:@"username"];
//    self.userInfo.integral = [userDefaults objectForKey:@"integral"];
//    self.userInfo.wallet = [userDefaults objectForKey:@"wallet"];
//    self.userInfo.sum = [userDefaults objectForKey:@"sum"];

}


- (NSURL *)appendHTMLURL:(NSURL *)url {
    
    NSString *urlString = url.absoluteString;
    
    if([urlString rangeOfString:@"?"].location !=NSNotFound) {
        
        urlString = [NSString stringWithFormat:@"%@&type=ios", urlString];
        
    }else {
        
        urlString = [NSString stringWithFormat:@"%@?type=ios", urlString];
        
    }
    
    return [NSURL URLWithString:urlString];
}

- (BOOL)isLogin {
//    return !_userInfo.userId;
    return YES;
}

//////////////////////////////////////////////////////////////////////////
static DataManager *sharedDataManager = nil;

+ (DataManager *) sharedManager
{
    @synchronized(self)
    {
        if (sharedDataManager == nil)
        {
            return [[self alloc] init];
        }
    }
    
    return sharedDataManager;
}

+(id)alloc
{
    @synchronized(self)
    {
        NSAssert(sharedDataManager == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedDataManager = [super alloc];
        return sharedDataManager;
    }
    return nil;
}



@end
