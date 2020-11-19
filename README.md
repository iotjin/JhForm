# JhForm

JhForm - 自定义表单工具类，可以更加简单，快捷的创建表单。

<img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_01_1.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_01.gif" width="208" height="404">
<img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_02.gif" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_03_1.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_03.gif" width="208" height="404">
<img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_04.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png" width="208" height="404">
<img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.gif" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_07.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_01_dark.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_08.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_09.png" width="208" height="404"><img src="https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_10.png" width="208" height="404">


## 支持的Cell

* 表单标题居中Cell
* 表单完全自定义Cell
* 表单底部自定义Cell
* 表单右侧自定义Cell
* 表单输入Cell
* 表单输入密码Cell
* 表单选择按钮Cell
* 表单选择Cell
* 表单图片选择Cell
* 表单Switch按钮Cell
* 表单TextView输入Cell


## 实现的一些效果

* 文字排版：左标题右详情，或者上标题下详情
* 标题：支持隐藏、换行，垂直居中或居上展示，标题单位设置（默认小红星）和宽度、字体、颜色设置，标题左侧可加图片
* 详情文字：支持单行与多行录入文字，实时录入监听，键盘切换，录入长度/总长度展示，详情居左居右，箭头显示隐藏，添加右侧自定义view等
* 按钮选择样式：支持单选和多选，按钮宽度自适应，设置默认选中按钮，按钮颜色设置，切换按钮图标等
* 图片选择样式：支持相机和图库选择。支持本地图片与网络图片，本地视频和网络视频，可设置默认选择图片、视频，最大选择数，底部提示文字
* 自定义样式：支持右侧自定义、底部自定义、完全自定义
* 支持提交按钮和导航条相关配置
* 支持暗黑模式，设置自动切换或light
* Cell高度设置
* 设置样式


注：<br>

 JhFormCellModel 针对单个页面某些属性动态配置<br>
 JhFormTableViewVC.h 针对整个页面进行表单提交按钮、导航条配置<br>
 JhFormConst 针对项目范围内进行属性配置<br>


## 更新说明


* 2020.11.13 - 添加视频选择效果，支持本地和网络视频选择与展示 <br>
* 2020.11.09 - 添加设置样式 <br>
* 2020.10.30 - 新增JhFormSelectBtnCell <br>
* 2020.10.23 - HXPhotoPicker更新至v3.1.2版本(iPhone12适配)，增加提交按钮相关属性<br>
* 2020.10.15 - 添加版本号v1.0.0，HXPhotoPicker更新至v3.1.1版本,处理iOS14图片异常<br>
* 2020.09.30 - 添加cell文字居中效果 <br>
* 2020.08.05 - JhFormSelectImageCell优化 <br>
* 2020.07.24 - JhFormSelectImageCell高度自适应，无加号按钮 优化 <br>
* 2020.04.28 - HXPhotoPicker更新至v2.4.2版本，JhFormSelectImageCell高度自适应 <br>
* 2020.01.14 - 优化图片动态更新 <br>
* 2019.10.16 - 适配iOS13暗黑模式(默认跟随系统自动切换,可控制某个页面一直处于light模式) <br>
* 2019.09.30 - 添加设置标题颜色属性,添加设置cell不可编辑的属性,添加一些备用字段,修改cell重用的逻辑<br>
* 2019.09.12 - 修复存在多个相同类型iuputCell右侧自定义view复用的问题<br>
* 2019.09.11 - 文本输入和密码输入样式增加右侧自定义View,新增只显示右侧输入框样式(设置Jh_title为空即可),标题增加换行展示,选择图片cell增加底部提示文本(不设置默认不显示),优化红星展示方式 <br>
* 2019.07.26 - 新增完全自定义样式cell (JhFormCustumALLViewCell) ,添加cell背景色设置属性 "Jh_cellBgColor"<br>
* 2019.06.21 - 新增密码输入样式cell (JhFormPwdCell) <br>
* 2019.06.18 - 修复switchBtn开关失效的问题 <br>
* 2019.04.22 - 添加统一设置标题宽度的属性 "Jh_leftTitleWidth" <br>
* 2019.04.18 - 添加单个设置标题宽度的属性 "Jh_titleWidth" <br>
* 2019.04.02 - 添加选择最大图片数量属性 <br>
* 2019.03.27 - CustumRightCell样式添加显示箭头的属性 <br>
* 2019.03.22 - 新增设置导航条右侧文字和图片的方法,添加快捷添加输入样式cell的方法,监听输入文字和输入完成状态的Block <br>


## Examples

**特别提醒：很多地方用到了 Block 块，请认真检查是否用的是弱引用，以免造成内存泄露！**



* 样式1 - 输入样式
```objc
// 默认文本居左可编辑
JhFormCellModel *cell4 = JhFormCellModel_AddInputCell(@"手机号:", @"XXX(可编辑)", YES, UIKeyboardTypePhonePad);
cell4.Jh_placeholder = @"请输入手机号(最长11位,必选)";
cell4.Jh_maxInputLength = 11;
cell4.JhInputBlock = ^(NSString *text, BOOL isInputCompletion) {
    NSLog(@" 监听输入的文字 %@ ",text);
    BOOL boolValue = isInputCompletion;
    NSLog(@"是否输入完成%@", boolValue ? @"YES" : @"NO");
};
```

* 样式2 - 选择样式
```objc
JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"性别:", @"文本居左(可选择)", YES);
cell5.Jh_placeholder = @"请选择性别";

__weak typeof(self) weakSelf = self;
cell5.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
    //1.使用自己熟悉的选择弹框 ,选择完成后将值赋到 Jh_info 属性 (需要对应 ID 则对 Jh_info_idStr 赋值 )
    //2. 刷新 [weakSelf.Jh_formTableView reloadData];
};
```
* 样式3 - textView
```objc
JhFormCellModel *cell6 = JhFormCellModel_Add(@"备注:", @"默认备注", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
cell6.Jh_placeholder = @"请输入备注(最多50字)";
cell6.Jh_showLength = YES; // 字数统计，默认不显示
cell6.Jh_maxInputLength = 50;
```

* 样式4 - 默认选择图片样式
```objc
JhFormCellModel *cell7 = JhFormCellModel_AddImageCell(@"选择图片:", NO);

JhFormCellModel *urlPicture = JhFormCellModel_AddImageCell(@"加载网络图片:", NO);
//    urlPicture.Jh_noShowAddImgBtn=YES;
//    urlPicture.Jh_hideDeleteButton = YES;

urlPicture.Jh_imageArr =@[@"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png",
                          @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png",
                          @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png"];
```

* 样式5 - switch 样式
```objc
/// 添加一个左标题，右侧为 Switch 开关的 cell
JhFormCellModel *cell2 = JhFormCellModel_AddSwitchBtnCell(@"左标题:", YES);
cell2.Jh_switchTintColor = [UIColor orangeColor];

// 可以不通过 block 获取开关状态
__weak typeof(self) weakSelf = self;
cell2.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
    NSLog(@"Switch Button State: %@", switchBtn_on ? @"YES" : @"NO");
    [weakSelf.Jh_formTableView reloadData];
};
```

* 样式6 - 文本居右
```objc
// 添加一个左标题，右文字(居右)、不可编辑的 cell
JhFormCellModel *cell0 = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");
```
* 样式7 - 文本居右带箭头
```objc
/// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");
```

* 样式8 - 右侧自定义View
```objc
// 右侧自定义View
UIView *rightView = [[UIView alloc]init];
rightView.backgroundColor = JhRandomColor;

JhFormCellModel *cell0 = JhFormCellModel_AddCustumRightCell(@"右侧自定义:");
cell0.Jh_defaultHeight = 60;
cell0.Jh_custumRightViewBlock = ^(UIView *RightView) {
    [RightView  addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
};
```
* 样式9 - 底部自定义View
```objc
// 底部自定义View
UIView *bottomView = [[UIView alloc]init];
bottomView.backgroundColor = JhRandomColor;

JhFormCellModel *cell1 = JhFormCellModel_AddCustumBottomCell(@"底部自定义:");
cell1.Jh_defaultHeight = 200;
cell1.Jh_custumBottomViewBlock = ^(UIView *BottomView) {
    [BottomView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
};
```

   


* 样式10 - 文本居中
```objc
//文本居中
JhFormCellModel *Section1_cell1 = JhFormCellModel_AddCenterTextCell(@"退出登录");

//设置头部
JhBaseHeaderView *headerV = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 44)];
headerV.backgroundColor = BaseBgWhiteColor;
headerV.Jh_leftTitle = @"第一组头部";
section0.Jh_headerView = headerV;
section0.Jh_headerHeight= headerV.bounds.size.height;
```

* 样式11 - 密码输入样式
```objc
JhFormCellModel *pwd = JhFormCellModel_AddPwdInputCell(@"旧密码:", @"", YES);
pwd.Jh_placeholder = @"请输入旧密码";
pwd.Jh_maxInputLength = 25;
pwd.Jh_InfoTextAlignment =  JhFormCellInfoTextAlignmentRight; //默认居左
pwd.Jh_keyboardType = UIKeyboardTypeNumberPad;
pwd.JhInputBlock = ^(NSString * _Nonnull text, BOOL isInputCompletion) {
    NSLog(@"当前的输入状态: %@", isInputCompletion ? @"YES" : @"NO");
    NSLog(@"文字: %@", text);
};
```

* 样式12 - 完全自定义样式
```objc
JhFormCellModel *cell_allcustum = JhFormCellModel_AddCustumALLViewCell(80);
cell_allcustum.Jh_cellBgColor = JhRandomColor; //完全自定义样式的cell 只有高度和背景颜色可以设置
cell_allcustum.Jh_custumALLViewBlock = ^(UIView * _Nonnull AllView) {
    AllView.backgroundColor =[UIColor yellowColor];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor =JhRandomColor;
    label.text =@"这是一个可以完全自定义的cell";
    label.frame=CGRectMake(0, 30, Kwidth-30, 20);
    [AllView addSubview:label];
};
```

* 13 - 标题换行展示
```objc
NSString *title= @"统一社会\n 信用代码";
JhFormCellModel *cell6 = JhFormCellModel_AddInputCell(title, @"", YES, 0);
cell6.Jh_placeholder = @"请输入18位统一社会信用代码";
cell6.Jh_titleMultiLineShow =YES; //标题换行展示
cell6.Jh_maxInputLength = 18;
```

* 14 - 单选、多选按钮
```objc
//单选一个选项，必填，默认样式
JhFormCellModel *cell0 = JhFormCellModel_AddSelectBtnCell(@"单选1选项", YES, YES);
cell0.Jh_selectBtnCell_btnTitleArr = @[@"选项一"];

//单选，2个选项
JhFormCellModel *cell1 = JhFormCellModel_AddSelectBtnCell(@"单选2选项", YES, YES);
cell1.Jh_selectBtnCell_btnTitleArr = @[@"男",@"女"];
cell1.Jh_selectBtnCell_btnHorizontalMargin = 40;

//单选，3个选项，设置图标
JhFormCellModel *cell2 = JhFormCellModel_AddSelectBtnCell(@"单选3选项", YES, YES);
cell2.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
cell2.Jh_selectBtnCell_unSelectIcon=kIcon_CheckBoxNormal;
cell2.Jh_selectBtnCell_selectIcon=kIcon_CheckBoxSelect;

//单选，多个选项，设置一些间距
JhFormCellModel *cell3 = JhFormCellModel_AddSelectBtnCell(@"单选多选项", YES, YES);
cell3.Jh_selectBtnCell_btnHorizontalMargin =60;
cell3.Jh_selectBtnCell_btnVerticalMargin =30;
cell3.Jh_cellTextVerticalCenter =YES;
cell3.Jh_selectBtnCell_btnTitleArr = @[@"春",@"夏",@"秋",@"冬"];
cell3.Jh_selectBtnCell_selectTitleArr = @[@"秋"];
cell3.Jh_selectBtnCell_isUseBlackSelectIcon = YES;

//单选，不可编辑，设置一个选项一行
JhFormCellModel *cell4 = JhFormCellModel_AddSelectBtnCell(@"不可编辑", NO, NO);
cell4.Jh_selectBtnCell_btnTitleArr = @[@"选项一",@"选项二",@"选项三"];
cell4.Jh_Cell_NoEdit = YES;
cell4.Jh_selectBtnCell_selectTitleArr = @[@"选项二"];
cell4.Jh_selectBtnCell_isSingleLineDisplay = YES;
cell4.Jh_cellTextVerticalCenter =YES;

//单选，设置上标题下选项，一个选项一行
JhFormCellModel *cell5 = JhFormCellModel_AddSelectBtnCell(@"单选，一选项一行：", YES, YES);
cell5.Jh_selectBtnCell_btnIconSpace = 40;
cell5.Jh_selectBtnCell_btnTitleArr = @[@"2020年1月-3月",@"2020年4月-6月",@"2020年7月-9月"];
cell5.Jh_selectBtnCell_isSingleLineDisplay = YES;
cell5.Jh_selectBtnCell_isTopTitleBottomOption = YES;

//多选，2个选项
JhFormCellModel *cell6 = JhFormCellModel_AddSelectBtnCell(@"多选2选项", YES, YES);
cell6.Jh_selectBtnCell_isMultiSelect=YES;
cell6.Jh_selectBtnCell_btnTitleArr = @[@"选项一",@"选项二"];
//多选，3个选项
JhFormCellModel *cell7 = JhFormCellModel_AddSelectBtnCell(@"多选3选项", YES, YES);
cell7.Jh_selectBtnCell_isMultiSelect=YES;
cell7.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
cell7.Jh_selectBtnCell_selectTitleArr = @[@"晚上"];

//多选，多个选项，设置图标颜色
JhFormCellModel *cell8 = JhFormCellModel_AddSelectBtnCell(@"多选多选项", YES, YES);
cell8.Jh_selectBtnCell_isMultiSelect=YES;
cell8.Jh_selectBtnCell_btnTitleArr = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",];
cell8.Jh_selectBtnCell_btnUnSelectIconColor = [UIColor blueColor];
cell8.Jh_selectBtnCell_btnSelectIconColor = [UIColor redColor];
cell8.Jh_selectBtnCell_selectTitleArr = @[@"星期二",@"星期三",@"星期四"];


JhFormCellModel *cell9 = JhFormCellModel_AddSelectBtnCell(@"其它", YES, YES);
NSArray *arr = @[@"希望是本无所谓有",@"无所谓无的",@"这正如地上的路",@"其实地上本没有路",@"走的人多了",@"也便成了路",@"抱歉！",@"我是周树人，我为自己代言"];
cell9.Jh_selectBtnCell_btnTitleArr = arr;
cell9.Jh_selectBtnCell_isMultiSelect =YES;
cell9.Jh_selectBtnCell_hiddenLeftIcon =YES;
cell9.Jh_selectBtnCell_btnBgColor = [UIColor orangeColor];
cell9.Jh_selectBtnCell_btnSelectBgColor = [UIColor redColor];
cell9.Jh_selectBtnCell_btnTitleColor = [UIColor whiteColor];
cell9.Jh_selectBtnCell_btnTitleSelectColor = [UIColor yellowColor];
cell9.Jh_selectBtnCell_btnCornerRadius = 10;
cell9.Jh_selectBtnCell_btnBorderWidth = 1;
cell9.Jh_selectBtnCell_btnBorderColor = [UIColor purpleColor];
```
*  15 - 设置样式
```objc
JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"支付", @"");
cell0.Jh_leftImgName = @"ic_wallet";
cell0.Jh_leftImgWH = 30;
cell0.Jh_hiddenLine = YES;
cell0.Jh_leftImgRightMargin = 12;

JhFormCellModel *cell7 = JhFormCellModel_AddRightArrowCell(@"自定义2", @"");
cell7.Jh_leftImgName = @"ic_settings";
cell7.Jh_rightViewWidth = kWidth - cell7.Jh_titleWidth;
cell7.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = JhRandomColor;
    [RightView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
};
```

*  16 - 视频选择与展示
```objc
JhFormCellModel *video = JhFormCellModel_AddImageCell(@"选择视频:", NO);
video.Jh_maxImageCount = 2;
video.Jh_tipsInfo =@"这是一条可设置颜色的提示信息";
video.Jh_tipsInfoColor = [UIColor redColor];
video.Jh_selectImageType = JhSelectImageTypeVideo;
video.Jh_videoMinimumDuration = 1;

JhFormCellModel *urlVideo = JhFormCellModel_AddImageCell(@"加载网络视频:", NO);
//    urlVideo.Jh_noShowAddImgBtn=YES;
//    urlVideo.Jh_hideDeleteButton = YES;

HXCustomAssetModel *assetModel1 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539156872167&di=93cd047350dfc7a60fa9e89e30079b25&imgtype=0&src=http%3A%2F%2Fpic.9ht.com%2Fup%2F2018-5%2F15252310743961744.gif"] networkThumbURL:[NSURL URLWithString:@"https://goss.veer.com/creative/vcg/veer/1600water/veer-129342703.jpg"] selected:YES];

HXCustomAssetModel *assetModel2 = [HXCustomAssetModel livePhotoAssetWithNetworkImageURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/5ed15ef7-3411-4f5e-839b-10664d796919.jpg"] networkVideoURL:[NSURL URLWithString:@"http://tsnrhapp.oss-cn-hangzhou.aliyuncs.com/chartle/fufeiduanpian.mp4"] selected:YES];

HXCustomAssetModel *assetModel3 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3935625616,3616422245&fm=27&gp=0.jpg"] selected:YES];

HXCustomAssetModel *assetModel4 = [HXCustomAssetModel assetWithNetworkVideoURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/fff42798-8025-4170-a36d-3257be267f29.mp4"] videoCoverURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/d3c3bbe6-02ce-4f17-a75b-3387d52b0a4a.jpg"] videoDuration:13 selected:YES];

urlVideo.Jh_initImageArr =@[assetModel1,assetModel2,assetModel3,assetModel4];
urlVideo.Jh_selectImageType = JhSelectImageTypeAll;
```


*  一些其他的设置
```objc
//隐藏默认的footerView
self.Jh_defaultFooterViewHidden = YES;

//可隐藏整个页面的红星按只有标题显示
self.Jh_leftTitleHiddenRedStar =YES;

// 暗黑模式切换: JhFormConst 中 Jh_ThemeType类型控制

#pragma mark - 设置导航条title和右侧文字
-(void)setNav{
    self.Jh_navTitle = @"表单Demo1 - 默认";
    self.Jh_navRightTitle =@"文字";
    self.JhClickNavRightItemBlock = ^{
        NSLog(@" 点击跳转 ");
    };
}

//提交按钮相关设置（当个页面），全局配置在JhFormConst文件中修改
self.Jh_submitBtnBgColor = [UIColor redColor]; //全局配置背景色要去修改BaseThemeColor
self.Jh_submitBtnTBSpace = 30;
self.Jh_submitBtnLRSpace = 100;
self.Jh_submitBtnHeight = 50;
self.Jh_submitBtnTextColor = [UIColor yellowColor];
self.Jh_submitBtnCornerRadius = 25.0;
self.Jh_submitBtnTextFontSize = 22;
//粗体
self.Jh_submitBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold"size:30];
//边框
self.Jh_submitBtn.layer.borderWidth = 2;
self.Jh_submitBtn.layer.borderColor = [[UIColor grayColor] CGColor];
self.Jh_submitStr = @"提 交";
```


* 添加和提交的处理
```objc
NSMutableArray *cellArr0 = [NSMutableArray array];

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
```



### 特别感谢：RockChanel

[SWForm 源码](https://github.com/RockChanel/SWForm)


