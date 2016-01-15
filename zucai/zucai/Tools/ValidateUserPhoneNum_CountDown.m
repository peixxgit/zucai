//
//  ValidateUserPhoneNum_CountDown.m
//  E-Community
//
//  Created by 裴晓潇 on 16/1/5.
//  Copyright © 2016年 lion. All rights reserved.
//

#import "ValidateUserPhoneNum_CountDown.h"
#import "CYLHttpRequest.h"
#import "UIView+ShowMessage.h"
@implementation ValidateUserPhoneNum_CountDown
+ (ValidateUserPhoneNum_CountDown *)sharePhoneTool{
    static ValidateUserPhoneNum_CountDown *phoneTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        phoneTool = [[ValidateUserPhoneNum_CountDown alloc]init];
    });
    return phoneTool;
}
- (void)postIdentifCode:(NSString *)url body:(NSDictionary *)body phoneNumberKey:(NSString *)phoneNumberKey postBtn:(UIButton *)postBtn{
    if ([self validateUserPhoneNum:body[phoneNumberKey]]) {
        [CYLHttpRequest post:url params:body onComplete:^(NSDictionary *json, BOOL isSuccess) {
            if (isSuccess) {
                [UIView showHudwithTitle:@"温馨提示" detail:json[@"Message"] yOffSet:2.0];
            }
        }];
        [self settimer:postBtn];
    }else{
        [UIView showHudwithTitle:@"温馨提示" detail:@"请输入正确手机号" yOffSet:2.0];
    }
}
// 验证手机号格式
- (BOOL)validateUserPhoneNum:(NSString *)str{
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

-(void)settimer:(UIButton *)timerbtn{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [timerbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                timerbtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60 ;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                //                [UIView beginAnimations:nil context:nil];
                //                [UIView setAnimationDuration:1];
                [timerbtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                //                [UIView commitAnimations];
                timerbtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
