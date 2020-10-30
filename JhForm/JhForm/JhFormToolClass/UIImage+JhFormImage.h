//
//  UIImage+JhFormImage.h
//  JhForm
//
//  Created by Jh on 2020/10/29.
//  Copyright © 2020 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JhFormImage)

/**
 *  纯色图重绘颜色
 *
 *  @param tintColor 目标颜色
 *
 *  @return 重绘颜色后的Image
 */
- (UIImage * _Nonnull)Jh_imageWithTintColor:(UIColor * _Nonnull)tintColor;

@end

NS_ASSUME_NONNULL_END
