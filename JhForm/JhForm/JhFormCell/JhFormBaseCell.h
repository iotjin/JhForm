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

@property (nonatomic, strong) SelwynExpandableTextView *rightTextView;

/** 左侧图片 */
@property (nonatomic, strong) UIImageView *leftImgView;

/** 表单标题 */
@property (nonatomic, strong) UILabel *titleLabel;

/** 表单条目所在的tableView */
@property (nonatomic,   weak) UITableView *baseTableView;

/** 右侧自定义视图 */
@property (nonatomic, strong) UIView *rightView;

@end

NS_ASSUME_NONNULL_END
