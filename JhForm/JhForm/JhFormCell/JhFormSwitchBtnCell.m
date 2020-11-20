//
//  JhFormSwitchBtnCell.m
//  JhReader
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSwitchBtnCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"

@implementation JhFormSwitchBtnCell

- (UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc]init];
        _switchBtn.backgroundColor = [UIColor clearColor];
        [_switchBtn addTarget:self action:@selector(switchBtnChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_switchBtn];
    }
    return _switchBtn;
}

- (void)switchBtnChange:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    self.data.Jh_switchBtn_on = mySwitch.on;
    if (self.data.Jh_switchBtnBlock) {
        self.data.Jh_switchBtnBlock(mySwitch.on, mySwitch);
    }
}

-(void)setData:(JhFormCellModel *)data {
    _data= data;
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    //设置右侧显示一个switchBtn
    self.accessoryView = self.switchBtn;
    self.switchBtn.on = data.Jh_switchBtn_on;
    self.switchBtn.onTintColor = data.Jh_switchOnTintColor;
    self.switchBtn.tintColor = data.Jh_switchTintColor;
    self.switchBtn.enabled = data.Jh_editable;
    if (data.Jh_cellBgColor) {
        self.backgroundColor = data.Jh_cellBgColor;
    }
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
    self.titleLabel.frame = CGRectMake(titleLabel_X, (self.data.Jh_defaultHeight - Jh_TitleHeight)/2, self.data.Jh_titleWidth, Jh_TitleHeight);
}

@end

@implementation UITableView (JhFormSwitchBtnCell)

- (JhFormSwitchBtnCell *)SwitchBtnCellWithId:(NSString *)cellId {
    JhFormSwitchBtnCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSwitchBtnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
