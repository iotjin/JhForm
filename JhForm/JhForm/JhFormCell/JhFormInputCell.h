//
//  JhFormInputCell.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  表单输入条目，标题居左，详情居右，支持单行与多行输入

#import "JhFormBaseCell.h"
#import "JhFormCellModel.h"


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
 右侧自定义视图
 */
@property (nonatomic, strong) UIView *RightView;

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

