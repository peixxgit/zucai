//
//  NSObject+ValidateUserPhoneNum.m
//  E-Community
//
//  Created by 裴晓潇 on 15/12/30.
//  Copyright © 2015年 magic. All rights reserved.
//

#import "NSObject+ValidateUserPhoneNum.h"

@implementation NSObject (ValidateUserPhoneNum)
+ (BOOL)validateUserPhoneNum:(NSString*)str{
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,152,157,158,159,182,187,188,184,，1705,178
     */
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0127-9]|8[23478])\\d|705|78)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186,1709,176
     */
    
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709|76)\\d{7}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,177,180,189,1700
     */
    NSString * CT = @"^1((33|53|77|8[019])\\d|349|700|)\\d{7}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestcm evaluateWithObject:str] == YES)
        ||([regextestct evaluateWithObject:str] == YES)
        || ([regextestcu evaluateWithObject:str] == YES))
    {
        return YES;
    }else{
        return NO;
    }
}

@end
