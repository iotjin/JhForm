//
//  JhFormTextViewInputCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//  表单TextView输入Cell，标题居上，详情居下，支持单行与多行输入，实时录入监听。标题隐藏。详情长度限制，支持单行与多行输入，键盘切换，录入长度/总长度展示

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

typedef void(^JhTextViewInputCompletion)(NSString *text);

/**
 JhFormTextViewInputCell 表单输入条目，标题居上，详情居下，支持单行与多行输入
 */
@interface JhFormTextViewInputCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;
@property (nonatomic, copy) JhTextViewInputCompletion textViewInputCompletion;

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end

@interface UITableView (JhFormTextViewInputCell)

- (JhFormTextViewInputCell *)textViewInputCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
