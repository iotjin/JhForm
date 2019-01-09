//
//  JhFormInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormInputCell.h"

#import "JhFormItem.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"
#import "UITextView+TextLimit.h"
#import "NSString+JhForm.h"

@interface JhFormInputCell()<UITextViewDelegate>
@end

@implementation JhFormInputCell

- (void)setItem:(JhFormItem *)item {
    _item = item;
    
//    self.titleLabel.text = item.title;
    self.titleLabel.attributedText = item.attributedTitle;
    self.rightTextView.text = [item.info addUnit:item.unit];
    self.rightTextView.attributedPlaceholder = item.attributedPlaceholder;
    self.rightTextView.editable = item.editable;
    self.rightTextView.keyboardType = item.keyboardType;
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_EdgeMargin, Jh_EdgeMargin, Jh_TitleWidth, Jh_TitleHeight);
    
    CGFloat newHeight = [JhFormInputCell heightWithItem:self.item];
    self.rightTextView.frame = CGRectMake(Jh_TitleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (Jh_TitleWidth + 3*Jh_EdgeMargin), newHeight - 2*Jh_EdgeMargin);
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.rightTextView.text = self.item.info;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.item.maxInputLength > 0) {
        // 限制输入字数
        [self.rightTextView textLimitWithMaxLength:self.item.maxInputLength];
    }
    if (self.inputCompletion) {
        self.inputCompletion(self.rightTextView.text);
    }
    // 防止输入时表单因刷新动画抖动
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.rightTextView.text = [self.item.info addUnit:self.item.unit];
}

+ (CGFloat)heightWithItem:(JhFormItem *)item {
    CGFloat infoHeight = [item.info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - (Jh_TitleWidth + 3*Jh_EdgeMargin), MAXFLOAT)].height;
    return MAX(item.defaultHeight, infoHeight + 2*Jh_EdgeMargin);
}




- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end


@implementation UITableView (JhFormInputCell)

- (JhFormInputCell *)inputCellWithId:(NSString *)cellId
{
    JhFormInputCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormInputCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
