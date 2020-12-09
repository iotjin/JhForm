//
//  JhFormCenterTextCell.m
//  JhForm
//
//  Created by Jh on 2019/3/13.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCenterTextCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@implementation JhFormCenterTextCell

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.hidden = YES;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    CGFloat font = cellModel.Jh_titleFont == Jh_TitleFont ? 20 : cellModel.Jh_titleFont;
    self.titleLabel.font = JhFontsize(font);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat titleWidth = self.cellModel.Jh_titleWidth;
    CGFloat titleHeight = self.cellModel.Jh_titleHeight;
    self.titleLabel.frame = CGRectMake(0, 0, self.Jh_width, self.Jh_height);
    
    //如设置左侧图片，则显示图片
    CGFloat imgAndMarginWidth = 0;
    if (self.cellModel.Jh_leftImgName.length) {
        CGFloat imgW = Jh_SetValueAndDefault(self.cellModel.Jh_leftImgWH, Jh_LeftImgWH);
        CGFloat marginW = Jh_SetValueAndDefault(self.cellModel.Jh_leftImgRightMargin, Jh_LeftImgRightMargin);
        imgAndMarginWidth = imgW + marginW;
        self.leftImgView.frame = CGRectMake((Jh_ScreenWidth-imgAndMarginWidth-titleWidth)/2, (self.cellModel.Jh_cellHeight - titleHeight)/2,imgW, imgW);
        self.leftImgView.image = [UIImage imageNamed:self.cellModel.Jh_leftImgName];
        if (titleWidth) {
            self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.leftImgView.frame)+marginW,  (self.cellModel.Jh_cellHeight - titleHeight)/2,titleWidth, titleHeight);
        }
    }
}

@end
