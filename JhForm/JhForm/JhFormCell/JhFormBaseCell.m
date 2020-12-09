//
//  JhFormBaseCell.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"
#import "JhFormCellModel.h"
#import "JhTextView.h"
#import "JhFormConst.h"

@interface JhFormBaseCell()

@end

@implementation JhFormBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = JhBaseCellBgColor;
        [self Jh_initUI];
    }
    return self;
}

- (void)Jh_initUI {}

-(UILabel *)redStarLabel {
    if (!_redStarLabel) {
        UILabel *label = [[UILabel alloc]init];
        label.text = @"*";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.font = JhFontsize(15);
        [self.contentView addSubview:label];
        _redStarLabel = label;
    }
    return _redStarLabel;
}

- (UIImageView *)leftImgView {
    if (!_leftImgView) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:imgView];
        _leftImgView = imgView;
    }
    return _leftImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.adjustsFontSizeToFitWidth = YES;
        label.numberOfLines = 0;
        label.font = JhFontsize(Jh_TitleFont);
        label.textColor = Jh_TitleColor;
        [self.contentView addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

-(JhTextView *)rightTextView {
    if (!_rightTextView) {
        JhTextView *textView = [[JhTextView alloc]init];
        textView.textContainer.lineFragmentPadding = 0;
        textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        textView.backgroundColor = [UIColor clearColor];
        textView.scrollEnabled = NO;
        textView.autocorrectionType = UITextAutocorrectionTypeNo;
        textView.layoutManager.allowsNonContiguousLayout = NO;
        textView.showsVerticalScrollIndicator = NO;
        textView.showsHorizontalScrollIndicator = NO;
        textView.font = JhFontsize(Jh_InfoFont);
        textView.textColor = Jh_InfoTextColor;
        textView.Jh_placeholderFont = Jh_InfoFont;
        textView.Jh_placeholderColor = Jh_PlaceholderColor;
        [self.contentView addSubview:textView];
        _rightTextView = textView;
    }
    return _rightTextView;
}

-(UIButton *)rightBtn {
    if (!_rightBtn) {
        UIButton * button = [[UIButton alloc]init];
        button.titleLabel.font = JhFontsize(Jh_SuffixTextFont);
        [button setTitleColor:Jh_SuffixTextColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(Jh_clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        _rightBtn = button;
    }
    return _rightBtn;
}

//右侧按钮点击事件
- (void)Jh_clickRightButton:(UIButton *)button {}

- (UIView *)rightView {
    if (!_rightView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:view];
        _rightView = view;
    }
    return _rightView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        UILabel *label = [[UILabel alloc]init];
        label.numberOfLines = 0;
        label.textColor = Jh_TipInfoColor;
        label.font = JhFontsize(Jh_TipInfoFont);
        [self.contentView addSubview:label];
        _tipLabel = label;
    }
    return _tipLabel;
}

- (UIView *)line {
    if (!_line) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = JhBaseLineColor;
        [self.contentView addSubview:view];
        _line = view;
    }
    return _line;
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    self.cellModel = cellModel;
}

@end
