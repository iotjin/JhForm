//
//  FormDemo1VC.m
//  JhReader
//
//  Created by Jh on 2019/3/11.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo1VC.h"

@interface FormDemo1VC ()

@end

@implementation FormDemo1VC


-(void)dealloc{
    NSLog(@" FormDemo1VC - dealloc ");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"表单Demo1 - 默认";
    
    [self initModel];
    
}


#pragma mark - initModel
-(void)initModel{
    
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //居右
    JhFormCellModel *cell0 = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");
    
    
    JhFormCellModel *cell2 = JhFormCellModel_AddSwitchBtnCell(@"左标题:", YES);
    cell2.Jh_switchTintColor = [UIColor orangeColor];
    
    //可以不通过block获取开关状态
    __weak typeof(cell2) weakCell2 = cell2;
    cell2.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
        NSLog(@"switchBtn_on %@", switchBtn_on ? @"YES" : @"NO");
//        weakCell2.Jh_switchOnTintColor = JhRandomColor;
        [weakSelf.Jh_formTableView reloadData];
    };
    
    //默认文本居左
    JhFormCellModel *cell3 = JhFormCellModel_Add(@"姓名:", @"", JhFormCellTypeInput, YES, YES, UIKeyboardTypeDefault);
    cell3.Jh_placeholder = @"请输入姓名(必选)";
    
    
    JhFormCellModel *cell4 = JhFormCellModel_Add(@"手机号:", @"XXX(可编辑)", JhFormCellTypeInput, YES, YES, UIKeyboardTypePhonePad);
    cell4.Jh_placeholder = @"请输入手机号(最长11位,必选)";
    cell4.Jh_maxInputLength = 11;
    
    
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"性别:", @"文本居左(可选择)", YES);
    cell5.Jh_placeholder = @"请选择性别";
    
    __weak typeof(cell5) weakCell5 = cell5;
    cell5.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        
        //1.使用自己熟悉的选择弹框 ,选择完成对 Jh_info 赋值 (需要对应ID的话对Jh_info_idStr 赋值 )
        //2. 刷新 [weakSelf.Jh_formTableView reloadData];
        
        
    };
    
    JhFormCellModel *cell6 = JhFormCellModel_Add(@"备注:", @"默认备注", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    cell6.Jh_placeholder = @"请输入备注(最多50字)";
    cell6.Jh_showLength = YES;//默认不显示
    cell6.Jh_maxInputLength = 50;
    
    JhFormCellModel *cell7 = JhFormCellModel_AddImageCell(@"选择图片:", NO);
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self.Jh_formModelArr addObject:section0];
    
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        
        NSLog(@" cell0.Jh_info - %@", cell0.Jh_info);
        NSLog(@" cell1.Jh_info - %@", cell1.Jh_info);
        NSLog(@" cell2.开关的状态 - %@", cell2.Jh_switchBtn_on ? @"YES" : @"NO");
        NSLog(@" cell3.Jh_info - %@", cell3.Jh_info);
        NSLog(@" cell4.Jh_info - %@", cell4.Jh_info);
        NSLog(@" cell5.Jh_info - %@", cell5.Jh_info);
        NSLog(@" cell6.Jh_info - %@", cell6.Jh_info);
        NSLog(@" 选择图片类 - Jh_selectImageArr: %@ ",cell6.Jh_selectImageArr);
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkFormNullDataWithWithDatas:weakSelf.Jh_formModelArr success:^{
            
            [weakSelf SubmitRequest];
            
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
//            [JhProgressHUD showText:error];
        }];
        
    };
    
    
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
    
    
}



@end
