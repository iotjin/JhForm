//
//  FormDemo1VC.m
//  JhForm
//
//  Created by Jh on 2019/3/11.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo1VC.h"

@interface FormDemo1VC ()

@end

@implementation FormDemo1VC

-(void)dealloc {
    NSLog(@" FormDemo1VC - dealloc ");
}

-(void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *user= [NSUserDefaults standardUserDefaults];
    self.Jh_themeType = [[user objectForKey:@"kCurrentTheme"] integerValue];
    self.Jh_navRightTitle = @"文字";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    [self initModel];
}

#pragma mark - setNav
-(void)setNav{
    
    self.Jh_navTitle = @"Demo1 - 默认";
    self.Jh_navRightTitle = @"文字"; //也可以设置图片
    JhWeakSelf
    self.JhClickNavRightItemBlock = ^{
        NSLog(@" 点击跳转 ");
        [weakSelf.view hx_showImageHUDText:@"点击文字"];
    };
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //快速创建本文居右的Cell
    JhFormCellModel *cell0 = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");
    cell0.Jh_titleTextColor = [UIColor orangeColor];
    cell0.Jh_leftImgName = @"ic_emotions";
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");
    cell1.Jh_infoTextColor = [UIColor redColor];
    
    //开关
    JhFormCellModel *switchBtn = JhFormCellModel_AddSwitchBtnCell(@"左标题:", YES);
    switchBtn.Jh_switchTintColor = [UIColor orangeColor];
    switchBtn.Jh_leftImgName = @"ic_collections";
    switchBtn.Jh_leftImgWH = 30;
    switchBtn.Jh_leftImgRightMargin = 12;
    switchBtn.Jh_tipInfo = @"这是提示文字";
    switchBtn.Jh_cellTextVerticalCenter = YES;
    //可以不通过block获取开关状态
    __weak typeof(switchBtn) weakSwitchBtn = switchBtn;
    switchBtn.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
        weakSwitchBtn.Jh_switchOnTintColor = JhRandomColor; //切换开关要进行的操作
        [weakSelf.Jh_formTableView reloadData];//刷新
        NSLog(@"switchBtn_on %@", switchBtn_on ? @"YES" : @"NO");
    };
    
    //单选，3个选项，设置图标
    JhFormCellModel *cell2 = JhFormCellModel_AddSelectBtnCell(@"单选3选项", YES, YES);
    cell2.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
    cell2.Jh_selectBtnCell_unSelectIcon=Jh_Icon_CheckBoxNormal;
    cell2.Jh_selectBtnCell_selectIcon=Jh_Icon_CheckBoxSelect;
    
    //添加默认Cell
    JhFormCellModel *cell3 = JhFormCellModel_AddCell(@"用户名:", @"", JhFormCellTypeInput, YES, YES, UIKeyboardTypeDefault);
    
    //录入cell
    JhFormCellModel *name = JhFormCellModel_AddInputCell(@"姓名:", @"", YES, UIKeyboardTypeDefault);
    name.Jh_placeholder = @"请输入姓名(必填)";
    name.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputStates) {
        NSLog(@" 监听输入的文字 %@ ",inputText);
        NSLog(@"是否输入完成%@", inputStates ==2 ? @"YES" : @"NO");
    };
    JhFormCellModel *phone = JhFormCellModel_AddInputCell(@"手机号:", @"", YES, UIKeyboardTypePhonePad);
    phone.Jh_placeholder = @"请输入手机号(必填)";
    phone.Jh_maxInputLength = 11;
    phone.Jh_rightBtnWidth = 70;
    phone.Jh_rightBtnTitle = @"+通讯录";
    phone.Jh_rightBtnTitleColor = [UIColor redColor];
    phone.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击通讯录"];
    };
    
    //密码录入cell
    JhFormCellModel *pwd = JhFormCellModel_AddPwdInputCell(@"密码:", nil, YES);
    pwd.Jh_rightBtnWidth = 40;
    pwd.Jh_rightBtnImgName = @"ic_close";
    pwd.Jh_rightBtnSelectImgName = @"ic_open";
    
    //选择Cell
    NSArray *tempArr = @[@"男",@"女"];
    JhFormCellModel *selectCell = JhFormCellModel_AddSelectCell(@"性别:", @"", YES);
    selectCell.Jh_placeholder = @"请选择性别";
    __weak typeof(selectCell) weakSelectCell = selectCell;
    selectCell.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
        [HXPhotoBottomSelectView showSelectViewWithTitles:tempArr selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
            weakSelectCell.Jh_info = tempArr[index];
            [weakSelf.Jh_formTableView reloadData];
        } cancelClick:^{
        }];
    };
    
    //TextView录入cell
    JhFormCellModel *textViewInput = JhFormCellModel_AddTextViewInputCell(@"备注:",  @"这是默认的备注", YES);
    textViewInput.Jh_placeholder = @"请输入备注(最多50字)";
    textViewInput.Jh_maxInputLength = 500;
    
    JhFormCellModel *picture = JhFormCellModel_AddImageCell(@"选择图片:", YES);
//    picture.Jh_tipInfo =@"这是一条默认颜色的提示信息(不设置不显示)";
//    picture.Jh_leftImgName = @"ic_album";
//    picture.Jh_leftImgRightMargin = 5;
    
    JhFormCellModel *video = JhFormCellModel_AddImageCell(@"选择视频:", NO);
    video.Jh_maxImageCount = 2;
    video.Jh_tipInfo =@"这是一条可设置颜色的提示信息";
    video.Jh_tipInfoColor = [UIColor redColor];
    video.Jh_selectImageType = JhSelectImageTypeVideo;
    video.Jh_videoMinimumDuration = 1;
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,switchBtn,cell2,cell3,name,phone,pwd,selectCell,textViewInput,picture,video]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        
        NSLog(@" cell0.Jh_info - %@", cell0.Jh_info);
        NSLog(@" cell1.Jh_info - %@", cell1.Jh_info);
        NSLog(@" cell2 选中按钮 - %@", cell2.Jh_selectBtnCell_selectIndexArr);
        NSLog(@" 开关的状态 - %@", switchBtn.Jh_switchBtn_on ? @"YES" : @"NO");
        NSLog(@" cell3.Jh_info - %@", cell3.Jh_info);
        NSLog(@" name.Jh_info - %@", name.Jh_info);
        NSLog(@" phone.Jh_info - %@", phone.Jh_info);
        NSLog(@" pwd.Jh_info - %@", pwd.Jh_info);
        NSLog(@" textViewInput.Jh_info - %@", textViewInput.Jh_info);
        
        NSLog(@" 选择图片 - picture : %@ ",picture.Jh_selectImageArr);
        NSLog(@" 选择图片 - video : %@ ",video.Jh_selectVideoArr);
        
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
