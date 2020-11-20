//
//  JhFormPwdCell.h
//  JhForm
//
//  Created by Jh on 2019/6/21.
//  Copyright © 2019 Jh. All rights reserved.
//  表单输入密码Cell，标题居左，密码居右。标题换行与居中展示，标题隐藏。详情长度限制，详情居左居右，添加右侧自定义view等

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormPwdCell : JhFormBaseCell

/**
 右侧 Jh_pwdTextField 控件
 */
@property (nonatomic, strong) UITextField  *Jh_pwdTextField;

@property (nonatomic, strong) JhFormCellModel *data;

/** 密码样式cell 输入完成 */
@property (nonatomic, copy) void(^Jh_pwdInputCompletion )(NSString *text);

@end

@interface UITableView (JhFormPwdCell)

- (JhFormPwdCell *)PwdCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
