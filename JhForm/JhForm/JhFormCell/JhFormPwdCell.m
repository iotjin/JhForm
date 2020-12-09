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
#import "JhTextView.h"

@interface JhFormPwdCell ()<UITextFieldDelegate>

/** 右侧 Jh_pwdTextField 控件 */
@property (nonatomic, strong) UITextField  *Jh_pwdTextField;

@end

@implementation JhFormPwdCell

-(UITextField *)Jh_pwdTextField{
    if (!_Jh_pwdTextField) {
        UITextField *textField = [[UITextField alloc]init];
        textField.textColor = Jh_InfoTextColor;
        textField.font = JhFontsize(Jh_InfoFont);
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.secureTextEntry = YES;
        textField.delegate = self;
        [textField addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self.contentView addSubview:textField];
        self.Jh_pwdTextField =textField;
    }
    return _Jh_pwdTextField;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.cellModel.Jh_cellInputBlock) {
        self.cellModel.Jh_cellInputBlock(textField.text, 0);
    }
}

- (void)textDidChange:(UITextField *)textField {
    UITextRange *selectedRange = textField.markedTextRange;
    UITextPosition *position   = [textField positionFromPosition:selectedRange.start offset:0];
    if (position) {
        return ;
    }
    if (self.cellModel.Jh_maxInputLength == 0) {
        return ;
    }
    NSString *inputText = textField.text;
    // 限制录入字数
    if (inputText.length > self.cellModel.Jh_maxInputLength) {
        inputText = [inputText substringToIndex:self.cellModel.Jh_maxInputLength];
    }
    self.cellModel.Jh_info = inputText;
    if (self.cellModel.Jh_cellInputBlock) {
        self.cellModel.Jh_cellInputBlock(inputText, 1);
    }
    [self Jh_reloadData];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.cellModel.Jh_info = textField.text;
    if (self.cellModel.Jh_cellInputBlock) {
        self.cellModel.Jh_cellInputBlock(textField.text, 2);
    }
}

- (void)Jh_reloadData {
    JhWeakSelf
    [UIView performWithoutAnimation:^{
        [weakSelf.baseTableView beginUpdates];
        [weakSelf.baseTableView endUpdates];
    }];
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
    self.rightTextView.hidden = YES;
    self.Jh_pwdTextField.text = cellModel.Jh_info;
    self.Jh_pwdTextField.placeholder = cellModel.Jh_placeholder;
    self.Jh_pwdTextField.enabled = cellModel.Jh_editable;
    self.Jh_pwdTextField.keyboardType = cellModel.Jh_keyboardType;
    //设置右侧文本的对齐方式
    if (cellModel.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.Jh_pwdTextField.textAlignment = NSTextAlignmentRight;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.Jh_pwdTextField.frame = self.rightTextView.frame;
}

//右侧按钮点击事件
- (void)Jh_clickRightButton:(UIButton *)button {
    button.selected = !button.isSelected;
    self.Jh_pwdTextField.secureTextEntry = !self.Jh_pwdTextField.secureTextEntry;
    if (self.cellModel.Jh_rightBtnClickBlock) {
        self.cellModel.Jh_rightBtnClickBlock(button);
    }
}

@end
