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

-(UIView *)RightView{
    if (!_RightView) {
        _RightView = [[UIView alloc]init];
        _RightView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_RightView];
    }
    return _RightView;
}



-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
    
    if (data.Jh_titleMultiLineShow==YES) {
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
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    
    if(data.Jh_intputCellRightViewWidth>0 && data.Jh_intputCellRightViewBlock){
        data.Jh_intputCellRightViewBlock(self.RightView);
    }
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset, Jh_TitleHeight);
        
        CGFloat newHeight = [JhFormInputCell heightWithCellModelData:self.data];
        
        if(_data.Jh_intputCellRightViewWidth>0){
            
            self.rightTextView.frame = CGRectMake(Jh_Margin_left, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left - _data.Jh_intputCellRightViewWidth, newHeight - 2*Jh_EdgeMargin);
            
            self.RightView.frame =CGRectMake(CGRectGetMaxX(self.rightTextView.frame), 0, _data.Jh_intputCellRightViewWidth, self.bounds.size.height);
            
        }else{
            self.rightTextView.frame = CGRectMake(Jh_Margin_left, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left, newHeight - 2*Jh_EdgeMargin);
        }
        
    }else{
        
        /********************************* 左侧标题换行 ********************************/
        
        CGFloat titleHeight = _data.Jh_titleHeight;
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, titleHeight);
        
        
        if (_data.Jh_titleMultiLineShow==YES) {
            if (titleHeight >(_data.Jh_defaultHeight-Jh_EdgeMargin*2)){
                _data.Jh_defaultHeight = titleHeight+Jh_EdgeMargin*2;
                [self.baseTableView reloadData];
            }
        }

        /********************************* 左侧标题换行 ********************************/
        
        CGFloat newHeight = [JhFormInputCell heightWithCellModelData:self.data];
        
        if(_data.Jh_intputCellRightViewWidth>0){
            
            self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin)-_data.Jh_intputCellRightViewWidth, newHeight - 2*Jh_EdgeMargin);
            
            self.RightView.frame =CGRectMake(CGRectGetMaxX(self.rightTextView.frame), 0, _data.Jh_intputCellRightViewWidth, self.bounds.size.height);
            
        }else{
            self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin), newHeight - 2*Jh_EdgeMargin);
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
        width = (data.Jh_intputCellRightViewWidth>0) ? (2*Jh_Margin_left+data.Jh_intputCellRightViewWidth) : (2*Jh_Margin_left);
    }else{
        width = (data.Jh_intputCellRightViewWidth>0) ? (data.Jh_titleWidth + 3*Jh_EdgeMargin+data.Jh_intputCellRightViewWidth) : (data.Jh_titleWidth + 3*Jh_EdgeMargin);
    }
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH -width, MAXFLOAT)].height;
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
