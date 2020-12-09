//
//  FormDemo3VC.m
//  JhForm
//
//  Created by Jh on 2019/6/21.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo3VC.h"

@interface FormDemo3VC ()

@end

@implementation FormDemo3VC


-(void)dealloc{
    NSLog(@" FormDemo3VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo3 - 录入样式";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //快速创建本文居右的Cell
    JhFormCellModel *infoCell = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");
    infoCell.Jh_titleTextColor = [UIColor orangeColor];
    infoCell.Jh_leftImgName = @"ic_emotions";
    
    //录入cell
    JhFormCellModel *inputCell = JhFormCellModel_AddInputCell(@"inputCell:", @"", YES, UIKeyboardTypeDefault);
    inputCell.Jh_placeholder = @"录入时自动换行(最多50字符)";
    inputCell.Jh_placeholderColor = [UIColor redColor];
    
    JhFormCellModel *inputCell2 = JhFormCellModel_AddInputCell(@"inputCell:", @"", YES, UIKeyboardTypeDefault);
    
    JhFormCellModel *name = JhFormCellModel_AddInputCell(@"姓名:", @"", YES, UIKeyboardTypeDefault);
    name.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    name.Jh_placeholder = @"请输入姓名(必选)";
    name.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputStates) {
        NSLog(@" 监听输入的文字 %@ ",inputText);
        NSLog(@"是否输入完成%@", inputStates ==2 ? @"YES" : @"NO");
    };
    //设置右侧文字
    JhFormCellModel *phone = JhFormCellModel_AddInputCell(@"手机号:", @"", YES, UIKeyboardTypePhonePad);
    phone.Jh_placeholder = @"请输入手机号";
    phone.Jh_maxInputLength = 11;
    phone.Jh_rightBtnWidth = 70;
    phone.Jh_rightBtnTitle = @"+通讯录";
    phone.Jh_rightBtnTitleColor = [UIColor redColor];
    phone.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击通讯录"];
    };
    //设置右侧图文
    JhFormCellModel *cell6 = JhFormCellModel_AddInputCell(@"手机号2:", @"", YES, UIKeyboardTypePhonePad);
    cell6.Jh_placeholder =@"设置右侧图文";
    cell6.Jh_rightBtnWidth = 70;
    cell6.Jh_rightBtnTitle = @"文字";
    cell6.Jh_rightBtnImgName = @"ic_emotions";
    cell6.Jh_rightBtnImgWH = 25;
    cell6.Jh_rightBtnImgTextMargin = 5;
    cell6.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击右侧图文"];
    };
    
    //右侧自定义view的优先级高于右侧按钮的图文
    JhFormCellModel *code = JhFormCellModel_AddInputCell(@"验证码:", @"", YES, UIKeyboardTypeNumberPad);
    code.Jh_placeholder = @"请输入验证码";
    code.Jh_maxInputLength = 6;
    code.Jh_isShowArrow = YES;
    // ---- 设置rightViewWidth 这些就没有用了
    //    cell6.Jh_rightBtnWidth = 70;
    //    cell6.Jh_rightBtnTitle = @"换行";
    //    cell6.Jh_rightBtnImgName = @"ic_wallet";
    //    cell6.Jh_rightBtnImgWH = 30;
    //    cell6.Jh_rightBtnImgTextMargin = 0.1;
    // ---- 设置rightViewWidth 这些就没有用了
    code.Jh_rightViewWidth = 100;
    //右侧自定义view 可添加倒计时按钮
    code.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =[UIColor orangeColor];
    };
    
    JhFormCellModel *number = JhFormCellModel_AddInputCell(@"统一社会信用代码:",nil, YES, UIKeyboardTypeDecimalPad);
    number.Jh_placeholder = @"请输入18位统一社会信用代码";
    number.Jh_maxInputLength = 18;
    number.Jh_titleWidth = 120; //单个设置左侧title的宽度
    
    JhFormCellModel *number2 = JhFormCellModel_AddInputCell(@"统一社会信用代码统一社会信用代码:",nil, YES, UIKeyboardTypeDecimalPad);
    number2.Jh_placeholder = @"请输入18位统一社会信用代码";
    number2.Jh_maxInputLength = 18;
    number2.Jh_cellTextVerticalCenter = YES;//默认标题和右侧文字都是垂直居上，居中是设置标题和文字都垂直居中
    //    number2.Jh_titleMultiLineShow = YES;//换行只把标题换行，右侧还是居上展示
    
    //密码录入cell
    JhFormCellModel *pwd = JhFormCellModel_AddPwdInputCell(@"密码:", nil, YES);
    pwd.Jh_rightBtnWidth = 40;
    pwd.Jh_rightBtnImgName = @"ic_close";
    pwd.Jh_rightBtnSelectImgName = @"ic_open";
    
    //TextView录入cell
    JhFormCellModel *textViewInput = JhFormCellModel_AddTextViewInputCell(@"备注:",  @"", NO);
    textViewInput.Jh_placeholder = @"选填，请输入备注(最多500字)";
    textViewInput.Jh_maxInputLength = 500;
    
    [cellArr0 addObjectsFromArray: @[infoCell,inputCell,inputCell2,name,phone,cell6,code,number,number2,pwd,textViewInput]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    
    //如需要单页面统一配置，放在添加数据源后面
    self.Jh_leftTitleWidth = 120;   //统一设置左侧title的宽度
    
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
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
    
}

@end
