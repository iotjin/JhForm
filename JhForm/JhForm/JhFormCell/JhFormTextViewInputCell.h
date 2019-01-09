//
//  JhFormTextViewInputCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormItem;

typedef void(^JhTextViewInputCompletion)(NSString *text);

/**
 JhFormTextViewInputCell 表单输入条目，标题居上，详情居下，支持单行与多行输入
 */
@interface JhFormTextViewInputCell : JhFormBaseCell

@property (nonatomic, strong) JhFormItem *item;
@property (nonatomic, copy) JhTextViewInputCompletion textViewInputCompletion;

+ (CGFloat)heightWithItem:(JhFormItem *)item;

@end


@interface UITableView (JhFormTextViewInputCell)

- (JhFormTextViewInputCell *)textViewInputCellWithId:(NSString *)cellId;

@end
