//
//  UIView+ShowMessage.h
//  E-Community
//
//  Created by 裴晓潇 on 16/1/5.
//  Copyright © 2016年 lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShowMessage)
+ (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail yOffSet:(CGFloat)offset;
@end
