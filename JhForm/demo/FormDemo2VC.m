//
//  FormDemo2VC.m
//  JhForm
//
//  Created by Jh on 2019/3/12.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo2VC.h"

@interface FormDemo2VC ()

@end

@implementation FormDemo2VC

-(void)dealloc{
    NSLog(@" FormDemo2VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo2 - 左侧标题为空";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"", @"", YES, 0);
    cell0.Jh_placeholder =@"InputCell默认(限制50字符)";
    cell0.Jh_maxInputLength=50;
    cell0.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"", @"", YES, UIKeyboardTypeNumberPad);
    cell1.Jh_placeholder =@"InputCell右侧设置自定义view";
    cell1.Jh_maxInputLength = 6;
    cell1.Jh_rightViewWidth = 120; //右侧自定义view 可添加倒计时按钮
    cell1.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"", @"", NO, 0);
    cell2.Jh_placeholder =@"InputCell可换行(限制500字符)";
    cell2.Jh_maxInputLength = 500;
    cell2.Jh_rightViewWidth = 80; //右侧自定义view 可添加倒计时按钮
    cell2.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =JhRandomColor;
    };
    
    //添加默认Cell
    JhFormCellModel *cell3 = JhFormCellModel_AddCell(@"", @"", JhFormCellTypeInput, YES, YES, UIKeyboardTypeDefault);
    cell3.Jh_placeholder = @"请输入用户名";
    
    //录入cell
    JhFormCellModel *name = JhFormCellModel_AddInputCell(@"", @"", YES, UIKeyboardTypeDefault);
    name.Jh_placeholder = @"请输入姓名(必填)";
    name.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputStates) {
        NSLog(@" 监听输入的文字 %@ ",inputText);
        NSLog(@"是否输入完成%@", inputStates ==2 ? @"YES" : @"NO");
    };
    JhFormCellModel *phone = JhFormCellModel_AddInputCell(@"", @"", YES, UIKeyboardTypePhonePad);
    phone.Jh_placeholder = @"请输入手机号(最长11位,必填)";
    phone.Jh_maxInputLength = 11;
    phone.Jh_rightBtnWidth = 70;
    phone.Jh_rightBtnTitle = @"+通讯录";
    phone.Jh_rightBtnTitleColor = [UIColor redColor];
    phone.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击通讯录"];
    };
    
    //密码录入cell
    JhFormCellModel *pwd = JhFormCellModel_AddPwdInputCell(@"", nil, YES);
    pwd.Jh_rightBtnWidth = 40;
    pwd.Jh_rightBtnImgName = @"ic_close";
    pwd.Jh_rightBtnSelectImgName = @"ic_open";
    pwd.Jh_placeholder = @"请输入密码";
    
    //选择Cell
    NSArray *tempArr = @[@"男",@"女"];
    JhFormCellModel *selectCell = JhFormCellModel_AddSelectCell(@"", @"", YES);
    selectCell.Jh_placeholder = @"请选择性别";
    __weak typeof(selectCell) weakSelectCell = selectCell;
    selectCell.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
        [HXPhotoBottomSelectView showSelectViewWithTitles:tempArr selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
            weakSelectCell.Jh_info = tempArr[index];
            [weakSelf.Jh_formTableView reloadData];
        } cancelClick:^{
        }];
    };
    
    JhFormCellModel *cell_tip = JhFormCellModel_AddInputCell(@"", @"下面这个是CustumRightCell", NO, 0);
    cell_tip.Jh_editable = NO;
    
    JhFormCellModel *cell5 = JhFormCellModel_AddCustumRightCell(@"");
    cell5.Jh_required =YES;
    cell5.Jh_rightViewBlock = ^(UIView *rightView) {
        rightView.backgroundColor =JhRandomColor;
    };
    
    //TextView录入cell
    JhFormCellModel *textViewInput = JhFormCellModel_AddTextViewInputCell(@"",  @"这是默认的备注", YES);
    textViewInput.Jh_placeholder = @"请输入备注(最多50字)";
    textViewInput.Jh_maxInputLength = 500;
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,name,phone,pwd,selectCell,cell_tip,cell5,textViewInput]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkEmptyWithFormData:weakSelf.Jh_formModelArr success:^{
            [weakSelf SubmitRequest];
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
            //使用自己熟悉的弹框组件
            [weakSelf.view hx_showImageHUDText:error];
        }];
    };
    
    //只是隐藏小红星，还是必填
    self.Jh_navRightTitle = @"隐藏红星";
    self.JhClickNavRightItemBlock = ^{
        if ([weakSelf.Jh_navRightTitle isEqualToString:@"隐藏红星"]) {
            weakSelf.Jh_leftTitleHiddenRedStar =YES;
            weakSelf.Jh_navRightTitle = @"显示红星";
        } else {
            weakSelf.Jh_leftTitleHiddenRedStar =NO;
            weakSelf.Jh_navRightTitle = @"隐藏红星";
        }
        [weakSelf.Jh_formTableView reloadData];
    };
    
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
}

@end
