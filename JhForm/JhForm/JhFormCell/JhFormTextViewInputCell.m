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
#import "SelwynExpandableTextView.h"
#import "NSString+JhForm.h"
#import "UITextView+TextLimit.h"

@interface JhFormTextViewInputCell()<UITextViewDelegate>

@property (nonatomic, strong) UIView *line1;

@end

@implementation JhFormTextViewInputCell

-(UIView *)line1 {
    if (!_line1) {
        _line1=[[UIView alloc]init];
        _line1.backgroundColor=BaselineColor;
        [self.contentView addSubview:_line1];
        
        [self configureIOS13Theme];
    }
    return _line1;
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.rightTextView.text = [data.Jh_info addUnit:data.Jh_unit];
    self.rightTextView.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.rightTextView.editable = data.Jh_editable;
    self.rightTextView.keyboardType = data.Jh_keyboardType;
    self.rightTextView.currentLength = data.Jh_info.length;
    self.rightTextView.showLength = data.Jh_showLength;
    self.rightTextView.maxLength = data.Jh_maxInputLength;
    self.accessoryType = UITableViewCellAccessoryNone;
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    if (data.Jh_Cell_NoEdit == YES) {
        self.userInteractionEnabled = NO;
    }else{
        self.userInteractionEnabled = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        CGFloat newHeight = [JhFormTextViewInputCell heightWithCellModelData:self.data];
        self.rightTextView.frame = CGRectMake(Jh_Margin_left+3, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left-3, newHeight - 2*Jh_EdgeMargin);
    }else{
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, Jh_TitleHeight);
        //重置 rightTextView 内边距
        self.rightTextView.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
        self.rightTextView.backgroundColor = Jh_textView_BackgroundColor;
        CGFloat newHeight = [JhFormTextViewInputCell heightWithCellModelData:self.data];
        CGFloat width = self.bounds.size.width - 2*Jh_EdgeMargin;
        self.rightTextView.frame = CGRectMake(Jh_EdgeMargin, CGRectGetMaxY(self.titleLabel.frame) + Jh_EdgeMargin, width, newHeight - 3*Jh_EdgeMargin - Jh_TitleHeight);
        //底部加线
        self.line1.frame= CGRectMake(Jh_LineEdgeMargin,CGRectGetMinY(self.rightTextView.frame)-2, Jh_SCRREN_WIDTH - Jh_LineEdgeMargin, 1);
    }
    [self configureIOS13Theme];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.rightTextView.text = self.data.Jh_info;
    self.rightTextView.currentLength = self.rightTextView.text.length;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.data.Jh_maxInputLength > 0) {
        [self.rightTextView textLimitWithMaxLength:self.data.Jh_maxInputLength];
    }
    self.rightTextView.currentLength = self.rightTextView.text.length;
    if (self.textViewInputCompletion) {
        self.textViewInputCompletion(self.rightTextView.text);
    }
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.rightTextView.currentLength = self.rightTextView.text.length;
    self.rightTextView.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
}

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data {
    CGFloat width = data.Jh_title.length ? (4*Jh_EdgeMargin) : (2*Jh_Margin_left+3);
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - width, MAXFLOAT)].height;
    return MAX(data.Jh_defaultHeight, infoHeight + 2*Jh_EdgeMargin);
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
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            self.line1.backgroundColor = [UIColor separatorColor];
            self.rightTextView.backgroundColor = JhColor(50, 50, 50);
        }else {
            self.line1.backgroundColor = BaselineColor;
            self.rightTextView.backgroundColor = Jh_textView_BackgroundColor;
        }
    }
}

@end

@implementation UITableView (JhFormTextViewInputCell)

- (JhFormTextViewInputCell *)textViewInputCellWithId:(NSString *)cellId {
    JhFormTextViewInputCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormTextViewInputCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
