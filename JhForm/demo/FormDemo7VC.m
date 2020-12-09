//
//  FormDemo7VC.m
//  JhForm
//
//  Created by Jh on 2019/9/30.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo7VC.h"
#import "JhBaseHeaderView.h"
#import "FooterCell.h"

@interface FormDemo7VC ()

@property (nonatomic, strong) JhBaseHeaderView *headerV2;

@end

@implementation FormDemo7VC

-(void)dealloc{
    NSLog(@" FormDemo7VC - dealloc ");
}

-(JhBaseHeaderView *)headerV2{
    if (!_headerV2) {
        JhWeakSelf  
        JhBaseHeaderView *view = [JhBaseHeaderView Jh_viewFromXib];
        view.backgroundColor = JhBaseBgColor;
        view.frame = CGRectMake(0, 0, Jh_ScreenWidth, 44);
        view.Jh_leftTitle = @"第二组 - 添加自定义xib当做头部";
        view.Jh_rightBtnTitle = @"更多";
        view.JhHeaderClickRightBtnBlock = ^{
            [weakSelf.view hx_showImageHUDText:@"点击更多按钮"];
        };
        _headerV2 = view;
    }
    return _headerV2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo7 - 自定义view和头尾设置";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {

    //第一组，设置头部尾部属性，带悬停，不要悬停直接设置cell作为头尾
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
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
    JhFormCellModel *cell2 = JhFormCellModel_AddCustumRightCell(@"右侧自定义带箭头:");
    cell2.Jh_rightViewBlock = ^(UIView *rightView) {
        rightView.backgroundColor = JhRandomColor;
    };
    cell2.Jh_isShowArrow =YES;
    cell2.Jh_titleWidth = 130;
    
    //底部自定义View Cell
    JhFormCellModel *cell3 = JhFormCellModel_AddCustumBottomCell(@"底部自定义:");
    cell3.Jh_cellHeight = 150;
    cell3.Jh_custumBottomViewBlock = ^(UIView * _Nonnull bottomView) {
        bottomView.backgroundColor = JhRandomColor;
    };
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    //第一组的头部和尾部设置
    section0.Jh_headerTitle = @"第一组头部";
    section0.Jh_headerTitleFont = 18;
    section0.Jh_headerHeight = 44;
    
    section0.Jh_footerTitle = @"第一组尾部";
    section0.Jh_footerTitleFont = 16;
    section0.Jh_footerTitleColor = [UIColor redColor];
    section0.Jh_footerHeight = 44;
    
    //第二组，添加自定义xib
    NSMutableArray *cellArr1 = [NSMutableArray array];
    
    //完全自定义view
    JhFormCellModel *Section1_cell0 = JhFormCellModel_AddRightArrowCell(@"完全自定义view：", nil);
    Section1_cell0.Jh_hiddenArrow = YES;
    
    JhFormCellModel *Section1_cell1 = JhFormCellModel_AddCustumALLViewCell(80);
    Section1_cell1.Jh_custumALLViewBlock = ^(UIView * _Nonnull allView) {
        allView.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"这是完全自定义view添加的label";
        label.textColor =  [UIColor redColor];
        label.frame=CGRectMake(0, 30, Jh_ScreenWidth-30, 20);
        [allView addSubview:label];
    };
    
    JhFormCellModel *Section1_cell2 = JhFormCellModel_AddCustumALLViewCell(44);
    Section1_cell2.Jh_hiddenLine = YES;
    Section1_cell2.Jh_custumALLViewBlock = ^(UIView * _Nonnull allView) {
        allView.backgroundColor = [UIColor orangeColor];

        FooterCell *cell = [FooterCell Jh_viewFromXib];
        cell.title = @"这是完全自定义view添加的Cell";
        cell.frame = CGRectMake(0, 0, allView.Jh_width, allView.Jh_height);
        cell.backgroundColor = [UIColor yellowColor];
        [allView addSubview:cell];
    };
    
    JhFormCellModel *cell_line = JhFormCellModel_AddCustumALLViewCell(10);
    cell_line.Jh_cellBgColor = JhBaseBgColor;
    cell_line.Jh_hiddenLine = YES;
    
    
    [cellArr1 addObjectsFromArray: @[Section1_cell1,Section1_cell2,cell_line]];
    JhFormSectionModel *section1 = JhSectionModel_Add(cellArr1);
    
    section1.Jh_headerView = self.headerV2;
    section1.Jh_headerHeight= self.headerV2.Jh_height;
    
    FooterCell *footer = [FooterCell Jh_viewFromXib];
    footer.backgroundColor = [UIColor yellowColor];
    section1.Jh_footerView = footer;
    section1.Jh_footerHeight = 44;
    
    [self Jh_addSectionModel:section0];
    [self Jh_addSectionModel:section1];
    
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
    
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
    };
    
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
}

@end
