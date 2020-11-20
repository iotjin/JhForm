//
//  NSString+JhForm.h
//  JhFormDemo
//
//  Created by Jh on 2018/6/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JhForm)

/**
 字符串添加单位

 @param unit 单位
 */
- (NSString *)addUnit:(NSString *)unit;

/**
 获取字符串的 Size 大小

 @param fontSize 字体大小
 @param maxSize 最大显示Size
 */
- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

/// 给定最大宽度和字体大小，计算字符串的高度
/// 实现参考：<https://github.com/shaojiankui/JKCategories/blob/master/JKCategories/Foundation/NSString/NSString%2BJKSize.m>
/// @param width 给定最大宽度
/// @param font 字符串字体大小
- (CGFloat)heightWithFixedWidth:(CGFloat)width textFont:(NSInteger)font;

@end
