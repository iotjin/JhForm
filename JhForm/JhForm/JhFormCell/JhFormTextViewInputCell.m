//
//  JhFormTextViewInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTextViewInputCell.h"

#import "JhFormItem.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"
#import "NSString+JhForm.h"
#import "UITextView+TextLimit.h"



@interface JhFormTextViewInputCell()<UITextViewDelegate>

@property (nonatomic, strong) UIView *line1;

@end

@implementation JhFormTextViewInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setItem:(JhFormItem *)item {
    _item = item;
    
    self.titleLabel.attributedText = item.attributedTitle;
    self.rightTextView.text = [item.info addUnit:item.unit];
    self.rightTextView.attributedPlaceholder = item.attributedPlaceholder;
    self.rightTextView.editable = item.editable;
    self.rightTextView.keyboardType = item.keyboardType;
    self.rightTextView.currentLength = item.info.length;
    self.rightTextView.showLength = item.showLength;
    self.rightTextView.maxLength = item.maxInputLength;
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_EdgeMargin, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
    
    //重置 rightTextView 内边距
    self.rightTextView.textContainerInset = UIEdgeInsetsMake(Jh_EdgeMargin, Jh_EdgeMargin, Jh_EdgeMargin, Jh_EdgeMargin);
//    self.rightTextView.backgroundColor = Jh_TEXTVIEW_BACKGROUNDCOLOR;
    
    self.rightTextView.backgroundColor  = BaseBgWhiteColor;
    
    CGFloat newHeight = [JhFormTextViewInputCell heightWithItem:self.item];
    
//    CGFloat width = Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin;
    
    CGFloat width = self.bounds.size.width - 2*Jh_EdgeMargin;
    
    self.rightTextView.frame = CGRectMake(Jh_EdgeMargin, CGRectGetMaxY(self.titleLabel.frame) + Jh_EdgeMargin, width, newHeight - 3*Jh_EdgeMargin - Jh_TitleHeight);
    
    /********************************* 底部加线 ********************************/
    
    _line1=[[UIView alloc]init];
    _line1.backgroundColor=BaselineColor;
    [self addSubview:_line1];
    _line1.frame= CGRectMake(Jh_EdgeMargin+5,CGRectGetMinY(self.rightTextView.frame)-2, Jh_SCRREN_WIDTH - Jh_EdgeMargin-5, 1);
    
    /********************************* 底部加线 ********************************/
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.rightTextView.text = self.item.info;
    self.rightTextView.currentLength = self.rightTextView.text.length;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.item.maxInputLength > 0) {
        [self.rightTextView textLimitWithMaxLength:self.item.maxInputLength];
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
    self.rightTextView.text = [self.item.info addUnit:self.item.unit];
}

+ (CGFloat)heightWithItem:(JhFormItem *)item {
    CGFloat infoHeight = [item.info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - 4*Jh_EdgeMargin, MAXFLOAT)].height;
    return MAX(item.defaultHeight, infoHeight + Jh_TitleHeight + 5*Jh_EdgeMargin);
}


@end

@implementation UITableView (JhFormTextViewInputCell)

- (JhFormTextViewInputCell *)textViewInputCellWithId:(NSString *)cellId
{
    JhFormTextViewInputCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormTextViewInputCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
