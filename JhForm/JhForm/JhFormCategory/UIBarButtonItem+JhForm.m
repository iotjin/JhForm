//
//  UIBarButtonItem+JhForm.m
//  JhForm
//
//  Created by Jh on 2019/3/22.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "UIBarButtonItem+JhForm.h"

@implementation UIBarButtonItem (JhForm)

+ (instancetype)Jh_itemWithImage:(NSString *)image
                       highImage:(NSString *)highImage
                          target:(id)target
                          action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)Jh_itemWithTitle:(NSString *)title
                           titleColor:(UIColor *)titleColor
                               target:(id)target
                               action:(SEL)action {
    return [self Jh_customItemWithTitle:title
                             titleColor:titleColor
                              imageName:@""
                                 target:target
                                 action:action
             contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
}

+ (UIBarButtonItem *)Jh_customItemWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  imageName:(NSString *)imageName
                                     target:(id)target
                                     action:(SEL)action
                 contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment {
    UIButton *item = [[UIButton alloc] init];
    titleColor = titleColor ? titleColor : [UIColor whiteColor];
    [item setTitle:title forState:UIControlStateNormal];
    if (imageName.length) {
        UIImage *image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setImage:image forState:UIControlStateNormal];
    }
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
