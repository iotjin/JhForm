//
//  FormDemo8VC.m
//  JhForm
//
//  Created by Jh on 2020/9/29.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "FormDemo8VC.h"
#import "Masonry.h"
#import "HXPhotoPicker.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo8VC ()

@property (nonatomic, strong) JhFormCellModel *cell6;

@end

@implementation FormDemo8VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configFormModel];
    
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    self.Jh_navTitle = @"cell文字居中";
    
    __weak typeof(self) weakSelf = self;
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
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
    
    NSString *title= @"统一社会\n 信用代码";
    JhFormCellModel *cell3 = JhFormCellModel_AddInputCell(title, @"", YES, 0);
    cell3.Jh_placeholder = @"请输入18位统一社会信用代码";
    cell3.Jh_titleMultiLineShow =YES;
    cell3.Jh_maxInputLength = 18;
    
    NSString *numStr = @"123123131313213213213213213131321321321321321332131321321313213213213132";
    JhFormCellModel *cell4 = JhFormCellModel_AddInputCell(@"左侧统一社会信用代码", numStr, NO, 0);
    cell4.Jh_placeholder = @"可换行";
    cell4.Jh_titleMultiLineShow =YES;
    cell4.Jh_maxInputLength=500;
    
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectCell(@"这是一个选择样式的cell", @"", NO);
    cell5.Jh_placeholder = @"请选择性别";
    cell5.Jh_titleMultiLineShow =YES;
    
    _cell6 = JhFormCellModel_AddSelectCell(@"SelectCell", @"选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一", NO);
    _cell6.Jh_titleMultiLineShow =YES;
    _cell6.Jh_CellSelectCellBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf show:@[@"选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一选项一",
                         @"选项二",
                         @"选项三选项三选项三选项三"]];
    };
    
    
    //这里是单个设置cell文字居中，如项目表单样式都需要居中效果，可修改JhFormConst文件的Jh_CellTextVerticalStyle设置居中或居上
    cell0.Jh_cellTextVerticalCenter=YES;
    cell1.Jh_cellTextVerticalCenter=YES;
    cell2.Jh_cellTextVerticalCenter=YES;
    cell3.Jh_cellTextVerticalCenter=YES;
    cell4.Jh_cellTextVerticalCenter=YES;
    cell5.Jh_cellTextVerticalCenter=YES;
    _cell6.Jh_cellTextVerticalCenter=YES;
    
    [cellModelArr addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,_cell6]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self.Jh_formModelArr addObject:section0];
};


#pragma mark - SubmitRequest
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
    titleLb.backgroundColor = [UIColor whiteColor];
    titleLb.text = @"请选择";
    titleLb.textColor = [UIColor lightGrayColor];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.font = [UIFont hx_pingFangFontOfSize:14];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, titleLb.hx_w, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
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
