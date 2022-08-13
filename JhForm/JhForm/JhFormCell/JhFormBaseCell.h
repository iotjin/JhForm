//
//  JhFormBaseCell.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JhFormProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class JhTextView;
@class JhFormCellModel;

@interface JhFormBaseCell : UITableViewCell <JhFormProtocol>

/// 红星
@property (nonatomic, strong) UILabel *redStarLabel;
/// 左侧图片
@property (nonatomic, strong) UIImageView *leftImgView;
/// 表单标题
@property (nonatomic, strong) UILabel *titleLabel;

/// 右侧info
@property (nonatomic, strong) JhTextView *rightTextView;

/// 右侧按钮
@property (nonatomic, strong) UIButton *rightBtn;
/// 右侧自定义视图
@property (nonatomic, strong) UIView *rightView;

/// 标题底部提示文字
@property (nonatomic, strong) UILabel *tipLabel;
/// 标题和底部控件之间的线
@property (nonatomic, strong) UIView *line;

/// 表单Cell 所在的tableView
@property (nonatomic, weak) UITableView *baseTableView;

/// cell配置model
@property (nonatomic, strong) JhFormCellModel *cellModel;

- (void)Jh_initUI;

//右侧按钮点击事件
- (void)Jh_clickRightButton:(UIButton *)button;

@end

NS_ASSUME_NONNULL_END


