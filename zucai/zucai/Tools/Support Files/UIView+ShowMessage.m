//
//  UIView+ShowMessage.m
//  E-Community
//
//  Created by 裴晓潇 on 16/1/5.
//  Copyright © 2016年 lion. All rights reserved.
//

#import "UIView+ShowMessage.h"
#import <MBProgressHUD/MBProgressHUD.h>
@implementation UIView (ShowMessage)

+ (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail yOffSet:(CGFloat)offset
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:window animated:NO];
    mb.mode = MBProgressHUDModeText;
    mb.yOffset = offset;
    mb.userInteractionEnabled = NO;
    mb.removeFromSuperViewOnHide = YES;
    mb.labelText = title;
    mb.detailsLabelText = detail;
    [mb show:YES];
    [mb hide:YES afterDelay:2.0f];
    
}

@end
