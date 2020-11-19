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
    
    if (data.Jh_titleMultiLineShow) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
    }
    
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
    if (data.Jh_cellBgColor) {
        self.backgroundColor = data.Jh_cellBgColor;
    }
    if (data.Jh_rightViewWidth>0 && data.Jh_rightViewBlock){
        data.Jh_rightViewBlock(self.rightView);
    }

    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        CGFloat newHeight = [JhFormInputCell heightWithCellModelData:self.data];
        
        if (_data.Jh_rightViewWidth > 0) {
            self.rightTextView.frame = CGRectMake(Jh_Margin_left+3, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left - _data.Jh_rightViewWidth-3, newHeight - 2*Jh_EdgeMargin);
            self.rightView.frame = CGRectMake(CGRectGetMaxX(self.rightTextView.frame), 0, _data.Jh_rightViewWidth, self.bounds.size.height);
        } else {
            self.rightTextView.frame = CGRectMake(Jh_Margin_left+3, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left-3, newHeight - 2*Jh_EdgeMargin);
        }
    } else {
        /********************************* 左侧标题换行 ********************************/
        CGFloat titleHeight = _data.Jh_titleHeight;
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, titleHeight);

        if (_data.Jh_titleMultiLineShow) {
            if (titleHeight > (_data.Jh_defaultHeight-Jh_EdgeMargin*2)){
                _data.Jh_defaultHeight = titleHeight + Jh_EdgeMargin*2;
                [self.baseTableView reloadData];
            }
        }
        /********************************* 左侧标题换行 ********************************/
        
        CGFloat newHeight = [JhFormInputCell heightWithCellModelData:self.data];
        if(_data.Jh_rightViewWidth>0){
            self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin)-_data.Jh_rightViewWidth, newHeight - 2*Jh_EdgeMargin);
            self.rightView.frame =CGRectMake(CGRectGetMaxX(self.rightTextView.frame), 0, _data.Jh_rightViewWidth, self.bounds.size.height);
        }else{
            self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin), newHeight - 2*Jh_EdgeMargin);
        }
        
        //文字垂直居中
        if (_data.Jh_cellTextVerticalCenter == true || Jh_CellTextVerticalStyle == JhCellTextVerticalStyleCenter) {
            CGFloat titleLabelY = (newHeight -titleHeight)/2;
            self.titleLabel.hx_y = titleLabelY;
            CGFloat infoHeight = [JhFormInputCell infoHeightWithCellModelData:self.data];
            CGFloat infoY = (newHeight -infoHeight)/2;
            self.rightTextView.hx_y = infoY;
            self.rightTextView.hx_h = infoHeight;
        }
    }
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
    CGFloat width;
    if (!data.Jh_title.length) {
        width = (data.Jh_rightViewWidth>0) ? (2*Jh_Margin_left+data.Jh_rightViewWidth+3) : (2*Jh_Margin_left+3);
    }else{
        width = (data.Jh_rightViewWidth>0) ? (data.Jh_titleWidth + 3*Jh_EdgeMargin+data.Jh_rightViewWidth) : (data.Jh_titleWidth + 3*Jh_EdgeMargin);
    }
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH -width, MAXFLOAT)].height;
    return MAX(data.Jh_defaultHeight, infoHeight + 2*Jh_EdgeMargin);
}

+ (CGFloat)infoHeightWithCellModelData:(JhFormCellModel *)data{
    CGFloat width;
    if (!data.Jh_title.length) {
        width = (data.Jh_rightViewWidth>0) ? (2*Jh_Margin_left+data.Jh_rightViewWidth+3) : (2*Jh_Margin_left+3);
    }else{
        width = (data.Jh_rightViewWidth>0) ? (data.Jh_titleWidth + 3*Jh_EdgeMargin+data.Jh_rightViewWidth) : (data.Jh_titleWidth + 3*Jh_EdgeMargin);
    }
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - width, MAXFLOAT)].height;
    return infoHeight;
}

@end

@implementation UITableView (JhFormInputCell)

- (JhFormInputCell *)inputCellWithId:(NSString *)cellId {
    JhFormInputCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
