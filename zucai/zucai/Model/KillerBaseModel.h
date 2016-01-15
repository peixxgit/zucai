//
//  KillerBaseModel.h
//  Listen
//
//  Created by dllo on 15/10/12.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KillerBaseModel : NSObject

/**
 *  KVC的初始化方法
 *
 *  @param dic 数据字典
 *
 *  @return
 */
+ (NSMutableArray *)baseModelByArr:(NSArray *)arr;

@property(nonatomic, copy)NSString *uId;

@end
