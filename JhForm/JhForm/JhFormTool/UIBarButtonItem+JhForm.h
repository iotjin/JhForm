//
//  UIBarButtonItem+JhForm.h
//  JhForm
//
//  Created by Jh on 2019/3/22.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (JhForm)

/**
 导航栏添加图片和高亮图片

 @param image iamge
 @param highImage highImage
 @param target target对象
 @param action 响应方法
 @return 生成的UIBarButtonItem
 */
+ (instancetype)itemWithImage:(NSString *)image
                    highImage:(NSString *)highImage
                       target:(id)target
                       action:(SEL)action;

/**
 根据文字生成 UIBarButtonItem

 @param title title
 @param titleColor titleColor
 @param target target对象
 @param action 响应方法
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                            target:(id)target
                            action:(SEL)action;

/**
 通过自定义的方法，快速初始化一个 UIBarButtonItem，内部是按钮

 @param title 显示的文字，例如'完成'、'取消'
 @param titleColor title的颜色，if nil ，The Color is [UIColor whiteColor]
 @param imageName 图片名称
 @param target target
 @param action 响应方法
 @param contentHorizontalAlignment 文本对齐方向
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)customItemWithTitle:(NSString *)title
                              titleColor:(UIColor *)titleColor
                               imageName:(NSString *)imageName
                                  target:(id)target
                                  action:(SEL)action
              contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment;

@end

NS_ASSUME_NONNULL_END
