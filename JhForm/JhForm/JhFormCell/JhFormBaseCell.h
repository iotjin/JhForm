//
//  JhFormBaseCell.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SelwynExpandableTextView;

@interface JhFormBaseCell : UITableViewCell

/// 左侧图片
@property (nonatomic, strong) UIImageView *leftImgView;
/// 表单标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 可高度自适应的 UITextView
@property (nonatomic, strong) SelwynExpandableTextView *rightTextView;
/// 右侧自定义视图
@property (nonatomic, strong) UIView *rightView;
/// 表单条目所在的 tableView
@property (nonatomic, weak) UITableView *baseTableView;

@end

NS_ASSUME_NONNULL_END
