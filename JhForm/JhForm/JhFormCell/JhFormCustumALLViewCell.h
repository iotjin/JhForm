//
//  JhFormCustumALLViewCell.h
//  JhForm
//
//  Created by Jh on 2019/7/26.
//  Copyright © 2019 Jh. All rights reserved.
//  表单完全自定义Cell。自定义添加视图

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormCustumALLViewCell : JhFormBaseCell

/// 完全自定义视图
@property (nonatomic, strong) UIView *CustumALLView;
@property (nonatomic, strong) JhFormCellModel *data;

@end

@interface UITableView (JhFormCustumALLCell)

- (JhFormCustumALLViewCell *)CustumALLCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
