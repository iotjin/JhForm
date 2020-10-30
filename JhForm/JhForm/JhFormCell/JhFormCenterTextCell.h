//
//  JhFormCenterTextCell.h
//  JhReader
//
//  Created by Jh on 2019/3/13.
//  Copyright © 2019 Jh. All rights reserved.
//  表单标题居中Cell

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormCenterTextCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

@end


@interface UITableView (JhFormCenterTextCell)

- (JhFormCenterTextCell *)CenterTextWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
