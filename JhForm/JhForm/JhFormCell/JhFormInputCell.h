//
//  JhFormInputCell.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  表单输入Cell，标题居左，详情居右。标题换行与居中展示，标题隐藏。详情长度限制，支持单行与多行输入，实时录入监听，键盘切换，详情居左居右，添加右侧自定义view等

#import "JhFormBaseCell.h"
#import "JhFormCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

/**
 输入内容block
 
 @param text 当前输入内容
 */
typedef void(^JhInputCompletion)(NSString *text);

/**
 JhFormInputCell 表单输入条目，标题居左，详情居右，支持单行与多行输入
 */
@interface JhFormInputCell : JhFormBaseCell

/**
 条目配置参数
 */
@property (nonatomic, strong) JhFormCellModel *data;

@property (nonatomic, copy) JhInputCompletion inputCompletion;

/**
 获取条目高度
 */
+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end

/**
 JhFormInputCell 对于UITableView的分类，实现JhFormInputCell初始化
 */
@interface UITableView (JhFormInputCell)

- (JhFormInputCell *)inputCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
