//
//  CustumCell.h
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhFormInputCell.h"

NS_ASSUME_NONNULL_BEGIN

@class CustumModel;
@interface CustumCell : JhFormInputCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)ClickBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
- (IBAction)ClickSwitchBtn:(id)sender;


@property (nonatomic, strong) CustumModel *model;

@end

NS_ASSUME_NONNULL_END
