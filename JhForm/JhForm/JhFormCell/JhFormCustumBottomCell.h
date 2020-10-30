//
//  JhFormCustumBottomCell.h
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//  表单底部自定义Cell，标题居上，底部自定义View。支持标题隐藏。

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormCustumBottomCell : JhFormBaseCell

/** 自定义视图 */
@property (nonatomic, strong) UIView *CustumBottomView;

@property (nonatomic, strong) JhFormCellModel *data;

@end


@interface UITableView (JhFormCustumBottomCell)

- (JhFormCustumBottomCell *)CustumBottomCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
