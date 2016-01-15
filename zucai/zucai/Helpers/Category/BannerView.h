//
//  BannerView.h
//  TUIWA
//
//  Created by 安笑 on 15/8/29.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView

@property (strong, nonatomic) UIButton *currentButton; //!<当前展示的图像
@property (strong, nonatomic) NSArray *dataArr; //!<数据源
@property (readwrite, nonatomic) BOOL isAutoShow; //!<是否自动滚动

@end
