# JhForm
JhForm - 自定义表单工具类,可以更加简单,快捷的创建表单

注:本类copy的SWForm代码,在此基础上新增了几种自定义的cell,改成了自己熟悉的代码风格.(代码地址:https://github.com/RockChanel/SWForm)

![](https://gitee.com/iotjh/Picture/raw/master/form_demo_00.gif)  <br> 
![](https://gitee.com/iotjh/Picture/raw/master/form_demo_01.gif)  <br> 
![](https://gitee.com/iotjh/Picture/raw/master/form_demo_02.gif)  <br> 

## Examples


* 样式1 - 输入样式
```
      JhFormCellModel *cell4 = JhFormCellModel_Add(@"手机号:", @"XXX(可编辑)", JhFormCellTypeInput, YES, YES, UIKeyboardTypePhonePad);
    cell4.Jh_placeholder = @"请输入手机号(最长11位,必选)";
    cell4.Jh_maxInputLength = 11;

```

* 样式2 - 选择样式
```

    JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"性别:", @"文本居左(可选择)", YES);
    cell5.Jh_placeholder = @"请选择性别";
    __weak typeof(cell5) weakCell5 = cell5;
    cell5.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        //1.使用自己熟悉的选择弹框 ,选择完成对 Jh_info 赋值 (需要对应ID的话对Jh_info_idStr 赋值 )
        //2. 刷新 [weakSelf.Jh_formTableView reloadData];
    };


```
* 样式3 - textView
```
        JhFormCellModel *cell6 = JhFormCellModel_Add(@"备注:", @"默认备注", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    cell6.Jh_placeholder = @"请输入备注(最多50字)";
    cell6.Jh_showLength = YES;//默认不显示
    cell6.Jh_maxInputLength = 50;

```

* 样式4 - 默认选择图片样式
```
      JhFormCellModel *cell7 = JhFormCellModel_AddImageCell(@"选择图片:", NO);

```

* 样式5 - switch样式
```
        JhFormCellModel *cell2 = JhFormCellModel_AddSwitchBtnCell(@"左标题:", YES);
    cell2.Jh_switchTintColor = [UIColor orangeColor];
    
    //可以不通过block获取开关状态
    __weak typeof(cell2) weakCell2 = cell2;
    cell2.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch *switchBtn) {
        NSLog(@"switchBtn_on %@", switchBtn_on ? @"YES" : @"NO");
//        weakCell2.Jh_switchOnTintColor = JhRandomColor;
        [weakSelf.Jh_formTableView reloadData];
    };


```

* 样式6 - 文本居右
```
  JhFormCellModel *cell0 = JhFormCellModel_AddRightTextCell(@"左标题:", @"右信息(不可编辑,居右)");

```
* 样式7 - 文本居右带箭头
```
  JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");

```

* 样式8 - 右侧自定义View
```
  //右侧自定义View
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
```

 //底部自定义View
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
```
   
    //文本居中
    JhFormCellModel *Section1_cell1 = JhFormCellModel_AddCenterTextCell(@"退出登录");
    
    //设置头部
    JhBaseHeaderView *headerV = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 44)];
    headerV.backgroundColor = BaseBgWhiteColor;
    headerV.Jh_leftTitle = @"第一组头部";
    section0.Jh_headerView = headerV;
    section0.Jh_headerHeight= headerV.bounds.size.height;

```

*  一些其他的设置
```
   
     //隐藏默认的footerView
    self.Jh_defaultFooterViewHidden = YES;
    
    

```


* 添加和提交的处理
```

   

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
