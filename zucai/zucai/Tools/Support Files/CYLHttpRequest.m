//
//  CYLHttpRequest.m
//  MusicStreet
//
//  Created by caiyulin on 15/8/10.
//  Copyright (c) 2015年 蔡於林. All rights reserved.
//

#import "CYLHttpRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "DataManager.h"
#import "UIView+ShowMessage.h"
@implementation CYLHttpRequest

//+(void)post:(NSString *)url
//     params:(NSDictionary *)params
// onComplete:(void (^)(NSDictionary *json, BOOL isSuccess))onComplete {
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    manager.requestSerializer.timeoutInterval = 20;
//    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
//    
//    if ([DataManager sharedManager].isLogin) {
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dic = [params mutableCopy];
////            [dic setObject:[DataManager sharedManager].userInfo.uId forKey:@"uid"];
//            params = [dic copy];
//        }else {
////            params = @{@"uid" : [DataManager sharedManager].uid.userId};
//        }
//    }
//    
//    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
//    NSLog(@"%@",url);
//    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        //网络请求成功
////        NSData *resData = [[NSData alloc] initWithData:responseObject];
//        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
//        
//        if (onComplete) {
//            if ([resultDic[@"Result"] boolValue]) {
//                onComplete(resultDic,NO);
////                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"Message"]];
//            }else {
//                onComplete(resultDic,YES);
//            }
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (onComplete) {
////            [UIView showHudwithTitle:@"温馨提示" detail:error.localizedDescription yOffSet:2.0];
//            onComplete(nil,NO);
//        }
//    }];
//    
//}
//
//
//+ (void)post:(NSString *)url params:(NSDictionary *)params imageData:(NSData *)imageData imageName:(NSString *)imageName onComplete:(void (^)(NSDictionary *, BOOL))onComplete {
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    manager.requestSerializer.timeoutInterval = 20;
//    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
//    
//    if ([DataManager sharedManager].isLogin) {
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dic = [params mutableCopy];
//            [dic setObject:[DataManager sharedManager].userInfo.userId forKey:@"uid"];
//            params = [dic copy];
//        }else {
//            params = @{@"uid" : [DataManager sharedManager].userInfo.userId};
//        }
//    }
//    
//    
//    
//    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
//    
//    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>formData) {
//        
//        [formData appendPartWithFileData:imageData name:imageName fileName:[NSString stringWithFormat:@"%@.png", imageName] mimeType:@"image/jpeg"];
//        NSLog(@"%@",formData);
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        //网络请求成功
//        NSData *resData = [[NSData alloc] initWithData:responseObject];
//        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
//        
//        if (onComplete) {
//            if ([resultDic[@"Result"] boolValue]) {
////                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"Message"]];
//            }else {
//                onComplete(resultDic,YES);
//            }
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"错误 %@", error.localizedDescription);
//        [UIView showHudwithTitle:@"温馨提示" detail:error.localizedDescription yOffSet:2.0];
//    }];
//    
//}
//
//
//
//+(void)get:(NSString *)url params:(NSDictionary *)params onComplete:(void (^)(NSDictionary *json, BOOL isSuccess))onComplete {
//    
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    manager.requestSerializer.timeoutInterval = 20;
//    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
//    
//    if ([DataManager sharedManager].isLogin) {
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dic = [params mutableCopy];
//            [dic setObject:[DataManager sharedManager].userInfo.userId forKey:@"uid"];
//            params = [dic copy];
//        }else {
//            params = @{@"uid" : [DataManager sharedManager].userInfo.userId};
//        }
//    }
//    
//    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
//    NSLog(@"%@",url);
//    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//      
//        //网络请求成功
//        NSData *resData = [[NSData alloc] initWithData:responseObject];
//        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
//        
//        if (onComplete) {
//            if ([resultDic[@"Result"] boolValue]) {
////                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"Message"]];
//                onComplete(resultDic,YES);
//            }else {
//                onComplete(resultDic,YES);
//            }
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (onComplete) {
//            [UIView showHudwithTitle:@"温馨提示" detail:error.localizedDescription yOffSet:2.0];
//            onComplete(nil,NO);
//        }
//        
//    }];
//    
//}

@end
