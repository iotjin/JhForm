//
//  DynamicView.h
//  JhForm
//
//  Created by Jh on 2019/9/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicView : UIView

@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

- (IBAction)ClickDeleteBtn:(id)sender;
- (IBAction)MoneyInput:(id)sender;

@property (nonatomic,   copy) void(^ClickNameBlock)(void);
@property (nonatomic,   copy) void(^ClickDeleteBlock)(UIButton *button);
@property (nonatomic,   copy) void(^InputBlock)(NSString *value);


@end

NS_ASSUME_NONNULL_END
