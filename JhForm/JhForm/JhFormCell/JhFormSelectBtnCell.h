//
//  JhFormSelectBtnCell.h
//  JhForm
//
//  Created by Jh on 2020/10/26.
//  Copyright © 2020 Jh. All rights reserved.
//  表单选择按钮Cell，左标题右按钮或上标题下按钮。支持单选和多选，按钮宽度自适应，设置默认选中按钮，按钮颜色设置，切换按钮图标

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormSelectBtnCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end


@interface UITableView (JhFormSelectBtnCell)

- (JhFormSelectBtnCell *)SelectBtnCellWithId:(NSString *)cellId;

@end


NS_ASSUME_NONNULL_END
