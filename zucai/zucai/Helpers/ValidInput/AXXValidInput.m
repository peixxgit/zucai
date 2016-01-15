//
//  AXXValidInput.m
//  PP
//
//  Created by 安笑 on 15/8/18.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import "AXXValidInput.h"

@implementation AXXValidInput

#pragma mark - Verify Password

+ (BOOL)isPassword:(NSString *)password
{
    if (!password) return NO;
    
    NSString* regexp = @"\\w{6,20}";
    NSPredicate* predication = [NSPredicate predicateWithFormat:@"self matches %@",regexp];
    
    NSString* sPssword = @"";
    
    if ([password isKindOfClass:[NSString class]]) {
        sPssword = password;
    }else if ([password isKindOfClass:[NSNumber class]]) {
        sPssword = [((NSNumber*)sPssword) stringValue];
    }
    
    if ([predication evaluateWithObject:sPssword]) return YES;
    
    return NO;
}



#pragma mark - Verify Mobile With Specifi Type (0 mobile phone 1 fixed telephone)
+ (BOOL)isMobile:(NSString *)mobile
{
    if (!mobile){
        return NO;
    }
    
    NSString* regexp = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate* predication = [NSPredicate predicateWithFormat:@"self matches %@",regexp];
    
    if ([predication evaluateWithObject:mobile]){
        return YES;
    }
    return NO;
}

@end
