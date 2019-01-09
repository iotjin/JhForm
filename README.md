# JhForm
JhForm - 自定义表单工具类,可以更加简单,快捷的创建表单

![](https://raw.githubusercontent.com/iotjin/JhForm/master/JhForm/screenshots/0.gif)  <br> 
![](https://raw.githubusercontent.com/iotjin/JhForm/master/JhForm/screenshots/1.png)  <br> 


## Examples


* 样式1
```
  
    JhFormItem *data1 = JhFormItem_Add(@"公司人数:", @"", JhFormItemTypeInput, YES, NO, UIKeyboardTypePhonePad);
    data1.placeholder = @"请输入公司人数";
    data1.maxInputLength = 5;
    //    data1.unit = @"@qq.com";  

```

* 样式2
```

     JhFormItem *data2 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeSelect, YES, YES, UIKeyboardTypePhonePad);
    data2.placeholder = @"请选择时间";
    data2.itemSelectCompletion = ^(JhFormItem *item) {
        NSLog(@" 点击了选择时间 ");
        //写选择的操作
        
    };


```
* 样式3
```
    JhFormItem *data3 = JhFormItem_Add(@"备注:", @"", JhFormItemTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    data3.placeholder = @"请输入备注";
    data3.showLength = NO;

```

* 样式4
```
     JhFormItem *data4 = JhFormItem_Add(@"选择图片类:", @"", JhFormItemTypeSelectImage, YES, YES, UIKeyboardTypeDefault);

```

* 样式5
```
      //底部自定义View
     JhFormItem *data5 = JhFormItem_Add(@"自定义底部View:", @"", JhFormItemTypeCustumBottom, YES, YES, UIKeyboardTypeDefault);
     data5.custumBottomViewBlock = ^(UIView *BottomView) {
        [BottomView addSubview:self.onePhotoView];
    };


```

* 样式6
```
   
    //右侧自定义View
    JhFormItem *data0 = JhFormItem_Add(@"选择选项:", @"", JhFormItemTypeCustumRight, YES, YES, UIKeyboardTypePhonePad);
    data0.defaultHeight = 60;
    data0.custumRightViewBlock = ^(UIView *RightView) {
        
        [RightView  addSubview:self.btnBgView];

    };

```


* 添加和提交的处理
```
     NSMutableArray *Items = [NSMutableArray array];
  
    [Items addObjectsFromArray: @[data0,data1,data2,data3,data4,data5]];
    
      JhFormSectionItem *sectionItem = JhSectionItem_Add(Items);
    [self.mutableItems addObject:sectionItem];
    
    
    self.submitStr = @"保 存";
    self.submitCompletion = ^{
        NSLog(@" 点击提交按钮 ");
        
        
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkFormNullDataWithWithDatas:weakSelf.mutableItems success:^{
            
            
            NSLog(@" 人数 - %@", data1.info);
            NSLog(@" 时间 - %@", data2.info);
            NSLog(@" 备注 - %@ ",data3.info);
            NSLog(@" 备注 - %@ ",data3.info);
            NSLog(@" 选择图片类 - selectImages: %@ ",data4.selectImages);
            
            [weakSelf SubmitRequest];
            
            
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
        }];
        
        
    };
    
    

```
