//
//  ValidateUserPhoneNum_CountDown.h
//  E-Community
//
//  Created by 裴晓潇 on 16/1/5.
//  Copyright © 2016年 lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidateUserPhoneNum_CountDown : UIView
+ (ValidateUserPhoneNum_CountDown *)sharePhoneTool;
/**
 发送验证码
 dicKey-->字典key值
 phoneNumber-->电话号码
 postBtn-->发送按钮
 */
- (void)postIdentifCode:(NSString *)url body:(NSDictionary *)body phoneNumberKey:(NSString *)phoneNumberKey postBtn:(UIButton *)postBtn;

@end
