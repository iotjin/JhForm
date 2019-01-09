//
//  TestVC.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "TestVC.h"


@interface TestVC ()<HXPhotoViewDelegate>

@property (nonatomic,strong) UIView *footerView;

/** 按钮 */
@property (nonatomic, strong) UIView *btnBgView;
//@property (nonatomic, strong) JhPositionButton *btn1;
//@property (nonatomic, strong) JhPositionButton *btn2;



@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;
@property (strong, nonatomic) HXDatePhotoToolManager *toolManager;
/** 选中的图片数组 */
@property (nonatomic, strong) NSArray *imgArr;


@end

@implementation TestVC




- (HXPhotoManager *)oneManager {
    if (!_oneManager) {
        
        _oneManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _oneManager.configuration.photoMaxNum = 8;
        _oneManager.configuration.selectTogether = NO;
        _oneManager.configuration.maxNum = 8;
        _oneManager.configuration.cameraCellShowPreview = NO;
        _oneManager.configuration.openCamera =NO;
        _oneManager.configuration.photoCanEdit =NO;
        _oneManager.configuration.showBottomPhotoDetail = NO;
    }
    return _oneManager;
}

- (HXDatePhotoToolManager *)toolManager {
    if (!_toolManager) {
        _toolManager = [[HXDatePhotoToolManager alloc] init];
    }
    return _toolManager;
}

-(HXPhotoView *)onePhotoView{
    if (!_onePhotoView) {
        
        _onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(15,5, Kwidth - 15*2-3*3, 180) WithManager:self.oneManager];
        _onePhotoView.outerCamera = YES;
        _onePhotoView.lineCount =4;
        _onePhotoView.spacing =3;
        _onePhotoView.delegate = self;
        _onePhotoView.addImageName = @"JhForm.bundle/compose_picture_add";

    }
    return _onePhotoView;
}

#pragma mark -  根据photoView来判断是哪一个选择器
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    
    self.imgArr = allList;
    NSSLog(@"allList %@",allList);
    NSSLog(@"self.imgArr %@",self.imgArr);
    
    //获取原图
    [self.toolManager getSelectedImageList:self.imgArr requestType:HXDatePhotoToolManagerRequestTypeOriginal success:^(NSArray<UIImage *> *imageList) {
        
        self.imgArr = imageList;
        NSSLog(@"self.imgArr %@",self.imgArr);
        
    } failed:^{
        
    }];
    
    [self.FormTableView reloadData];
    
}









//-(UIView *)btnBgView{
//    if (!_btnBgView) {
//
//        UIView *bgView = [[UIView alloc]init];
//
//        JhPositionButton *btn1 = [[JhPositionButton alloc]init];
//        [btn1 setTitle:@"选项一" forState:UIControlStateNormal];
//        btn1.titleLabel.font = JhFontsize(15);
//        [btn1 setTitleColor:BaseBlackTextColor forState:UIControlStateNormal];
//        btn1.JhTextHorizontalAlignmentStyle = JhTextAlignmentLeft;
//        btn1.ButtonPositionStyle = JhButtonStyleLeftImageRightTitle;
//        [btn1 setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
//        [btn1 setImage:[UIImage imageNamed:@"checkbox_selected"] forState:UIControlStateSelected];
//        [btn1 addTarget:self action:@selector(ClickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btn1];
//
//        JhPositionButton *btn2 = [[JhPositionButton alloc]init];
//        [btn2 setTitle:@"选项二" forState:UIControlStateNormal];
//        btn2.titleLabel.textAlignment = NSTextAlignmentLeft;
//        btn2.titleLabel.font = JhFontsize(15);
//        [btn2 setTitleColor:BaseBlackTextColor forState:UIControlStateNormal];
//        btn2.ButtonPositionStyle = JhButtonStyleLeftImageRightTitle;
//        btn2.JhTextHorizontalAlignmentStyle = JhTextAlignmentLeft;
//        [btn2 setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
//        [btn2 setImage:[UIImage imageNamed:@"checkbox_selected"] forState:UIControlStateSelected];
//        [btn2 addTarget:self action:@selector(ClickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btn2];
//
//        NSInteger padding = 0;
//        [@[btn1, btn2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:padding tailSpacing:padding];
//
//        [@[btn1, btn2] mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(bgView).offset(0);
//            make.bottom.equalTo(bgView).offset(0);
//        }];
//
//        _btn1 = btn1;
//        _btn2 = btn2;
//        _btnBgView = bgView;
//    }
//    return _btnBgView;
//}
//- (void)ClickSelectBtn:(UIButton *)button {
//    button.selected = !button.selected;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.NavTitleStr = @"标题";
    
   [self initDatas];
    
}

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
        
//        [RightView  addSubview:self.btnBgView];
//        [self.btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(RightView);
//            make.right.mas_equalTo(0);
//            make.left.mas_equalTo(0);
//        }];
        
        
    };
    
    
    JhFormItem *data1 = JhFormItem_Add(@"公司人数:", @"", JhFormItemTypeInput, YES, NO, UIKeyboardTypePhonePad);
    data1.placeholder = @"请输入公司人数";
    data1.maxInputLength = 5;
    //    data1.unit = @"@qq.com";
    
    JhFormItem *data2 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeSelect, YES, YES, UIKeyboardTypePhonePad);
    data2.placeholder = @"请选择时间";
    
//    WeakObject(data2);
//    data2.itemSelectCompletion = ^(JhFormItem *item) {
//        [CGXPickerView showDatePickerWithTitle:@"请选择汇款时间" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:nil MaxDateStr:nil IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
//            NSLog(@" 选择的时间为: %@",selectValue);
//            weakObject.info = selectValue;
//            [weakSelf.FormTableView reloadData];
//        }];
//    };

    data2.itemSelectCompletion = ^(JhFormItem *item) {
        NSLog(@" 点击了选择时间 ");
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
    
    /********************************* test ********************************/

    
//        UIView *bgView=[[UIView alloc]init];
//        bgView.backgroundColor =JhRandomColor;
//        bgView.frame = CGRectMake(50, 20, 100, 90);
//    
//        JhFormItem *data02 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeCustumBottom, YES, YES, UIKeyboardTypePhonePad);
//        data02.defaultHeight =100;
//        data02.custumBottomViewBlock = ^(UIView *BottomView) {
//            [BottomView addSubview:bgView];
//        };
//    
//        JhFormItem *data03 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        JhFormItem *data04 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        data04.defaultHeight = 100;
//        JhFormItem *a00 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        JhFormItem *a01 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        JhFormItem *a02 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        JhFormItem *a03 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//        JhFormItem *a04 = JhFormItem_Add(@"参加工作时间:", @"", JhFormItemTypeInput, YES, YES, UIKeyboardTypePhonePad);
//
//        [items addObjectsFromArray: @[data02,data03,a01,a02,a03,a04,a00,data04]];
    
        //    //self.formTableView.tableFooterView = footerView;
        //    JhFormSectionItem *sectionItem = JhSectionItem_Add(items);
        //    //    sectionItem.headerHeight = 25;
        //    //    sectionItem.footerView = [self footerView];
        //    //    sectionItem.footerHeight = 80;
        //    [self.mutableItems addObject:sectionItem];
    
    /********************************* test ********************************/
    
    
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
    
    
}


#pragma mark - 提交请求
-(void)SubmitRequest{
    
   
    
}



@end
