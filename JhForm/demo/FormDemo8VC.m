//
//  FormDemo8VC.m
//  JhForm
//
//  Created by Jh on 2020/9/29.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "FormDemo8VC.h"

@interface FormDemo8VC ()

@property (nonatomic, strong) JhFormCellModel *cell6;

@end

@implementation FormDemo8VC

-(void)dealloc{
    NSLog(@" FormDemo8VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo8 - cell文字居中";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {

    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"InputCell", @"", NO, 0);
    cell0.Jh_placeholder =@"输入时左侧自动居中";
    cell0.Jh_maxInputLength=500;
    cell0.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    NSString *info = @"这是不可编辑的，这是不可编辑的，这是不可编辑的，这是不可编辑的，这是不可编辑的，这是不可编辑的，这是不可编辑的，这是不可编辑的";
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"InputCell", info, NO, 0);
    cell1.Jh_editable = NO;
    
    NSString *info2 = @"这是可编辑的，这是可编辑的，这是可编辑的，这是可编辑的，这是可编辑的，这是可编辑的，这是可编辑的，这是可编辑的";
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"InputCell", info2, NO, 0);
    cell2.Jh_rightViewWidth = 80; //右侧自定义view 可添加倒计时按钮
    cell2.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    NSString *title= @"统一社会信用代码";
    JhFormCellModel *cell3 = JhFormCellModel_AddInputCell(title, @"", YES, UIKeyboardTypeNumberPad);
    cell3.Jh_placeholder = @"请输入18位统一社会信用代码";
    cell3.Jh_titleMultiLineShow =YES;
    cell3.Jh_maxInputLength = 18;
    
    NSString *numStr = @"12312313131321321321321321313132132132132132133213132132131321321321313212312312";
    JhFormCellModel *cell4 = JhFormCellModel_AddInputCell(@"左侧统一社会信用代码", numStr, NO, UIKeyboardTypeNumberPad);
    cell4.Jh_placeholder = @"可换行";
    cell4.Jh_titleMultiLineShow =YES;
    cell4.Jh_maxInputLength=500;
    
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"这是一个选择样式的cell", @"", NO);
    cell5.Jh_placeholder = @"请选择性别";
    cell5.Jh_titleMultiLineShow =YES;
    
    
    NSArray *tempArr0 = @[@"选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一",
                         @"选项二",
                         @"选项三选项三选项三选项三"];
    
    _cell6 = JhFormCellModel_AddSelectCell(@"SelectCell", tempArr0[0], NO);
    _cell6.Jh_titleMultiLineShow =YES;
    _cell6.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf show:tempArr0];
    };
    
    
    //这里是单个设置cell文字居中，如项目表单样式都需要居中效果，可修改JhFormConst文件的Jh_CellTextVerticalStyle设置居中或居上，
    //设置 Jh_leftImgName 也会自动按垂直居中布局
    
    cell0.Jh_cellTextVerticalCenter=YES;
    cell1.Jh_cellTextVerticalCenter=YES;
    cell2.Jh_cellTextVerticalCenter=YES;
    cell3.Jh_cellTextVerticalCenter=YES;
    cell4.Jh_cellTextVerticalCenter=YES;
    cell5.Jh_cellTextVerticalCenter=YES;
    _cell6.Jh_cellTextVerticalCenter=YES;
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,_cell6]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];

    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
    };
    
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
}

- (void)show:(NSArray *)titleArr{
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
        weakSelf.cell6.Jh_info = titleArr[index];
        [weakSelf.Jh_formTableView reloadData];
    }
                                          cancelClick:^{
        [weakSelf.view hx_showImageHUDText:@"取消选择"];
    }];
}


@end
