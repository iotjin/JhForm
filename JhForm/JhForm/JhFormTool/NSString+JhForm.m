//
//  NSString+JhForm.m
//  JhFormDemo
//
//  Created by Jh on 2018/6/26.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "NSString+JhForm.h"

@implementation NSString (JhForm)

- (NSString *)addUnit:(NSString *)unit {
    if ([self isEqualToString:@""] || [unit isEqualToString:@""]) {
        return self;
    }
    return [NSString stringWithFormat:@"%@ %@", self, unit];
}

- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize {
    CGSize textSize = [self boundingRectWithSize:maxSize
                                         options:(NSStringDrawingUsesLineFragmentOrigin |
                                                  NSStringDrawingUsesFontLeading)
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                         context:nil].size;
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

- (CGFloat)heightWithFixedWidth:(CGFloat)width textFont:(NSInteger)font {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:font],
        NSParagraphStyleAttributeName: paragraphStyle
    };
    
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:(NSStringDrawingUsesLineFragmentOrigin |
                                                    NSStringDrawingUsesFontLeading)
                                      attributes:attributes
                                         context:nil].size;
    return ceil(textSize.height);
}

@end
