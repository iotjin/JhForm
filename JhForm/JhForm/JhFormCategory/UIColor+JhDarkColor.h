//
//  UIColor+JhDarkColor.h
//  JhForm
//
//  Created by Jh on 2020/11/24.
//  Copyright © 2020 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JhDarkColor)

#pragma mark - Dark Color

/// view背景颜色
+ (UIColor *)Jh_viewBgColor;
/// label颜色
+ (UIColor *)Jh_labelColor;


#pragma mark - Dark Mode

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)Jh_colorWithHexString:(NSString *)color;

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)Jh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColorString:(NSString *)lightColor darkColor:(NSString *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串 还有颜色的透明度
/// @param lightColor 普通模式颜色
/// @param lightAlpha 普通模式颜色透明度
/// @param darkColor 暗黑模式颜色透明度
/// @param darkAlpha 暗黑模式颜色
+ (UIColor *)Jh_colorWithLightColorString:(NSString *)lightColor lightColorAlpha:(CGFloat)lightAlpha darkColor:(NSString *)darkColor darkColorAlpha:(CGFloat)darkAlpha;

@end

NS_ASSUME_NONNULL_END
