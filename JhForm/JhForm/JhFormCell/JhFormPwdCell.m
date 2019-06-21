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
        
    }
    return _Jh_pwdTextField;
}



-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
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
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //标题垂直居中
    self.titleLabel.frame = CGRectMake(Jh_Margin_left, (self.data.Jh_defaultHeight - Jh_TitleHeight)/2, self.data.Jh_titleWidth, Jh_TitleHeight);
    
    self.Jh_pwdTextField.frame =CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 3*Jh_EdgeMargin), self.bounds.size.height);
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.Jh_pwdTextField.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
}

- (void)textDidChange:(UITextField *)textField
{
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





@end


@implementation UITableView (JhFormPwdCell)

- (JhFormPwdCell *)PwdCellWithId:(NSString *)cellId
{
    JhFormPwdCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormPwdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
        
    }
    return cell;
}

@end
