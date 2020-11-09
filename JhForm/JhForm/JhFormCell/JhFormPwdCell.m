//
//  JhFormPwdCell.m
//  JhForm
//
//  Created by Jh on 2019/6/21.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormPwdCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "NSString+JhForm.h"


@interface JhFormPwdCell ()<UITextFieldDelegate>


@end

@implementation JhFormPwdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(UITextField *)Jh_pwdTextField{
    if (!_Jh_pwdTextField) {
        UITextField *textField = [[UITextField alloc]init];
        textField.textColor = Jh_rightTextViewTextColor;
        textField.font = [UIFont systemFontOfSize:Jh_InfoFont];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.secureTextEntry = YES;
        textField.delegate = self;
        [textField addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self.contentView addSubview:textField];
        self.Jh_pwdTextField =textField;
        
        [self configureIOS13Theme];
    }
    return _Jh_pwdTextField;
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    if (data.Jh_titleMultiLineShow==YES) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
    }
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    
    self.Jh_pwdTextField.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
    self.Jh_pwdTextField.placeholder = data.Jh_placeholder;
    self.Jh_pwdTextField.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.Jh_pwdTextField.enabled = data.Jh_editable;
    self.Jh_pwdTextField.keyboardType = data.Jh_keyboardType;
    
    self.accessoryType = UITableViewCellAccessoryNone;
    //设置右侧文本的对齐方式
    if (data.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.Jh_pwdTextField.textAlignment = NSTextAlignmentRight;
    }
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    if(data.Jh_rightViewWidth>0 && data.Jh_rightViewBlock){
        data.Jh_rightViewBlock(self.rightView);
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
        if(_data.Jh_rightViewWidth>0){
            self.Jh_pwdTextField.frame =CGRectMake(Jh_Margin_left+3, 0, Jh_SCRREN_WIDTH - 2*Jh_Margin_left - _data.Jh_rightViewWidth-3, self.bounds.size.height);
            self.rightView.frame =CGRectMake(CGRectGetMaxX(self.Jh_pwdTextField.frame), 0, _data.Jh_rightViewWidth, self.bounds.size.height);
        }else{
            self.Jh_pwdTextField.frame =CGRectMake(Jh_Margin_left+3, 0, Jh_SCRREN_WIDTH - 2*Jh_Margin_left-3, self.bounds.size.height);
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
        
        if(_data.Jh_rightViewWidth>0){
            self.Jh_pwdTextField.frame =CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin)-_data.Jh_rightViewWidth, self.bounds.size.height);
            self.rightView.frame =CGRectMake(CGRectGetMaxX(self.Jh_pwdTextField.frame), 0, _data.Jh_rightViewWidth, self.bounds.size.height);
        }else{
            self.Jh_pwdTextField.frame =CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin), self.bounds.size.height);
        }
    }
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.Jh_pwdTextField.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
}

- (void)textDidChange:(UITextField *)textField {
    UITextRange *selectedRange = textField.markedTextRange;
    UITextPosition *position   = [textField positionFromPosition:selectedRange.start offset:0];
    if (position) {
        return ;
    }
    if (self.data.Jh_maxInputLength == 0) {
        return ;
    }
    // 限制输入字数
    if (textField.text.length > self.data.Jh_maxInputLength) {
        textField.text = [textField.text substringToIndex:self.data.Jh_maxInputLength];
    }
    if(self.Jh_pwdInputCompletion){
        self.Jh_pwdInputCompletion(self.Jh_pwdTextField.text);
    }
    if (self.data.JhInputBlock) {
        self.data.JhInputBlock(self.Jh_pwdTextField.text ,NO);
    }
    // 防止输入时表单因刷新动画抖动
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.Jh_pwdTextField.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
    if (self.data.JhInputBlock) {
        self.data.JhInputBlock(self.Jh_pwdTextField.text ,YES);
    }
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
            self.Jh_pwdTextField.textColor = UIColor.labelColor;
        }else {
            self.Jh_pwdTextField.textColor = Jh_rightTextViewTextColor;
        }
    }
}



@end


@implementation UITableView (JhFormPwdCell)

- (JhFormPwdCell *)PwdCellWithId:(NSString *)cellId {
    JhFormPwdCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormPwdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
