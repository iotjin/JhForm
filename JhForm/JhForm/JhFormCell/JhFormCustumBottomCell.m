//
//  JhFormCustumBottomCell.m
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumBottomCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@interface JhFormCustumBottomCell ()

/** 自定义视图 */
@property (nonatomic, strong) UIView *custumBottomView;

@end

@implementation JhFormCustumBottomCell

-(UIView *)custumBottomView {
    if (!_custumBottomView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:view];
        _custumBottomView = view;
    }
    return _custumBottomView;
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.hidden = YES;
    if (cellModel.Jh_custumBottomViewBlock) {
        cellModel.Jh_custumBottomViewBlock(self.custumBottomView);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.line.frame= CGRectMake(Jh_LineLeftMargin,CGRectGetMaxY(self.titleLabel.frame)+Jh_Margin, Jh_ScreenWidth - Jh_LineLeftMargin, Jh_LineHeight);
    self.custumBottomView.frame = CGRectMake(Jh_LeftMargin, CGRectGetMaxY(self.line.frame)+Jh_Margin, Jh_ScreenWidth-Jh_LeftMargin-Jh_RightMargin, self.bounds.size.height - CGRectGetMaxY(self.line.frame)-2*Jh_Margin);
    if (self.cellModel.Jh_hiddenCustomLine == YES) {
        self.line.hidden = YES;
    }
}


@end
