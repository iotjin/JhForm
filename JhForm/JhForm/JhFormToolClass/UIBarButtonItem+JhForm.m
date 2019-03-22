//
//  UIBarButtonItem+JhForm.m
//  JhForm
//
//  Created by Jh on 2019/3/22.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "UIBarButtonItem+JhForm.h"

@implementation UIBarButtonItem (JhForm)


/**
 导航栏添加图片和高亮图片
 
 @param image iamge
 @param highImage highImage
 @param target target对象
 @param action 响应方法
 @return 生成的UIBarButtonItem
 */

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

/**
 根据文字生成UIBarButtonItem
 
 @param title title
 @param titleColor titleColor
 @param target target对象
 @param action 响应方法
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                            target:(id)target
                            action:(SEL)action{
    
    return [self customItemWithTitle:title titleColor:titleColor imageName:@"" target:target action:action contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
}


/**
 通过自定义的方法，快速初始化一个UIBarButtonItem，内部是按钮
 
 @param title 显示的文字，例如'完成'、'取消'
 @param titleColor title的颜色，if nil ，The Color is [UIColor whiteColor]
 @param imageName 图片名称
 @param target target
 @param action action
 @param contentHorizontalAlignment 文本对齐方向
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)customItemWithTitle:(NSString *)title
                              titleColor:(UIColor *)titleColor
                               imageName:(NSString *)imageName
                                  target:(id)target
                                  action:(SEL)action
              contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment{
    UIButton *item = [[UIButton alloc] init];
    titleColor = titleColor?titleColor:[UIColor whiteColor];
    [item setTitle:title forState:UIControlStateNormal];
    UIImage *image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setImage:image forState:UIControlStateNormal];
    [item.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    [item setTitleColor:titleColor forState:UIControlStateNormal];
    [item setTitleColor:[titleColor colorWithAlphaComponent:.5f] forState:UIControlStateHighlighted];
    [item setTitleColor:[titleColor colorWithAlphaComponent:.5f] forState:UIControlStateDisabled];
    [item sizeToFit];
    item.contentHorizontalAlignment = contentHorizontalAlignment;
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}


@end
