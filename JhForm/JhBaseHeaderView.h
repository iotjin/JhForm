//
//  JhBaseHeaderView.h
//  JhReader
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JhBaseHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *Jh_leftTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *Jh_rightBtn;
@property (weak, nonatomic) IBOutlet UIView *LineView;

@property (strong, nonatomic) NSString *Jh_leftTitle;

@property (strong, nonatomic) UIImage  *Jh_rightBtnImage;
@property (strong, nonatomic) NSString *Jh_rightBtnTitle;

//直接定义
@property (nonatomic, copy) void(^JhHeaderClickRightBtnBlock)(void);

// MARK: Tips 要直接定义一个参数和返回值都为空的 Block 其实可以这样：
// @property (nonatomic, copy) dispatch_block_t yourCustomBlock;

//直接定义
@property (nonatomic, copy) void(^block)(NSInteger);

@end
