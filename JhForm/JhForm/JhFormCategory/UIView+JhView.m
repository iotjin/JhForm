//
//  UIView+JhView.m
//  JhForm
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "UIView+JhView.h"

@implementation UIView (JhView)

- (void)setJh_x:(CGFloat)Jh_x {
    CGRect frame = self.frame;
    frame.origin.x = Jh_x;
    self.frame = frame;
}

- (CGFloat)Jh_x {
    return self.frame.origin.x;
}

- (void)setJh_y:(CGFloat)Jh_y {
    CGRect frame = self.frame;
    frame.origin.y = Jh_y;
    self.frame = frame;
}

- (CGFloat)Jh_y {
    return self.frame.origin.y;
}

- (void)setJh_width:(CGFloat)Jh_width {
    CGRect frame = self.frame;
    frame.size.width = Jh_width;
    self.frame = frame;
}

- (CGFloat)Jh_width {
    return self.frame.size.width;
}

- (void)setJh_height:(CGFloat)Jh_height {
    CGRect frame = self.frame;
    frame.size.height = Jh_height;
    self.frame = frame;
}

- (CGFloat)Jh_height {
    return self.frame.size.height;
}

- (CGFloat)Jh_centerX {
    return self.center.x;
}

- (void)setJh_centerX:(CGFloat)Jh_centerX {
    CGPoint center = self.center;
    center.x = Jh_centerX;
    self.center = center;
}

- (CGFloat)Jh_centerY {
    return self.center.y;
}

- (void)setJh_centerY:(CGFloat)Jh_centerY {
    CGPoint center = self.center;
    center.y = Jh_centerY;
    self.center = center;
}

- (void)setJh_size:(CGSize)Jh_size {
    CGRect frame = self.frame;
    frame.size = Jh_size;
    self.frame = frame;
}

- (CGSize)Jh_size {
    return self.frame.size;
}

- (void)setJh_origin:(CGPoint)Jh_origin {
    CGRect frame = self.frame;
    frame.origin = Jh_origin;
    self.frame = frame;
}

- (CGPoint)Jh_origin {
    return self.frame.origin;
}

- (CGFloat)Jh_left {
    return self.frame.origin.x;
}

-(void)setJh_left:(CGFloat)Jh_left {
    CGRect frame = self.frame;
    frame.origin.x = Jh_left;
    self.frame = frame;
}

- (CGFloat)Jh_top {
    return self.frame.origin.y;
}

-(void)setJh_top:(CGFloat)Jh_top {
    CGRect frame = self.frame;
    frame.origin.y = Jh_top;
    self.frame = frame;
}

- (CGFloat)Jh_right {
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setJh_right:(CGFloat)Jh_right {
    CGRect frame = self.frame;
    frame.origin.x = Jh_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)Jh_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
-(void)setJh_bottom:(CGFloat)Jh_bottom {
    CGRect frame = self.frame;
    frame.origin.y = Jh_bottom - frame.size.height;
    self.frame = frame;
}

+ (instancetype)Jh_viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

@end
