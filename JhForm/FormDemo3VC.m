//
//  FormDemo3VC.m
//  JhForm
//
//  Created by Jh on 2019/6/21.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo3VC.h"


#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo3VC ()

@property (nonatomic, strong) JhFormCellModel *pwd;
@property (nonatomic, strong) JhFormCellModel *pwd2;
@property (nonatomic, strong) JhFormCellModel *pwd3;




@end

@implementation FormDemo3VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configFormModel];
    
}


#pragma mark - configFormModel
-(void)configFormModel{
    
    
    self.Jh_navTitle = @"修改密码";
    
    __weak typeof(self) weakSelf = self;
    
    
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    _pwd = JhFormCellModel_AddPwdInputCell(@"旧密码:", @"", YES);
    _pwd.Jh_placeholder = @"请输入旧密码";
    _pwd.Jh_maxInputLength = 25;
    _pwd.Jh_InfoTextAlignment =  JhFormCellInfoTextAlignmentRight;
    _pwd.Jh_keyboardType = UIKeyboardTypeNumberPad;
    _pwd.JhInputBlock = ^(NSString * _Nonnull text, BOOL isInputCompletion) {
        NSLog(@"当前的输入状态: %@", isInputCompletion ? @"YES" : @"NO");
        NSLog(@"文字: %@", text);
    };
    
    
    _pwd2 = JhFormCellModel_AddPwdInputCell(@"新密码:", @"", YES);
    _pwd2.Jh_placeholder = @"请输入新密码";

    _pwd3 = JhFormCellModel_AddPwdInputCell(@"确认密码:", @"", YES);
    _pwd3.Jh_placeholder = @"请确认密码";
    
    JhFormCellModel *cell1 = JhFormCellModel_AddPwdInputCell(@"密码", @"", YES);
    cell1.Jh_placeholder =@"请输入16位数字、字母组合";
    cell1.Jh_maxInputLength = 16;
    cell1.Jh_intputCellRightViewWidth = 60; //右侧自定义view 可添加显示密码按钮
    cell1.Jh_intputCellRightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    

    JhFormCellModel *pwd4 = JhFormCellModel_AddPwdInputCell(@"可换行的密码密码密码密码", @"", NO);
    pwd4.Jh_titleMultiLineShow = YES;
    pwd4.Jh_placeholder = @"请输入密码";
    
    JhFormCellModel *pwd5 = JhFormCellModel_AddPwdInputCell(@"", @"", YES);
    pwd5.Jh_placeholder = @"请输入密码";
    
    
    [cellModelArr addObjectsFromArray: @[_pwd,_pwd2,cell1,_pwd3,pwd4,pwd5]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    [self.Jh_formModelArr addObject:section0];
    
    self.Jh_submitStr = @"修 改";
    self.Jh_formSubmitBlock = ^{
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkFormNullDataWithWithDatas:weakSelf.Jh_formModelArr success:^{
            
            [weakSelf SubmitRequest];
            
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
            
        }];
        
        
    };
    
};



#pragma mark - SubmitRequest
-(void)SubmitRequest{
    
    
    if(![_pwd2.Jh_info isEqualToString:_pwd3.Jh_info]){
        NSLog(@"两次输入的密码不一致");
    }else{
        
        
        
    }
    
    
    
}

@end
