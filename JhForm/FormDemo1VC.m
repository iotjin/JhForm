//
//  FormDemo1VC.m
//  JhReader
//
//  Created by Jh on 2019/3/11.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo1VC.h"
#import "Masonry.h"

@interface FormDemo1VC ()

@property (strong, nonatomic)  UITextField *passWordTextField;

@end

@implementation FormDemo1VC


-(void)dealloc{
    NSLog(@" FormDemo1VC - dealloc ");
}


-(UITextField *)passWordTextField{
    if (!_passWordTextField) {
        _passWordTextField=[[UITextField alloc]init];
        _passWordTextField.textAlignment = NSTextAlignmentLeft;
        _passWordTextField.placeholder =@"请输入密码";
        _passWordTextField.secureTextEntry=YES;
        _passWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWordTextField.font = [UIFont systemFontOfSize:15];
        if (@available(iOS 13.0, *)) {
            UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
                if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                    return Jh_PlaceholderColor;
                } else {
                    return Jh_PlaceholderColor;
                }
            }];
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSForegroundColorAttributeName] = dyColor;
            NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:self.passWordTextField.placeholder attributes:dict];
            [self.passWordTextField setAttributedPlaceholder:attribute];
        }
    }
    return _passWordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self initModel];
    
    [self setNav];
    
}

#pragma mark - setNav
-(void)setNav{
    
    self.Jh_navTitle = @"表单Demo1 - 默认";
    self.Jh_navRightTitle =@"文字"; //也可以设置图片
    self.JhClickNavRightItemBlock = ^{
        NSLog(@" 点击跳转 ");
    };
    
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
    
    //默认文本居左可编辑
//    JhFormCellModel *cell3 = JhFormCellModel_Add(@"姓名:", @"", JhFormCellTypeInput, YES, YES, UIKeyboardTypeDefault);
    
    //默认文本居左可编辑
    JhFormCellModel *cell3 = JhFormCellModel_AddInputCell(@"姓名:", @"", YES, UIKeyboardTypeDefault);
    cell3.Jh_placeholder = @"请输入姓名(必选)";
    cell3.JhInputBlock = ^(NSString *text, BOOL isInputCompletion) {
        NSLog(@" 监听输入的文字 %@ ",text);
        BOOL boolValue = isInputCompletion;
        NSLog(@"是否输入完成%@", boolValue ? @"YES" : @"NO");
    };
    
    JhFormCellModel *pwd = JhFormCellModel_AddCustumRightCell(@"密码:");
    pwd.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView addSubview:weakSelf.passWordTextField];
        [weakSelf.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(RightView);
            make.right.mas_equalTo(-40);
            make.left.mas_equalTo(0);
        }];
    };
//   NSString *redStr =@"*密码:";
//    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc]initWithString:redStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:Jh_titleColor}];
//    [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
//    pwd.Jh_attributedTitle = attributedTitle;
    
    
    JhFormCellModel *cell4 = JhFormCellModel_AddInputCell(@"手机号:", @"XXX(可编辑)", YES, UIKeyboardTypePhonePad);
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
    cell7.Jh_tipsInfo =@"这是一条默认颜色的提示信息(不设置不显示)";
    
    JhFormCellModel *picture = JhFormCellModel_AddImageCell(@"选择图片2:", NO);
    picture.Jh_maxImageCount = 2;
    picture.Jh_tipsInfo =@"这是一条可设置颜色的提示信息";
    picture.Jh_tipsInfoColor = [UIColor redColor];
    
    JhFormCellModel *urlPicture = JhFormCellModel_AddImageCell(@"加载网络图片:", NO);
//    urlPicture.Jh_noShowAddImgBtn=YES;
//    urlPicture.Jh_hideDeleteButton = YES;
    urlPicture.Jh_imageArr =@[@"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png"];
    
    JhFormCellModel *picture_noTitle = JhFormCellModel_AddImageCell(@"", NO);
    picture_noTitle.Jh_maxImageCount = 2;

    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,pwd,cell4,cell5,cell6,cell7,picture,urlPicture,picture_noTitle]];
    
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
        NSLog(@" 选择图片类 - Jh_selectImageArr: %@ ",cell7.Jh_selectImageArr);
        NSLog(@" 选择图片类 - urlPicture- Jh_selectImageArr: %@ ",urlPicture.Jh_selectImageArr);
        
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
