//
//  JhFormTextViewInputCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

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
