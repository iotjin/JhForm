//
//  JhFormTextViewInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTextViewInputCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@implementation JhFormTextViewInputCell

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    JhWeakSelf
    self.rightTextView.Jh_textContainerInset = cellModel.Jh_textContainerInset;
    self.rightTextView.backgroundColor = Jh_TextViewBgColor;
    self.rightTextView.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputStates) {
        cellModel.Jh_info = inputText;
        [UIView performWithoutAnimation:^{
            [weakSelf.baseTableView beginUpdates];
            [weakSelf.baseTableView endUpdates];
        }];
        if (cellModel.Jh_cellInputBlock) {
            cellModel.Jh_cellInputBlock(inputText, inputStates);
        }
    };
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.cellModel.Jh_title.length) {
        self.titleLabel.hidden = YES;
        self.line.hidden = YES;
        self.rightTextView.frame = CGRectMake(Jh_LeftMargin, Jh_Margin/2, Jh_ScreenWidth - Jh_LeftMargin - Jh_RightMargin, self.cellModel.Jh_textViewHeight);
    } else {
        self.titleLabel.hidden = NO;
        self.line.hidden = NO;
        self.line.frame = CGRectMake(Jh_LineLeftMargin, CGRectGetMaxY(self.titleLabel.frame)+Jh_Margin+Jh_LineHeight, Jh_ScreenWidth - Jh_LineLeftMargin, Jh_LineHeight);
        self.rightTextView.frame = CGRectMake(Jh_LeftMargin, CGRectGetMaxY(self.line.frame), self.cellModel.Jh_textViewWidth, self.cellModel.Jh_textViewHeight);
        if (self.cellModel.Jh_hiddenCustomLine == YES) {
            self.line.hidden = YES;
        }
    }
}


@end
