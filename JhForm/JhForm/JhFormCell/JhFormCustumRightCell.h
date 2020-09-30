//
//  JhFormCustumRightCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//  自己cell,左侧title,右侧自定义View

#import "JhFormBaseCell.h"

@class JhFormCellModel;


@interface JhFormCustumRightCell : JhFormBaseCell

/** 自定义视图 */
@property (nonatomic, strong) UIView *CustumRightView;

@property (nonatomic, strong) JhFormCellModel *data;


@end



@interface UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)CustumRightCellWithId:(NSString *)cellId;

@end


