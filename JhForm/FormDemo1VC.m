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

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigation];
    [self initializeForm];
}

#pragma mark - Custom Accessors

- (UITextField *)passWordTextField {
    if (!_passWordTextField) {
        _passWordTextField = [[UITextField alloc] init];
        _passWordTextField.textAlignment = NSTextAlignmentLeft;
        _passWordTextField.placeholder = @"请输入密码";
        _passWordTextField.secureTextEntry = YES;
        _passWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWordTextField.font = [UIFont systemFontOfSize:15];
        
        if (@available(iOS 13.0, *)) {
            UIColor *dynamicColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
                BOOL isDarkMode = ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight);
                return isDarkMode ? Jh_PlaceholderColor : Jh_PlaceholderColor;
            }];
            NSDictionary *attributes = @{ NSForegroundColorAttributeName: dynamicColor };
            NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:_passWordTextField.placeholder attributes:attributes];
            _passWordTextField.attributedPlaceholder = attributedString;
        }
    }
    return _passWordTextField;
}

#pragma mark - Private

- (void)setupNavigation {
    self.Jh_navTitle = @"表单Demo1 - 默认";
    self.Jh_navRightTitle = @"文字"; // 也可以设置图片
    self.Jh_clickNavRightItemBlock = ^{
        NSLog(@"点击导航栏按钮");
    };
}

- (void)initializeForm {
    
    __weak typeof(self) weakSelf = self;
    
    // 添加一个左标题，右文字(居右)、不可编辑的 cell
    JhFormCellModel *cell0 = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");
    
    /// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");
    
    /// 添加一个左标题，右侧为 Switch 开关的 cell
    JhFormCellModel *cell2 = JhFormCellModel_AddSwitchBtnCell(@"左标题:", YES);
    cell2.Jh_switchTintColor = [UIColor orangeColor];
    
    // 可以不通过 block 获取开关状态
    cell2.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
        NSLog(@"Switch Button State: %@", switchBtn_on ? @"YES" : @"NO");
        [weakSelf.Jh_formTableView reloadData];
    };
    
    // 默认文本居左可编辑
//    JhFormCellModel *cell3 = JhFormCellModel_Add(@"姓名:", @"", JhFormCellTypeInput, YES, YES, UIKeyboardTypeDefault);
    
    // MARK: 姓名输入框
    JhFormCellModel *cell3 = JhFormCellModel_AddInputCell(@"姓名:", @"", YES, UIKeyboardTypeDefault);
    cell3.Jh_placeholder = @"请输入姓名(必选)";
    cell3.JhInputBlock = ^(NSString *text, BOOL isInputCompletion) {
        NSLog(@" 监听输入的文字 %@ ",text);
        BOOL boolValue = isInputCompletion;
        NSLog(@"是否输入完成%@", boolValue ? @"YES" : @"NO");
    };
    
    // MARK: 密码输入框
    // 快捷添加右侧自定义视图 cell
    JhFormCellModel *pwd = JhFormCellModel_AddCustumRightCell(@"密码:");
    // 在右侧自定义视图中添加一个密码输入框
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
    
    // MARK: 输入手机号码
    JhFormCellModel *cell4 = JhFormCellModel_AddInputCell(@"手机号:", @"XXX(可编辑)", YES, UIKeyboardTypePhonePad);
    cell4.Jh_placeholder = @"请输入手机号(最长11位,必选)";
    cell4.Jh_maxInputLength = 11;
    
    // MARK: 选择性别
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"性别:", @"文本居左(可选择)", YES);
    cell5.Jh_placeholder = @"请选择性别";
    
    cell5.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        //1.使用自己熟悉的选择弹框 ,选择完成后将值赋到 Jh_info 属性 (需要对应 ID 则对 Jh_info_idStr 赋值 )
        //2. 刷新 [weakSelf.Jh_formTableView reloadData];
    };
    
    // MARK: 多行输入文本框
    JhFormCellModel *cell6 = JhFormCellModel_Add(@"备注:", @"默认备注", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    cell6.Jh_placeholder = @"请输入备注(最多50字)";
    cell6.Jh_showLength = YES; // 字数统计，默认不显示
    cell6.Jh_maxInputLength = 50;
    
    // MARK: 选择图片
    JhFormCellModel *picture = JhFormCellModel_AddImageCell(@"选择图片:", NO);
    picture.Jh_tipsInfo =@"这是一条默认颜色的提示信息(不设置不显示)";
    
    // MARK: 选择视频
    JhFormCellModel *video = JhFormCellModel_AddImageCell(@"选择视频:", NO);
    video.Jh_maxImageCount = 2;
    video.Jh_tipsInfo =@"这是一条可设置颜色的提示信息";
    video.Jh_tipsInfoColor = [UIColor redColor];
    video.Jh_selectImageType = JhSelectImageTypeVideo;
    video.Jh_videoMinimumDuration = 1;
    
    // MARK: 加载网络图片
    JhFormCellModel *urlPicture = JhFormCellModel_AddImageCell(@"加载网络图片:", NO);
//    urlPicture.Jh_noShowAddImgBtn=YES;
//    urlPicture.Jh_hideDeleteButton = YES;
    
    urlPicture.Jh_imageArr =@[@"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png"];
    
    // MARK: 加载网络视频
    JhFormCellModel *urlVideo = JhFormCellModel_AddImageCell(@"加载网络视频:", NO);
//    urlVideo.Jh_noShowAddImgBtn=YES;
//    urlVideo.Jh_hideDeleteButton = YES;

    HXCustomAssetModel *assetModel1 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539156872167&di=93cd047350dfc7a60fa9e89e30079b25&imgtype=0&src=http%3A%2F%2Fpic.9ht.com%2Fup%2F2018-5%2F15252310743961744.gif"] networkThumbURL:[NSURL URLWithString:@"https://goss.veer.com/creative/vcg/veer/1600water/veer-129342703.jpg"] selected:YES];
    
    HXCustomAssetModel *assetModel2 = [HXCustomAssetModel livePhotoAssetWithNetworkImageURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/5ed15ef7-3411-4f5e-839b-10664d796919.jpg"] networkVideoURL:[NSURL URLWithString:@"http://tsnrhapp.oss-cn-hangzhou.aliyuncs.com/chartle/fufeiduanpian.mp4"] selected:YES];
    
    HXCustomAssetModel *assetModel3 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3935625616,3616422245&fm=27&gp=0.jpg"] selected:YES];
    
    HXCustomAssetModel *assetModel4 = [HXCustomAssetModel assetWithNetworkVideoURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/fff42798-8025-4170-a36d-3257be267f29.mp4"] videoCoverURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/d3c3bbe6-02ce-4f17-a75b-3387d52b0a4a.jpg"] videoDuration:13 selected:YES];
    
    urlVideo.Jh_initImageArr =@[assetModel1,assetModel2,assetModel3,assetModel4];
    urlVideo.Jh_selectImageType = JhSelectImageTypeAll;
    
    // MARK: 添加图片，没有提示标题
    JhFormCellModel *picture_noTitle = JhFormCellModel_AddImageCell(@"", NO);
    picture_noTitle.Jh_maxImageCount = 2;

    NSArray *cells = @[cell0,cell1,cell2,cell3,pwd,cell4,cell5,cell6,picture,video,urlPicture,urlVideo,picture_noTitle];
    JhFormSectionModel *section0 = JhSectionModel_Add(cells);
    [self.Jh_formModelArr addObject:section0];
    
    // MARK: 表单提交按钮
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
        
        NSLog(@" 选择图片类 - picture : %@ ",picture.Jh_selectImageArr);
        NSLog(@" 选择图片类 - video : %@ ",video.Jh_selectVideoArr);
        NSLog(@" 选择图片类 - urlPicture : %@ ",urlPicture.Jh_selectImageArr);
        NSLog(@" 选择图片类 - urlVideo : 视频:\n%@\n 图片:\n%@",urlVideo.Jh_selectVideoArr,urlVideo.Jh_selectImageArr);
        NSLog(@" 选择图片类 - urlVideo - allList  : %@",urlVideo.Jh_imageAllList);
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkFormNullDataWithWithDatas:weakSelf.Jh_formModelArr success:^{
            // 校验成功处理...
            [weakSelf SubmitRequest];
        } failure:^(NSString *error) {
            // 校验失败处理...
            NSLog(@"error====%@",error);
        }];
    };
}

#pragma mark - Actions

// 提交按钮点击事件
-(void)SubmitRequest{
    
}

@end
