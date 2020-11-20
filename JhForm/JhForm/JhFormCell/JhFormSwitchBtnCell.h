//
//  JhFormSwitchBtnCell.h
//  JhReader
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//  表单Switch按钮Cell，左标题，右按钮。设置Switch按钮颜色

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

@interface JhFormSwitchBtnCell : JhFormBaseCell

@property (strong, nonatomic) UISwitch  *switchBtn;
@property (strong, nonatomic) JhFormCellModel *data;

@end

@interface UITableView (JhFormSwitchBtnCell)

- (JhFormSwitchBtnCell *)SwitchBtnCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
