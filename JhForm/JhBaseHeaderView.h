//
//  JhBaseHeaderView.h
//  JhReader
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>


//typedef void (^JhBaseHeaderViewClickRightBtnBlock)(void);

@interface JhBaseHeaderView : UIView


@property (weak, nonatomic) IBOutlet UILabel *Jh_leftTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *Jh_rightBtn;
@property (weak, nonatomic) IBOutlet UIView *LineView;


@property (strong, nonatomic) NSString *Jh_leftTitle;

@property (strong, nonatomic) UIImage  *Jh_rightBtnImage;
@property (strong, nonatomic) NSString *Jh_rightBtnTitle;

//@property (copy, nonatomic) JhBaseHeaderViewClickRightBtnBlock JhHeaderClickRightBtnBlock;


//直接定义
@property (nonatomic, copy) void(^JhHeaderClickRightBtnBlock)(void);

//直接定义
@property (nonatomic, copy) void(^block)(NSInteger);

@end
