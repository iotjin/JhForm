//
//  JhFormTableViewVC.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//


/** 用法
 
 
 #pragma mark - initDataArr
 -(void)initDatas{
 
 
 
 __weak typeof(self) weakSelf = self;
 
 //    weakSelf.FormTableView.x = 10;
 //    weakSelf.FormTableView.width = Kwidth -20;
 
 NSMutableArray *Items = [NSMutableArray array];
 
 JhFormItem *data0 = JhFormItem_Add(@"选择选项:", @"", JhFormItemTypeCustumRight, YES, YES, UIKeyboardTypePhonePad);
 data0.defaultHeight = 60;
 data0.custumRightViewBlock = ^(UIView *RightView) {
 [RightView  addSubview:self.btnBgView];
 [self.btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.centerY.mas_equalTo(RightView);
 make.right.mas_equalTo(0);
 make.left.mas_equalTo(0);
 }];
 };
 
 
 JhFormItem *data1 = JhFormItem_Add(@"公司人数:", @"", JhFormItemTypeInput, YES, NO, UIKeyboardTypePhonePad);
 data1.placeholder = @"请输入公司人数";
 data1.maxInputLength = 5;
 //    data1.unit = @"@qq.com";
 
 JhFormItem *data2 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeSelect, YES, YES, UIKeyboardTypePhonePad);
 data2.placeholder = @"请选择时间";
 
 WeakObject(data2);
 data2.itemSelectCompletion = ^(JhFormItem *item) {
 [CGXPickerView showDatePickerWithTitle:@"请选择汇款时间" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:nil MaxDateStr:nil IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
 NSLog(@" 选择的时间为: %@",selectValue);
 weakObject.info = selectValue;
 [weakSelf.FormTableView reloadData];
 }];
 };
 
 JhFormItem *data3 = JhFormItem_Add(@"备注:", @"", JhFormItemTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
 data3.placeholder = @"请输入备注";
 data3.showLength = NO;
 
 
 JhFormItem *data4 = JhFormItem_Add(@"选择图片类:", @"", JhFormItemTypeSelectImage, YES, YES, UIKeyboardTypeDefault);
 
 
 JhFormItem *data5 = JhFormItem_Add(@"自定义底部View:", @"", JhFormItemTypeCustumBottom, YES, YES, UIKeyboardTypeDefault);
 data5.custumBottomViewBlock = ^(UIView *BottomView) {
 [BottomView addSubview:self.onePhotoView];
 };
 
 
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
        [JhProgressHUD showText:error];
    }];
    
    
};


}




 */




#import <UIKit/UIKit.h>

#import "HXPhotoPicker.h"
#import "JhFormItem.h"
#import "JhFormSectionItem.h"
#import "JhFormHandler.h"

NS_ASSUME_NONNULL_BEGIN


typedef void(^FormSubmitCompletion)(void);

@interface JhFormTableViewVC : UIViewController

/**
 表单tableView
 */
@property (nonatomic, strong) UITableView *FormTableView;

/** 标题 */
@property(nonatomic,strong) NSString * NavTitleStr;

/** 提交文字 */
@property (nonatomic, strong) NSString *submitStr;

/**
 表单数据源，数据源格式应为 @[JhFormSection..]，否则断言会直接崩溃
 */
@property (nonatomic, strong) NSMutableArray *mutableItems;

/**
 提交操作事件block，包含提交操作表单页面提交按钮点击事件实现回调
 */
@property (nonatomic, copy) FormSubmitCompletion submitCompletion;


/**
 表单页面初始化方法
 
 @param style 表单tableView样式
 */
- (instancetype)initWithStyle:(UITableViewStyle)style;





@end

NS_ASSUME_NONNULL_END
