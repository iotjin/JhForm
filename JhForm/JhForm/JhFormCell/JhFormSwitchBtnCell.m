//
//  JhFormSwitchBtnCell.m
//  JhForm
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSwitchBtnCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@interface JhFormSwitchBtnCell ()

/** 右侧 switchBtn */
@property (strong, nonatomic) UISwitch *switchBtn;

@end

@implementation JhFormSwitchBtnCell

-(UISwitch *)switchBtn {
    if (!_switchBtn) {
        UISwitch *switchBtn = [[UISwitch alloc]init];
        switchBtn.backgroundColor = [UIColor clearColor];
        [switchBtn addTarget:self action:@selector(switchBtnChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:switchBtn];
        _switchBtn = switchBtn;
    }
    return _switchBtn;
}

-(void)switchBtnChange:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    self.cellModel.Jh_switchBtn_on = mySwitch.on;
    if (self.cellModel.Jh_switchBtnBlock) {
        self.cellModel.Jh_switchBtnBlock(mySwitch.on,mySwitch);
    }
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.hidden = YES;
    //设置右侧显示一个switchBtn
    self.accessoryView = self.switchBtn;
    self.switchBtn.on = cellModel.Jh_switchBtn_on;
    self.switchBtn.onTintColor = cellModel.Jh_switchOnTintColor;
    self.switchBtn.tintColor = cellModel.Jh_switchTintColor;
    self.switchBtn.enabled = cellModel.Jh_editable;
    //如设置左侧图片，则修改样式为垂直居中
    if (self.cellModel.Jh_leftImgName.length) {
        self.cellModel.Jh_cellTextVerticalCenter = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.cellModel.Jh_tipInfo.length) {
        CGFloat topMargin = Jh_SetValueAndDefault(self.cellModel.Jh_tipInfoTopMargin, Jh_TipInfoTopMargin);
        self.titleLabel.Jh_y = (self.cellModel.Jh_cellHeight - self.cellModel.Jh_titleHeight - 2*topMargin - Jh_TipInfoHeight)/2;
        self.tipLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame),CGRectGetMaxY(self.titleLabel.frame)+topMargin, Jh_ScreenWidth-Jh_LeftMargin-Jh_RightMargin, Jh_TipInfoHeight);
    }
}

@end
