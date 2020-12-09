//
//  JhFormCustumALLViewCell.m
//  JhForm
//
//  Created by Jh on 2019/7/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumALLViewCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@interface JhFormCustumALLViewCell ()

/** 完全自定义视图 */
@property (nonatomic, strong) UIView *custumALLView;

@end

@implementation JhFormCustumALLViewCell

-(UIView *)custumALLView {
    if (!_custumALLView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:view];
        _custumALLView = view;
    }
    return _custumALLView;
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.titleLabel.hidden = YES;
    self.rightTextView.hidden = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.custumALLView.frame =CGRectMake(Jh_LeftMargin,0, Jh_ScreenWidth -Jh_LeftMargin-Jh_RightMargin, self.cellModel.Jh_cellHeight);
    if (self.cellModel.Jh_custumALLViewBlock) {
        self.cellModel.Jh_custumALLViewBlock(self.custumALLView);
    }
}

@end
