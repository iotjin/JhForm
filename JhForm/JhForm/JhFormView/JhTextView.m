//
//  JhTextView.m
//  JhForm
//
//  Created by Jh on 2020/11/23.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhTextView.h"

#define kWordCountLabelHeight 15

@interface JhTextView()<UITextViewDelegate>
//占位符
@property (nonatomic, strong) UILabel *placeholderLabel;
//计数字数
@property (nonatomic, strong) UILabel *wordCountLabel;
@property (nonatomic, assign) UIEdgeInsets placeHolderLabelInsets;

@property (nonatomic, strong) NSString *placeholder;

@end

@implementation JhTextView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI {
    self.backgroundColor = [UIColor clearColor];
    self.delegate = self;
    [self placeholderLabel];
    [self wordCountLabel];
}

//开始编辑
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.Jh_cellInputBlock) {
        self.Jh_cellInputBlock(textView.text, 0);
    }
}

//内容发生改变编辑
- (void)textViewDidChange:(UITextView *)textView {
    if (self.Jh_cellInputBlock) {
        self.Jh_cellInputBlock(textView.text, 1);
    }
    self.placeholderLabel.hidden = (self.text.length != 0);
    // 0 不限制，隐藏计数文字
    if (self.Jh_maxLength == 0) {
        self.wordCountLabel.text = [NSString stringWithFormat:@"%zd",self.text.length];
        return;
    } else {
        self.wordCountLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.text.length,self.Jh_maxLength];
    }
    if (self.text.length > self.Jh_maxLength) {
        self.text = [self.text substringToIndex:self.Jh_maxLength];
        self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/%zd",self.Jh_maxLength,self.Jh_maxLength];
    }
}

//结束编辑
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.Jh_cellInputBlock) {
        self.Jh_cellInputBlock(textView.text, 2);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat placeholderLabelX = _placeHolderLabelInsets.left;
    CGFloat placeholderLabelY = _placeHolderLabelInsets.top;
    CGFloat placeholderLabelWidth = self.frame.size.width - _placeHolderLabelInsets.left - _placeHolderLabelInsets.right;
    CGFloat placeholderLabelHeight = [self.Jh_placeholder boundingRectWithSize:CGSizeMake(placeholderLabelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font}  context:nil].size.height;
    self.placeholderLabel.frame = CGRectMake(placeholderLabelX, placeholderLabelY, placeholderLabelWidth, placeholderLabelHeight);
    if (self.Jh_showLengthNumber) {
        self.wordCountLabel.frame = CGRectMake(CGRectGetWidth(self.frame)-10-60, CGRectGetHeight(self.frame)-5-kWordCountLabelHeight, 60, kWordCountLabelHeight);
    }
}

-(UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = [UIColor lightGrayColor];
        [self addSubview:label];
        self.placeholderLabel = label;
    }
    return _placeholderLabel;
}

-(UILabel *)wordCountLabel {
    if (!_wordCountLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor lightGrayColor];
        [self addSubview:label];
        self.wordCountLabel = label;
    }
    return _wordCountLabel;
}

//调整text内容边距
-(void)setJh_textContainerInset:(UIEdgeInsets)Jh_textContainerInset {
    _Jh_textContainerInset = Jh_textContainerInset;
    self.textContainerInset = Jh_textContainerInset;
    self.placeHolderLabelInsets = Jh_textContainerInset;
    [self setNeedsLayout];
}

- (void)setPlaceHolderLabelInsets:(UIEdgeInsets)placeHolderLabelInsets {
    _placeHolderLabelInsets = placeHolderLabelInsets;
    [self layoutSubviews];
}

-(void)setJh_placeholder:(NSString *)Jh_placeholder {
    _Jh_placeholder = Jh_placeholder;
    self.placeholder = Jh_placeholder;
    self.placeholderLabel.text = Jh_placeholder;
    self.placeholderLabel.hidden = (self.text.length != 0);
    [self setNeedsLayout];
}

-(void)setJh_placeholderColor:(UIColor *)Jh_placeholderColor {
    _Jh_placeholderColor = Jh_placeholderColor;
    self.placeholderLabel.textColor = Jh_placeholderColor;
    [self setNeedsLayout];
}

-(void)setJh_placeholderFont:(CGFloat)Jh_placeholderFont {
    _Jh_placeholderFont = Jh_placeholderFont;
    self.placeholderLabel.font = [UIFont systemFontOfSize:Jh_placeholderFont];
    [self setNeedsLayout];
}

-(void)setJh_maxLength:(NSInteger)Jh_maxLength {
    _Jh_maxLength = Jh_maxLength;
    if (Jh_maxLength == 0) {
        self.wordCountLabel.text = [NSString stringWithFormat:@"%zd",self.text.length];
    } else {
        self.wordCountLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.text.length,Jh_maxLength];
    }
    [self setNeedsLayout];
}

-(void)setJh_showLengthNumber:(BOOL)Jh_showLengthNumber {
    _Jh_showLengthNumber = Jh_showLengthNumber;
    self.wordCountLabel.hidden = !Jh_showLengthNumber;
    [self setNeedsLayout];
}

-(void)setJh_textAlignment:(NSTextAlignment)Jh_textAlignment {
    _Jh_textAlignment = Jh_textAlignment;
    self.textAlignment = Jh_textAlignment;
    self.placeholderLabel.textAlignment = Jh_textAlignment;
    [self setNeedsLayout];
}

@end
