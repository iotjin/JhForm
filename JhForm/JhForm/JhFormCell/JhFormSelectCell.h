//
//  JhFormSelectCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//  表单选择Cell，标题居左，详情居右带箭头。标题换行与居中展示，标题隐藏。详情长度限制，支持单行与多行展示，详情居左居右等

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

/**
 JhFormSelectCell 表单选择条目
 */
@interface JhFormSelectCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end


@interface UITableView (JhFormSelectCell)

- (JhFormSelectCell *)selectCellWithId:(NSString *)cellId;


@end

NS_ASSUME_NONNULL_END
