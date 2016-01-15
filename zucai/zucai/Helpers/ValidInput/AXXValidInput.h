//
//  AXXValidInput.h
//  PP
//
//  Created by 安笑 on 15/8/18.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXXValidInput : NSObject

+ (BOOL)isPassword:(NSString *)password;
+ (BOOL)isMobile:(NSString *)mobile;

@end
