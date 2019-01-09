//
//  JhFormCustumRightCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//  自己cell,左侧title,右侧自定义View

#import "JhFormBaseCell.h"

@class JhFormItem;


@interface JhFormCustumRightCell : JhFormBaseCell

/**
 自定义视图
 */
@property (nonatomic, strong) UIView *CustumRightView;

@property (nonatomic, strong) JhFormItem *item;


@end



@interface UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)custumRightCellWithId:(NSString *)cellId;

@end


