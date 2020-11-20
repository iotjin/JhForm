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

@interface JhFormBaseCell() <UITextViewDelegate>
@end

@implementation JhFormBaseCell

- (UIImageView *)leftImgView {
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_leftImgView];
    }
    return _leftImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:Jh_TitleFont];
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        
        if (@available(iOS 13.0, *)) {
            _titleLabel.textColor = UIColor.labelColor;
        } else {
            _titleLabel.textColor = Jh_titleColor;
        }
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (SelwynExpandableTextView *)rightTextView {
    if (!_rightTextView) {
        _rightTextView = [[SelwynExpandableTextView alloc] init];
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
        
        if (@available(iOS 13.0, *)) {
            BOOL isDarkMode = (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
            _rightTextView.textColor = (isDarkMode ? UIColor.labelColor : Jh_rightTextViewTextColor);
            _rightTextView.placeholderTextColor = UIColor.placeholderTextColor;
        } else {
            _rightTextView.textColor = Jh_rightTextViewTextColor;
            _rightTextView.placeholderTextColor = Jh_PlaceholderColor;
        }
        
        [self.contentView addSubview:_rightTextView];
    }
    return _rightTextView;
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_rightView];
    }
    return _rightView;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self configureIOS13Theme];
        }
    }
}

-(void)configureIOS13Theme{
    if (@available(iOS 13.0, *)) {
        _titleLabel.textColor = UIColor.labelColor;
        
        BOOL isDarkMode = (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
        _rightTextView.textColor = (isDarkMode ? UIColor.labelColor : Jh_rightTextViewTextColor);
        _rightTextView.placeholderTextColor = UIColor.placeholderTextColor;
        
        [self.baseTableView reloadData];
    }
}

@end
