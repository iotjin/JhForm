//
//  FormDemo6VC.m
//  JhForm
//
//  Created by Jh on 2019/9/10.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo6VC.h"
#import "Masonry.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@implementation FormDemo6VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"左侧标题为空";
    [self initializeForm];
}

- (void)initializeForm {

    __weak typeof(self) weakSelf = self;
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"", @"", YES, 0);
    cell0.Jh_placeholder = @"InputCell默认(限制50字符)";
    cell0.Jh_maxInputLength = 50;
    cell0.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        // 因为没有设置 cell0.Jh_rightViewWidth 宽度值，所以这里的设置是无效的。
        RightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"", @"", YES, UIKeyboardTypeNumberPad);
    cell1.Jh_placeholder = @"InputCell右侧设置自定义view";
    cell1.Jh_maxInputLength = 6;
    cell1.Jh_rightViewWidth = 120; // 设置右侧自定义视图宽度
    cell1.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"", @"", NO, 0);
    cell2.Jh_placeholder =@"InputCell可换行(限制500字符)";
    cell2.Jh_maxInputLength = 500;
    cell2.Jh_rightViewWidth = 80; /// 设置右侧自定义视图宽度
    cell2.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor = JhRandomColor;
    };
    
    JhFormCellModel *cell3 = JhFormCellModel_AddPwdInputCell(@"", @"", YES);
    cell3.Jh_placeholder = @"PwdInputCell(请输入密码)";
    
    JhFormCellModel *cell4 = JhFormCellModel_AddSelectCell(@"", @"", YES);
    cell4.Jh_placeholder = @"请选择";
    
    JhFormCellModel *cell_tip = JhFormCellModel_AddInputCell(@"", @"下面这个是CustumRightCell", NO, 0);
    cell_tip.Jh_cellBgColor = JhRandomColor;
    cell_tip.Jh_defaultHeight = 60.0f;
    cell_tip.Jh_editable = NO;
    
    // 左侧标题为空，右侧自定义视图
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = JhRandomColor;
    JhFormCellModel *cell5 = JhFormCellModel_AddCustumRightCell(@"");
    cell5.Jh_required = YES;
    cell5.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView  addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(RightView);
        }];
    };
    
    JhFormCellModel *cell6 = JhFormCellModel_Add(@"", @"", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    cell6.Jh_showLength = YES;
    cell6.Jh_maxInputLength = 150;
    
    NSArray *cells = @[cell0,cell1,cell2,cell3,cell4,cell_tip,cell5,cell6];
    JhFormSectionModel *section0 = JhSectionModel_Add(cells);
    [self.Jh_formModelArr addObject:section0];
        
    // 设置导航栏按钮，及其点击事件
    self.Jh_navRightTitle = @"隐藏红星";
    self.Jh_clickNavRightItemBlock = ^{
        if ([weakSelf.Jh_navRightTitle isEqualToString:@"隐藏红星"]) {
            weakSelf.Jh_leftTitleHiddenRedStar =YES;
            weakSelf.Jh_navRightTitle = @"显示红星";
        } else{
            weakSelf.Jh_leftTitleHiddenRedStar =NO;
            weakSelf.Jh_navRightTitle = @"隐藏红星";
            
            cell0.Jh_titleHiddenRedStar = NO;
            cell1.Jh_titleHiddenRedStar = NO;
            cell2.Jh_titleHiddenRedStar = NO;
            cell3.Jh_titleHiddenRedStar = NO;
            cell4.Jh_titleHiddenRedStar = NO;
            cell_tip.Jh_titleHiddenRedStar = NO;
            cell5.Jh_titleHiddenRedStar = NO;
            cell6.Jh_titleHiddenRedStar = NO;
        }
        
        [weakSelf.Jh_formTableView reloadData];
    };
};

#pragma mark - Actions

// 提交按钮点击事件
- (void)SubmitRequest {
    
}

@end
