//
//  JhFormSelectCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSelectCell.h"
#import "JhFormCellModel.h"
#import "JhTextView.h"
#import "JhFormConst.h"

@implementation JhFormSelectCell

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.userInteractionEnabled = NO;
    //是否隐藏右侧箭头
    if (cellModel.Jh_hiddenArrow ==YES) {
        self.accessoryType = UITableViewCellAccessoryNone;
    } else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
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
