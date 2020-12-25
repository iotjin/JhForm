# JhForm
JhForm - 自定义表单工具类，通过动态配置表单model，可以更加简单、快捷的创建表单、设置页面 <br> 
<br> 


| <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo1.gif" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo2.gif" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo5.gif" width="187" height="419"> |
| ------ | ------ | ------ |
| <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo1_dark.jpg" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo3.jpg" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo4.jpg" width="187" height="419"> |
| <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo6.jpg" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo7.jpg" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo8.jpg" width="187" height="419"> |
| <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo9.jpg" width="187" height="419"> | <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/demo10.jpg" width="187" height="419"> |  |


## 目录
* [特性](#特性)
* [简介](#简介)
* [安装](#安装)
* [使用](#使用)
* [要求](#要求)
* [默认支持的Cell](#默认支持的Cell)
* [配置项说明](#配置项说明)
* [示例](#例子)
* [更新记录](#更新记录)


## <a id="特性"></a> 特性 - Features

- [x] 动态配置表单model
- [x] 必填选填、录入校验
- [x] 配置标题、前缀图标，后缀文字、图标
- [x] 单行、多行录入、密码录入，最大录入限制，实时录入监听与键盘切换
- [x] 支持添加自定义文本、时间、地区选择器
- [x] 支持相机拍照与图库选择，支持本地与网络图片、视频
- [x] 单选、多选按钮
- [x] 支持右侧、底部、完全自定义样式
- [x] 右侧箭头显隐设置
- [x] 引用自定义xib Cell与model
- [x] 支持暗黑模式
- [x] 提交按钮和导航条配置
- [x] 录入样式排版：左标题右详情，或者上标题下详情
- [x] 快速构建设置界面


## <a id="简介"></a> 简介 - Introduce
 <img src="https://gitee.com/iotjh/Picture/raw/master/GitHub/JhForm/JhForm.png">

- JhFormModel：配置单个cell、section
- JhFormTableViewVC：持有JhFormTableView，配置导航条和底部提交按钮，添加数据源
- JhFormConst：全局配置默认属性
- JhFormHandler：model的数据校验
- JhFormCell：继承JhFormBaseCell，遵循JhFormProtocol，根据JhFormModel实现不同cell
- JhFormTableView：通过传入的数据源，创建遵循JhFormProtocol的cell，根据sectionModel创建header和footer
- JhFormProtocol：通过cellModel 配置对应的cell，配置cell高度（可选）


## <a id="安装"></a> 安装 - Installation

<details>
  <summary><strong>手动导入</strong></summary>
  
```ruby
手动导入：将项目中的“JhForm”文件夹拖入项目中
使用前导入头文件 "JhFormTableViewVC.h"
```
</details>

## <a id="要求"></a> 要求 - Requirements
<details>
   <summary><strong>引用的三方库</strong></summary>

```ruby
# 将以下内容添加到您的Podfile中：

#  选择图片依赖HXPhotoPicker和SDWebImage，可以分开加或者使用： pod 'HXPhotoPicker/SDWebImage', '3.1.6'
pod 'HXPhotoPicker', '3.1.6'
pod 'SDWebImage', '5.10.0'
# 选择图片下载在线视频需要使用AFNetworking
pod 'AFNetworking', '4.0.1'
# 可选，建议加
pod 'IQKeyboardManager', '6.5.6'

# 搜索不到库或最新版时请执行
pod repo update 或 rm ~/Library/Caches/CocoaPods/search_index.json
```
</details>

<details>
   <summary><strong>关于相机相册的info配置</strong></summary>

```ruby
- 访问相册和相机需要配置四个info.plist文件
- Privacy - Photo Library Usage Description 和 Privacy - Camera Usage Description 以及 Privacy - Microphone Usage Description
- Privacy - Location When In Use Usage Description 使用相机拍照时会获取位置信息
- 相机拍照功能请使用真机调试
```
</details>

## <a id="使用"></a> 使用 - Use
- 继承JhFormTableViewVC
- 配置cellModel和sectionModel
- 添加到数据源即可快速创建表单
- 具体配置请看应用示例或项目demo

## <a id="默认支持的Cell"></a> 默认支持的Cell - Default supported cell
* [表单录入Cell](#录入Cell)
* [表单选择Cell](#选择Cell)
* [表单TextView录入Cell](#TextView录入Cell)
* [表单录入密码Cell](#录入密码Cell)
* [表单图片选择Cell](#图片选择Cell)
* [表单按钮选择Cell](#按钮选择Cell)
* [表单右侧自定义Cell](#右侧自定义Cell)
* [表单底部自定义Cell](#底部自定义Cell)
* [表单完全自定义Cell](#完全自定义Cell)
* [表单Switch按钮Cell](#Switch按钮Cell)
* [表单标题居中Cell](#标题居中Cell)


## <a id="配置项说明"></a> 配置项说明 - Configure
<details>
  <summary><strong>配置项说明</strong></summary>
  
* 必填选填：默认必填展示小红星，选填隐藏，可配置标题后缀展示“必填选填”文字
* 左侧图标：默认隐藏，可设置图片、图片大小
* 标题：默认居上展示，可设置字体、颜色、宽度、换行、垂直居中展示，为空隐藏
* 详情：默认居上展示，自动换行，可设置详情和提示文字的字体、颜色，键盘切换，录入长度/总长度展示，最大录入限制，文字居左居右排版，密码录入单行展示
* 右侧按钮：默认隐藏，可设置图片和文字，点击事件
* 右侧箭头：默认选择样式显示，可设置显隐
* 默认自定义样式：可设置右侧自定义、底部自定义、完全自定义视图
* 图片选择：设置相机拍照与图库选择（支持本地与网络图片、视频），可设置默认选择图片、视频，最大选择数，底部提示文字
* 按钮选择：设置单选和多选，宽度自适应，设置默认选中按钮，按钮颜色、字体，切换按钮图标等
* 默认自定义样式：支持右侧自定义、底部自定义、完全自定义
* 底部提交按钮：默认展示，可设置隐藏、按钮字体、颜色、背景色
* 导航条：设置title，右侧文字、图标、点击事件
* 暗黑模式：默认自动切换

注：<br>

* JhFormCellModel 针对单个页面某些属性动态配置<br>
 * JhFormTableViewVC.h 针对整个页面进行表单提交按钮、导航条配置<br>
 * JhFormConst 针对项目范围内进行属性配置<br>
 
</details>


## <a id="例子"></a> 应用示例 - Examples

<details  id="录入Cell">
  <summary><strong>录入Cell</strong></summary>
   
```objc
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
```
</details>

<details id="选择Cell">
  <summary><strong>选择Cell</strong></summary>
   
```objc
    JhFormCellModel *selectCell = JhFormCellModel_AddSelectCell(@"性别:", @"男", YES);
    selectCell.Jh_placeholder = @"请选择性别";
      //    __weak typeof(selectCell) weakSelectCell = selectCell;
    selectCell.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
          //1.使用自己熟悉的选择弹框 ,选择完成对 Jh_info 赋值 (需要对应ID的话对Jh_info_idStr 赋值 )
          //2. 刷新 [weakSelf.Jh_formTableView reloadData];
      };
    selectCell.Jh_cellNotEdit = YES;
```
</details>

<details id="TextView录入Cell">
  <summary><strong>TextView录入Cell</strong></summary>
   
```objc
   JhFormCellModel *textViewInput = JhFormCellModel_AddTextViewInputCell(@"备注:",  @"", NO);
   textViewInput.Jh_placeholder = @"选填，请输入备注(最多500字)";
   textViewInput.Jh_maxInputLength = 500;
```
</details>

<details id="录入密码Cell">
  <summary><strong>录入密码Cell</strong></summary>
   
```objc
    pwd.JhInputBlock = ^(NSString * _Nonnull text, BOOL isInputCompletion) {
        NSLog(@"当前的输入状态: %@", isInputCompletion ? @"YES" : @"NO");
        NSLog(@"文字: %@", text);
    };
```
</details>

<details id="图片选择Cell">
  <summary><strong>图片选择Cell</strong></summary>
   
```objc
    //默认选择图片与相机拍照
    JhFormCellModel *picture = JhFormCellModel_AddImageCell(@"选择图片:", NO);
    picture.Jh_tipInfo =@"这是一条默认颜色的提示信息(不设置不显示)";
    picture.Jh_leftImgName = @"ic_album";
    picture.Jh_leftImgRightMargin = 5;
    
    //选择视频
    JhFormCellModel *video = JhFormCellModel_AddImageCell(@"选择视频:", YES);
    video.Jh_maxImageCount = 2;
    video.Jh_tipInfo =@"这是一条可设置颜色的提示信息";
    video.Jh_tipInfoColor = [UIColor redColor];
    video.Jh_selectImageType = JhSelectImageTypeVideo;
    video.Jh_videoMinimumDuration = 1;
    video.Jh_rightBtnImgName = @"ic_album";
    video.Jh_rightBtnWidth = 30;
    video.Jh_rightBtnHeight = 30;
    video.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击图片"];
    };
    
    //默认加载网络图片
    JhFormCellModel *urlPicture = JhFormCellModel_AddImageCell(@"加载网络图片:", NO);
    //    urlPicture.Jh_noShowAddImgBtn=YES;
    //    urlPicture.Jh_hideDeleteButton = YES;
    urlPicture.Jh_imageArr =@[@"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png"];
```
</details>

<details id="按钮选择Cell">
  <summary><strong>按钮选择Cell</strong></summary>
   
```objc
    //单选，3个选项，设置图标
    JhFormCellModel *cell2 = JhFormCellModel_AddSelectBtnCell(@"单选3选项", YES, YES);
    cell2.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
    cell2.Jh_selectBtnCell_unSelectIcon=Jh_Icon_CheckBoxNormal;
    cell2.Jh_selectBtnCell_selectIcon=Jh_Icon_CheckBoxSelect;
    
    //单选，设置上标题下选项，一个选项一行
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectBtnCell(@"单选，一选项一行：", YES, YES);
    cell5.Jh_selectBtnCell_btnIconSpace = 40;
    cell5.Jh_selectBtnCell_btnTitleArr = @[@"2020年1月-3月",@"2020年4月-6月",@"2020年7月-9月"];
    cell5.Jh_selectBtnCell_isSingleLineDisplay = YES;
    cell5.Jh_selectBtnCell_isTopTitleBottomOption = YES;
    
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
```
</details>

<details id="右侧自定义Cell">
  <summary><strong>右侧自定义Cell</strong></summary>
   
```objc
    //输入cell右侧设置自定义view
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"InputCell右侧设置自定义view", @"", YES, UIKeyboardTypeNumberPad);
    cell0.Jh_maxInputLength = 500;
    cell0.Jh_rightViewWidth = 120; //右侧自定义view 可添加倒计时按钮
    cell0.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =JhRandomColor;
    };
    cell0.Jh_cellTextVerticalCenter =YES;
    
    //右侧自定义View Cell
    JhFormCellModel *cell1 = JhFormCellModel_AddCustumRightCell(@"右侧自定义:");
    cell1.Jh_cellHeight = 60;
    cell1.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor = JhRandomColor;
    };
```
</details>

<details id="底部自定义Cell">
  <summary><strong>底部自定义Cell</strong></summary>
   
```objc
    //底部自定义View Cell
    JhFormCellModel *cell3 = JhFormCellModel_AddCustumBottomCell(@"底部自定义:");
    cell3.Jh_cellHeight = 150;
    cell3.Jh_custumBottomViewBlock = ^(UIView * _Nonnull bottomView) {
        bottomView.backgroundColor = JhRandomColor;
    };
```
</details>

<details id="完全自定义Cell">
  <summary><strong>完全自定义Cell</strong></summary>
   
```objc
    JhFormCellModel *Section1_cell1 = JhFormCellModel_AddCustumALLViewCell(80);
    Section1_cell1.Jh_custumALLViewBlock = ^(UIView * _Nonnull allView) {
        allView.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"这是完全自定义view添加的label";
        label.textColor =  [UIColor redColor];
        label.frame=CGRectMake(0, 30, Jh_ScreenWidth-30, 20);
        [allView addSubview:label];
    };
```
</details>

<details id="Switch按钮Cell">
  <summary><strong>Switch按钮Cell</strong></summary>
   
```objc
    //Switch按钮
    JhFormCellModel *switchBtn = JhFormCellModel_AddSwitchBtnCell(@"开关Cell:", YES);
    switchBtn.Jh_switchTintColor = [UIColor orangeColor];
    //可以不通过block获取开关状态
    __weak typeof(switchBtn) weakSwitchBtn = switchBtn;
    switchBtn.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
        weakSwitchBtn.Jh_switchOnTintColor = JhRandomColor; //切换开关要进行的操作
        [weakSelf.Jh_formTableView reloadData];//刷新
        NSLog(@"switchBtn_on %@", switchBtn_on ? @"YES" : @"NO");
    };
    
    JhFormCellModel *switchBtn2 = JhFormCellModel_AddSwitchBtnCell(@"标题", NO);
    switchBtn2.Jh_leftImgName = @"ic_collections";
    switchBtn2.Jh_leftImgWH = 30;
    //    switchBtn2.Jh_hiddenLine = YES;
    switchBtn2.Jh_leftImgRightMargin = 12;
    switchBtn2.Jh_tipInfo = @"这是提示文字";
    switchBtn2.Jh_cellTextVerticalCenter = YES;
```
</details>

<details id="标题居中Cell">
  <summary><strong>标题居中Cell</strong></summary>
   
```objc
    JhFormCellModel *centerText = JhFormCellModel_AddCenterTextCell(@"退出登录");
    centerText.Jh_cellHeight = 60;
    centerText.Jh_leftImgName = @"ic_emotions";
    centerText.Jh_leftImgRightMargin = -5;
    centerText.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf.view hx_showImageHUDText:@"点击了退出登录"];
    };
```
</details>

<details>
  <summary><strong>导航条和提交按钮</strong></summary>
   
```objc
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
</details>

<details>
  <summary><strong>单页面统一配置</strong></summary>
   
```objc
  //如需要单页面统一配置，放在添加数据源后面
  
 //隐藏默认的footerView
 self.Jh_defaultFooterViewHidden = YES;
 //可隐藏整个页面的红星按只有标题显示
 self.Jh_leftTitleHiddenRedStar =YES;
 //统一设置左侧title的宽度
 self.Jh_leftTitleWidth = 120;   
```
</details>

<details>
  <summary><strong>添加数据源和提交数据的获取</strong></summary>
   
```objc
  NSMutableArray *cellArr0 = [NSMutableArray array];
  [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]];
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
```
</details>

<br>

* 更多请下载工程查看
<br>


## <a id="更新记录"></a> 更新记录 - Update History
<details open id="最近更新">
  <summary><strong>最近更新</strong></summary>
   
```
* 2020.12.09 - v2.0.0版本，代码重构，支持自定义xib Cell与model，此版本变动较大，若引用v1.5.0版本之前版本谨慎更新 <br>
* 2020.11.13 - v1.5.0版本，添加视频选择效果，支持本地和网络视频选择与展示 <br>
```
</details>
   
<details id="历史记录">
  <summary><strong>历史记录</strong></summary>
  
```
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
```
</details>

<br>
<br>

[回到顶部](#readme)
