//
//  DynamicView.m
//  JhForm
//
//  Created by Jh on 2019/9/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "DynamicView.h"

@implementation DynamicView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUI];
}

- (void)setUI {
    self.companyNameLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlerTap:)];
    [self.companyNameLabel addGestureRecognizer:gesture];
    self.moneyTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)handlerTap:(UITapGestureRecognizer*)gesture {
    if (self.ClickNameBlock) {
        self.ClickNameBlock();
    }
}

- (IBAction)MoneyInput:(id)sender {
    UITextField *textField = (UITextField*)sender;
    if (self.InputBlock) {
        self.InputBlock(textField.text);
    }
}

- (IBAction)ClickDeleteBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (self.ClickDeleteBlock) {
        self.ClickDeleteBlock(btn);
    }
}

@end
