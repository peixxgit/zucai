//
//  UITabBar+badge.h
//  MusicStreet
//
//  Created by magic on 15/9/14.
//  Copyright (c) 2015年 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
//显示小红点
- (void)showBadgeOnItemIndex:(int)index;
//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index;

@end
