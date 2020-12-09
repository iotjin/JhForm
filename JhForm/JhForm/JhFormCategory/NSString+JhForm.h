//
//  NSString+JhForm.h
//  JhForm
//
//  Created by Jh on 2019/1/10.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JhForm)

/**
 字符串添加单位
 
 @param unit 单位
 */
- (NSString *)Jh_addUnit:(NSString *)unit;

/**
 获取字符串的 Size 大小
 
 @param fontSize 字体大小
 @param maxSize 最大显示Size
 */
- (CGSize)Jh_sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

/**
 一串字符在固定宽度下，正常显示所需要的高度(字符串固定宽度计算高度)
 
 @param string 字符串
 @param width 宽度
 @param font 大小
 @return 高度
 */
+ (CGFloat)Jh_autoHeightWithString:(NSString *)string
                             width:(CGFloat)width
                              font:(NSInteger)font;

/**
 一串字符在一行中正常显示所需要的宽度
 
 @param string 字符串
 @param font 大小
 @return 宽度
 */
+ (CGFloat)Jh_autoWidthWithString:(NSString *)string
                             font:(NSInteger)font;

@end
