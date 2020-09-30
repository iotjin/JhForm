//
//  JhFormPwdCell.h
//  JhForm
//
//  Created by Jh on 2019/6/21.
//  Copyright © 2019 Jh. All rights reserved.
//

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
@property (nonatomic,   copy) void(^Jh_pwdInputCompletion )(NSString *text);

/** 右侧自定义视图 */
@property (nonatomic, strong) UIView *RightView;


@end


@interface UITableView (JhFormPwdCell)

- (JhFormPwdCell *)PwdCellWithId:(NSString *)cellId;

@end






NS_ASSUME_NONNULL_END





