//
//  KillerBaseModel.m
//  Listen
//
//  Created by dllo on 15/10/12.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "KillerBaseModel.h"

@implementation KillerBaseModel

+ (NSMutableArray *)baseModelByArr:(NSArray *)arr{
    // 创建一个数组, 用来装model
    NSMutableArray *modelArr = [NSMutableArray array];
    // 对数组进行遍历, 里面的元素都是字典
    for (NSDictionary *dic in arr) {
        @autoreleasepool {
            // 通过便利构造器的方式创建对象
            id model = [[self class] baseModelWithDic:dic];
            // 把对象添加到数组中
            [modelArr addObject:model];
        }
    }
    return modelArr;
}

#pragma mark 便利构造器方法用来创建对象
+ (instancetype)baseModelWithDic:(NSDictionary *)dic{
    // 采用多态的方式进行对象的创建
    id model = [[[self class] alloc] initWithDic:dic];
    return model;
}

#pragma mark 自定义初始化方法用来实现对model用KVC进行赋值
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        // 用KVC的方式对成员变量进行赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

/**
 *  KVC的纠错方法
 *
 *  @param value 未找到的Key对应的值
 *  @param key   字典中未找到的Key
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.uId = value;
    }
}

@end
