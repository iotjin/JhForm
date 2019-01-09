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
 获取字符串的Size大小

 @param fontSize 字体大小
 @param maxSize 最大显示Size
 */
- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

@end
