//
//  JhFormCustumRightCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//  表单右侧自定义Cell，标题居左，右侧自定义View。支持标题隐藏。

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormCustumRightCell : JhFormBaseCell

/// 自定义视图
@property (nonatomic, strong) UIView *custumRightView;
@property (nonatomic, strong) JhFormCellModel *data;

@end

@interface UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)CustumRightCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
