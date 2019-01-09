//
//  JhFormBaseCell.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"

@interface JhFormBaseCell()<UITextViewDelegate>
@end
@implementation JhFormBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:Jh_TitleFont];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_titleLabel];        
//        _titleLabel.backgroundColor =JhRandomColor;
    }
    return _titleLabel;
}

- (SelwynExpandableTextView *)rightTextView {
    if (!_rightTextView) {
        _rightTextView = [[SelwynExpandableTextView alloc]init];
        _rightTextView.delegate = self;
        _rightTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _rightTextView.textContainer.lineFragmentPadding = 0;
        _rightTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _rightTextView.backgroundColor = [UIColor clearColor];
        _rightTextView.font = [UIFont systemFontOfSize:Jh_InfoFont];
        _rightTextView.scrollEnabled = NO;
        _rightTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        _rightTextView.layoutManager.allowsNonContiguousLayout = NO;
        _rightTextView.showsVerticalScrollIndicator = NO;
        _rightTextView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:_rightTextView];
    }
    return _rightTextView;
}



@end
