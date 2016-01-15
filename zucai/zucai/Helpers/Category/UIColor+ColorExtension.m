//
//  UIColor+ColorExtension.m
//  Color
//
//  Created by magic on 13-12-7.
//  Copyright (c) 2013年 magic. All rights reserved.
//

#import "UIColor+ColorExtension.h"

#define DEFAULT_VOID_COLOR [UIColor whiteColor]


const unsigned int RGBMainColor = 0xff828a;//(255,130,138)
const unsigned int RGBBGColor = 0xfffbfa;
const unsigned int RGBSeparatorColor = 0xd6d6d6;
const unsigned int RGBContentTextColor = 0xcfcfcf;
const unsigned int RGBShallowTextColor = 0xffcccf;
const unsigned int RGBShallowRedColor = 0xff6771;//(255 103 113)
const unsigned int RGBDetailTextColor = 0x999999;//153 153 153
//const unsigned int RGBNaviextColor = 0xffffff;
//const unsigned int RGBOrangeTextColor = 0xff8000;
//const unsigned int RGBContentTextColor = 0x333333;
//const unsigned int RGBBlueTextColor = 0x224d6f;
//const unsigned int RGBGoldenTextColor = 0xffc00;
//const unsigned int RGBGrayTextColor = 0xb1b1b1;

//导航栏文字
const int FontSizeNaviTitle = 17;
//按钮文字
const int FontSizeButtonTitle = 18;
//返回按钮大小
const int FontSizeBackBtnTitle = 13;
//输入框内文字大小
const int FontSizeContentText = 14;
//备注文字
const int FontSizeNote = 12;

@implementation UIColor (ColorExtension)


+ (UIColor *) colorWithHexString:(NSString *)stringToConvert{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"＃"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (id) colorWithHex:(unsigned int)hex
{
	return [UIColor colorWithHex:hex alpha:1];
}

+ (id) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
	return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

+ (UIColor*) randomColor
{
	int r = arc4random() % 255;
	int g = arc4random() % 255;
	int b = arc4random() % 255;
	return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

@end
