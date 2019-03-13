//
//  JhFormSwitchBtnCell.h
//  JhReader
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormCellModel;

@interface JhFormSwitchBtnCell : JhFormBaseCell


/**
 右侧 switchBtn
 */
@property (strong, nonatomic) UISwitch  *switchBtn;

@property (strong, nonatomic) JhFormCellModel *data;

@end


@interface UITableView (JhFormSwitchBtnCell)

- (JhFormSwitchBtnCell *)SwitchBtnCellWithId:(NSString *)cellId;

@end
