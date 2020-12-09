//
//  UIColor+JhDarkColor.m
//  JhForm
//
//  Created by Jh on 2020/11/24.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "UIColor+JhDarkColor.h"
#import "JhFormConst.h"

///  背景色
#define kBaseBgColor JhColor(248, 248, 248)
#define kBaseBgColor_Dark JhColor(10, 10, 10)

/// Label 颜色
#define kBaseLabelColor JhGrayColor(51)
#define kBaseLabelColor_Dark JhGrayColor(198)


@implementation UIColor (JhDarkColor)

#pragma mark - Dark Color

/// view背景颜色
+ (UIColor *)Jh_viewBgColor {
    return [UIColor Jh_colorWithLightColor:kBaseBgColor darkColor:kBaseBgColor_Dark];
}
/// label颜色
+ (UIColor *)Jh_labelColor {
    return [UIColor Jh_colorWithLightColor:kBaseLabelColor darkColor:kBaseLabelColor_Dark];
}


#pragma mark - Dark Mode

///十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)Jh_colorWithHexString:(NSString *)color {
    return [self Jh_colorWithHexString:color alpha:1.0f];
}

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)Jh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}


/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightColor;
            } else {
                return darkColor;
            }
        }];
    } else {
        return lightColor ? lightColor : (darkColor ? darkColor : [UIColor clearColor]);
    }
}

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColorString:(NSString *)lightColor darkColor:(NSString *)darkColor {
    return [UIColor Jh_colorWithLightColor:[UIColor Jh_colorWithHexString:lightColor] darkColor:[UIColor Jh_colorWithHexString:darkColor]];
}


/// 适配暗黑模式颜色   颜色传入的是16进制字符串 还有颜色的透明度
/// @param lightColor 普通模式颜色
/// @param lightAlpha 普通模式颜色透明度
/// @param darkColor 暗黑模式颜色透明度
/// @param darkAlpha 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColorString:(NSString *)lightColor lightColorAlpha:(CGFloat)lightAlpha darkColor:(NSString *)darkColor darkColorAlpha:(CGFloat)darkAlpha {
    return [UIColor Jh_colorWithLightColor:[UIColor Jh_colorWithHexString:lightColor alpha:lightAlpha] darkColor:[UIColor Jh_colorWithHexString:darkColor alpha:darkAlpha]];
}


@end
