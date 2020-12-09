//
//  FormDemo4VC.m
//  JhForm
//
//  Created by Jh on 2019/7/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo4VC.h"

@interface FormDemo4VC ()

@property (nonatomic, strong) JhFormCellModel *selectCell2;

@end

@implementation FormDemo4VC

-(void)dealloc{
    NSLog(@" FormDemo4VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo4 - Switch按钮和选择样式";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //居右
    JhFormCellModel *infoArrowCell = JhFormCellModel_AddRightArrowCell(@"左标题:", @"右信息(居右,带箭头)");
    infoArrowCell.Jh_infoTextColor = [UIColor redColor];
    infoArrowCell.Jh_leftImgName = @"ic_emotions";
    
    JhFormCellModel *hiddenArrow = JhFormCellModel_AddSelectCell(@"标题:", @"隐藏箭头", YES);
    hiddenArrow.Jh_hiddenArrow = YES;
    
    //设置Cell
    JhFormCellModel *selectCell = JhFormCellModel_AddSelectCell(@"性别:", @"男", YES);
    selectCell.Jh_placeholder = @"请选择性别";
    //    __weak typeof(selectCell) weakSelectCell = selectCell;
    selectCell.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
        //1.使用自己熟悉的选择弹框 ,选择完成对 Jh_info 赋值 (需要对应ID的话对Jh_info_idStr 赋值 )
        //2. 刷新 [weakSelf.Jh_formTableView reloadData];
    };
    selectCell.Jh_cellNotEdit = YES;
    
    
    NSArray *tempArr0 = @[@"选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一",
                          @"选项二",
                          @"选项三选项三选项三选项三"];
    _selectCell2 = JhFormCellModel_AddSelectCell(@"SelectCell", tempArr0[0], YES);
    _selectCell2.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf show:tempArr0];
    };
    _selectCell2.Jh_cellTextVerticalCenter = YES;
    
    JhFormCellModel *time = JhFormCellModel_AddSelectCell(@"预约时间:", @"", YES);
    time.Jh_placeholder = @"请选择预约时间";
    time.Jh_rightBtnWidth = 30;
    time.Jh_rightBtnTitle = @"上午";
    time.Jh_rightBtnTitleColor = Jh_SetLightAndDark([UIColor blackColor], JhGrayColor(150));
    //选择时间，弹出时间选择器，demo中没有添加第三方的选择器，实际使用时可导入自己熟悉的选择器
    time.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf.view hx_showImageHUDText:@"假装弹出时间选择器"];
        NSLog(@" 预约时间 %@ ",cellModel.Jh_info);
    };
    //切换上下午
    NSArray *tempArr = @[@"上午",@"下午"];
    __weak typeof(time) weakTime = time;
    time.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [HXPhotoBottomSelectView showSelectViewWithTitles:tempArr selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
            weakTime.Jh_rightBtnTitle = tempArr[index];
            [weakSelf.Jh_formTableView reloadData];
        } cancelClick:^{
        }];
    };
    
    JhFormCellModel *custumView = JhFormCellModel_AddSelectCell(@"标题:", @"默认不能实现效果，右侧可以添加自定义View", YES);
    custumView.Jh_rightViewWidth = 100;
    custumView.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        rightView.backgroundColor =[UIColor orangeColor];
    };
    
    JhFormCellModel *selectTipCell = JhFormCellModel_AddRightArrowCell(@"标题", nil);
    selectTipCell.Jh_tipInfo = @"提示文字";
    selectTipCell.Jh_info = @"info";
    selectTipCell.Jh_cellTextVerticalCenter = YES;
    
    JhFormCellModel *selectCell2 = JhFormCellModel_AddRightArrowCell(@"标题", @"");
    selectCell2.Jh_leftImgName = @"ic_collections";
    selectCell2.Jh_leftImgWH = 30;
    //    selectCell2.Jh_hiddenLine = YES;
    selectCell2.Jh_leftImgRightMargin = 12;
    selectCell2.Jh_tipInfo = @"这是提示文字";
    selectCell2.Jh_cellTextVerticalCenter = YES;
    selectCell2.Jh_info = @"info";
    
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
    
    //文本居中
    JhFormCellModel *centerText = JhFormCellModel_AddCenterTextCell(@"退出登录");
    centerText.Jh_cellHeight = 60;
    centerText.Jh_leftImgName = @"ic_emotions";
    centerText.Jh_leftImgRightMargin = -5;
    centerText.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf.view hx_showImageHUDText:@"点击了退出登录"];
    };
    
    [cellArr0 addObjectsFromArray: @[infoArrowCell,hiddenArrow,selectCell,_selectCell2,time,custumView,selectTipCell,selectCell2,switchBtn,switchBtn2,centerText]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    
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

- (void)show:(NSArray *)titleArr {
    if (!titleArr.count) {
        [self.view hx_showImageHUDText:@"暂无选项"];
        return;
    }
    
    NSMutableArray *models = [NSMutableArray new];
    for (NSString *title in titleArr) {
        HXPhotoBottomViewModel *model = [HXPhotoBottomViewModel new];
        model.title = title;
        [models addObject:model];
    }
    
    HXWeakSelf
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.text = @"请选择";
    titleLb.textColor = [UIColor lightGrayColor];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.font = [UIFont hx_pingFangFontOfSize:14];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, titleLb.hx_w, 0.5)];
    lineView.backgroundColor = JhBaseLineColor;
    [titleLb addSubview:lineView];
    [HXPhotoBottomSelectView showSelectViewWithModels:models
                                           headerView:titleLb
                                      showTopLineView:YES
                                          cancelTitle:nil
                                     selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
        [weakSelf.view hx_showImageHUDText:[NSString stringWithFormat:@"选择了第%ld项", index + 1]];
        weakSelf.selectCell2.Jh_info = titleArr[index];
        [weakSelf.Jh_formTableView reloadData];
    }
                                          cancelClick:^{
        [weakSelf.view hx_showImageHUDText:@"取消选择"];
    }];
}

@end
