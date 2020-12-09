//
//  CustumCell.m
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "CustumCell.h"
#import "CustumModel.h"

@implementation CustumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset=UIEdgeInsetsMake(0,0,0,MAXFLOAT);
    
    self.btn.layer.cornerRadius = 10;
    self.btn.layer.borderColor = [UIColor orangeColor].CGColor;
    self.btn.layer.borderWidth = 1;
}

-(void)setFrame:(CGRect)frame {
    frame.size.height -= 3;
    frame.origin.y += 1;
    [super setFrame:frame];
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(CustumModel *)cellModel {
    self.model = cellModel;
    self.nameLabel.text = cellModel.name;
    self.contentLabel.text = cellModel.content;
    self.switchBtn.on = cellModel.Jh_switchBtn_on;
    self.switchBtn.hidden = cellModel.hiddenSwitchBtn;
}

- (IBAction)ClickSwitchBtn:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    self.cellModel.Jh_switchBtn_on = mySwitch.on;
    if (self.cellModel.Jh_switchBtnBlock) {
        self.cellModel.Jh_switchBtnBlock(mySwitch.on,mySwitch);
    }
}

- (IBAction)ClickBtn:(id)sender {
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    
    UIColor *color = [UIColor orangeColor];
    color = button.isSelected ? [UIColor grayColor] : color;
    self.btn.layer.borderColor = color.CGColor;
    if (self.model.clickBtnBlock) {
        self.model.clickBtnBlock(self.model);
    }
}

@end
