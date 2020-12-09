//
//  JhBaseHeaderView.h
//  JhForm
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JhBaseHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *Jh_leftTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *Jh_rightBtn;
@property (weak, nonatomic) IBOutlet UIView *Jh_line;

@property (nonatomic, strong) NSString *Jh_leftTitle;
@property (nonatomic, strong) UIColor *Jh_titleColor;

@property (nonatomic, strong) UIImage  *Jh_rightBtnImage;
@property (nonatomic, strong) NSString *Jh_rightBtnTitle;

//直接定义
@property (nonatomic, copy) void(^JhHeaderClickRightBtnBlock)(void);

//直接定义
@property (nonatomic, copy) void(^block)(NSInteger);

@end

NS_ASSUME_NONNULL_END
