//
//  UIView+JhView.h
//  JhForm
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JhView)

@property (nonatomic, assign) CGFloat Jh_x;
@property (nonatomic, assign) CGFloat Jh_y;
@property (nonatomic, assign) CGFloat Jh_width;
@property (nonatomic, assign) CGFloat Jh_height;
@property (nonatomic, assign) CGFloat Jh_centerX;
@property (nonatomic, assign) CGFloat Jh_centerY;
@property (nonatomic, assign) CGSize  Jh_size;
@property (nonatomic, assign) CGPoint Jh_origin;

@property (nonatomic, assign) CGFloat Jh_left;
@property (nonatomic, assign) CGFloat Jh_top;
@property (nonatomic, assign) CGFloat Jh_right;
@property (nonatomic, assign) CGFloat Jh_bottom;

+ (instancetype)Jh_viewFromXib;

@end

NS_ASSUME_NONNULL_END
