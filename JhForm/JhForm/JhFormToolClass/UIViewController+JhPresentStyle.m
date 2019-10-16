//
//  UIViewController+JhPresentStyle.m
//  JhForm
//
//  Created by Jh on 2019/10/16.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "UIViewController+JhPresentStyle.h"

@implementation UIViewController (JhPresentStyle)

- (UIModalPresentationStyle)modalPresentationStyle{
    if (@available(iOS 13.0, *)) {
        if ([self isKindOfClass:[UIActivityViewController class]]) {
            return UIModalPresentationPageSheet;
        }else{
            return UIModalPresentationFullScreen;
        }
    }
    return UIModalPresentationPopover;
    
}

@end
