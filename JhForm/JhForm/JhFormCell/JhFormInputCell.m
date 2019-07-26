//
//  JhFormInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormInputCell.h"

#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"
#import "UITextView+TextLimit.h"
#import "NSString+JhForm.h"

@interface JhFormInputCell()<UITextViewDelegate>
@end

@implementation JhFormInputCell

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
//    self.titleLabel.text = data.title;
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.rightTextView.text = [data.Jh_info addUnit:data.Jh_unit];
    self.rightTextView.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.rightTextView.editable = data.Jh_editable;
    self.rightTextView.keyboardType = data.Jh_keyboardType;
    self.accessoryType = UITableViewCellAccessoryNone;
    
    //设置右侧文本的对齐方式
    if (data.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.rightTextView.textAlignment = NSTextAlignmentRight;
    }
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_Margin_left, Jh_EdgeMargin, self.data.Jh_titleWidth, Jh_TitleHeight);
    
    CGFloat newHeight = [JhFormInputCell heightWithCellModelData:self.data];
    self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin), newHeight - 2*Jh_EdgeMargin);
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.rightTextView.text = self.data.Jh_info;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.data.Jh_maxInputLength > 0) {
        // 限制输入字数
        [self.rightTextView textLimitWithMaxLength:self.data.Jh_maxInputLength];
    }
    if (self.inputCompletion) {
        self.inputCompletion(self.rightTextView.text);
    }
    
    if (_data.JhInputBlock) {
        _data.JhInputBlock(self.rightTextView.text ,NO);
    }
    
    
    // 防止输入时表单因刷新动画抖动
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}


- (void)textViewDidEndEditing:(UITextView *)textView {
    self.rightTextView.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
    
    if (_data.JhInputBlock) {
        _data.JhInputBlock(self.rightTextView.text ,YES);
    }
}

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data{
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - (data.Jh_titleWidth + 3*Jh_EdgeMargin), MAXFLOAT)].height;
    return MAX(data.Jh_defaultHeight, infoHeight + 2*Jh_EdgeMargin);
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
