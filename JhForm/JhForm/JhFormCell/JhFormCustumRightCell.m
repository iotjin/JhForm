//
//  JhFormCustumRightCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumRightCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@implementation JhFormCustumRightCell

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.hidden = YES;
    if(cellModel.Jh_rightViewBlock){
        cellModel.Jh_rightViewBlock(self.rightView);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat rightView_X = 0;
    if (!self.cellModel.Jh_title.length) {
        rightView_X = Jh_LeftMargin+Jh_InfoLeftMargin;
    } else {
        rightView_X = Jh_LeftMargin+self.cellModel.Jh_titleWidth+Jh_InfoLeftMargin;
    }
    self.rightView.frame =CGRectMake(rightView_X, 0, Jh_ScreenWidth - rightView_X - Jh_RightMargin, self.cellModel.Jh_cellHeight);
}


@end
