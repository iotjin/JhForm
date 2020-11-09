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

@interface FormDemo6VC ()

@end

@implementation FormDemo6VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configFormModel];
    
    
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    self.Jh_navTitle = @"左侧标题为空";
    
    __weak typeof(self) weakSelf = self;
    
    self.Jh_navRightTitle = @"隐藏红星";

    
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"", @"", YES, 0);
    cell0.Jh_placeholder =@"InputCell默认(限制50字符)";
    cell0.Jh_maxInputLength=50;
    cell0.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"", @"", YES, UIKeyboardTypeNumberPad);
    cell1.Jh_placeholder =@"InputCell右侧设置自定义view";
    cell1.Jh_maxInputLength = 6;
    cell1.Jh_rightViewWidth = 120; //右侧自定义view 可添加倒计时按钮
    cell1.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"", @"", NO, 0);
    cell2.Jh_placeholder =@"InputCell可换行(限制500字符)";
    cell2.Jh_maxInputLength = 500;
    cell2.Jh_rightViewWidth = 80; //右侧自定义view 可添加倒计时按钮
    cell2.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell3 = JhFormCellModel_AddPwdInputCell(@"", @"", YES);
    cell3.Jh_placeholder = @"PwdInputCell(请输入密码)";
    
    JhFormCellModel *cell4 = JhFormCellModel_AddSelectCell(@"", @"", YES);
    cell4.Jh_placeholder = @"请选择";
    
    
    
    
    JhFormCellModel *cell_tip = JhFormCellModel_AddInputCell(@"", @"下面这个是CustumRightCell", NO, 0);
    cell_tip.Jh_editable = NO;
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = JhRandomColor;
    JhFormCellModel *cell5 = JhFormCellModel_AddCustumRightCell(@"");
    cell5.Jh_required =YES;
    cell5.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView  addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    
    JhFormCellModel *cell6 = JhFormCellModel_Add(@"", @"", JhFormCellTypeTextViewInput, YES, YES, UIKeyboardTypeDefault);
    cell6.Jh_showLength = YES;
    cell6.Jh_maxInputLength = 150;
    
    
    
    
    [cellModelArr addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell_tip,cell5,cell6]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self.Jh_formModelArr addObject:section0];
    
    
    self.JhClickNavRightItemBlock = ^{
             if ([weakSelf.Jh_navRightTitle isEqualToString:@"隐藏红星"]) {
                 weakSelf.Jh_leftTitleHiddenRedStar =YES;
                 weakSelf.Jh_navRightTitle = @"显示红星";
             }else{
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


#pragma mark - SubmitRequest
-(void)SubmitRequest{
    
    
    
}

@end
