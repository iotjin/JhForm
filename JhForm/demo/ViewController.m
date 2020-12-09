//
//  ViewController.m
//  JhForm
//
//  Created by Jh on 2019/1/9.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "ViewController.h"
#import "FormDemo1VC.h"
#import "FormDemo2VC.h"
#import "FormDemo3VC.h"
#import "FormDemo4VC.h"
#import "FormDemo5VC.h"
#import "FormDemo6VC.h"
#import "FormDemo7VC.h"
#import "FormDemo8VC.h"
#import "FormDemo9VC.h"
#import "FormDemo10VC.h"

@interface ViewController ()
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"JhForm";
    
    [self initModel];
    
//    UIColor *bgColor = Jh_ThemeType == JhThemeTypeAuto ? Jh_SetLightAndDark(JhBaseBgColor_dark, JhBaseBgColor_dark) : JhGrayColor(245);
//    self.navigationController.navigationBar.barTintColor = bgColor;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:Jh_TitleColor};
}


#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"默认表单", nil);
    cell0.Jh_jumpClassName = [FormDemo1VC class];
    cell0.Jh_tipInfo = @"demo1";
    
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左侧标题为空", nil);
    cell1.Jh_jumpClassName = [FormDemo2VC class];
    cell1.Jh_tipInfo = @"demo2";
    
    JhFormCellModel *cell2 = JhFormCellModel_AddRightArrowCell(@"录入样式", nil);
    cell2.Jh_jumpClassName = [FormDemo3VC class];
    cell2.Jh_tipInfo = @"demo3";
    
    JhFormCellModel *cell3 = JhFormCellModel_AddRightArrowCell(@"Switch按钮和选择样式", nil);
    cell3.Jh_jumpClassName = [FormDemo4VC class];
    cell3.Jh_tipInfo = @"demo4";
    
    JhFormCellModel *cell4 = JhFormCellModel_AddRightArrowCell(@"选择图片与视频", nil);
    cell4.Jh_jumpClassName = [FormDemo5VC class];
    cell4.Jh_tipInfo = @"demo5";
    
    JhFormCellModel *cell5 = JhFormCellModel_AddRightArrowCell(@"单选、多选按钮", nil);
    cell5.Jh_jumpClassName = [FormDemo6VC class];
    cell5.Jh_tipInfo = @"demo6";
    
    JhFormCellModel *cell6 = JhFormCellModel_AddRightArrowCell(@"自定义view和头尾设置", nil);
    cell6.Jh_jumpClassName = [FormDemo7VC class];
    cell6.Jh_tipInfo = @"demo7";
    
    JhFormCellModel *cell7 = JhFormCellModel_AddRightArrowCell(@"cell文字居中", nil);
    cell7.Jh_jumpClassName = [FormDemo8VC class];
    cell7.Jh_tipInfo = @"demo8";
    
    JhFormCellModel *cell8 = JhFormCellModel_AddRightArrowCell(@"快速实现设置页面", nil);
    cell8.Jh_jumpClassName = [FormDemo9VC class];
    cell8.Jh_tipInfo = @"demo9";
    
    JhFormCellModel *cell9 = JhFormCellModel_AddRightArrowCell(@"自定义xibCell与model", nil);
    cell9.Jh_jumpClassName = [FormDemo10VC class];
    cell9.Jh_tipInfo = @"demo10";
    

//    JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"默认表单", nil);
//    cell0.Jh_jumpClassName = [FormDemo1VC class];
////    cell0.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
////        FormDemo1VC *jumpVC= [[FormDemo1VC alloc]init];
////        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
////    };
//
//    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"左侧标题为空", nil);
//    cell1.Jh_jumpClassName = [FormDemo1VC class];
//
////    cell1.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
////        FormDemo2VC *jumpVC= [[FormDemo2VC alloc]init];
////        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
////    };
//
//    JhFormCellModel *cell2 = JhFormCellModel_AddRightArrowCell(@"录入样式", nil);
//    cell2.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo3VC *jumpVC= [[FormDemo3VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell3 = JhFormCellModel_AddRightArrowCell(@"Switch按钮和选择样式", nil);
//    cell3.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo4VC *jumpVC= [[FormDemo4VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell4 = JhFormCellModel_AddRightArrowCell(@"选择图片与视频", nil);
//    cell4.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo5VC *jumpVC= [[FormDemo5VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell5 = JhFormCellModel_AddRightArrowCell(@"单选、多选按钮", nil);
//    cell5.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo6VC *jumpVC= [[FormDemo6VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell6 = JhFormCellModel_AddRightArrowCell(@"自定义view", nil);
//    cell6.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo7VC *jumpVC= [[FormDemo7VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell7 = JhFormCellModel_AddRightArrowCell(@"cell文字居中", nil);
//    cell7.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo8VC *jumpVC= [[FormDemo8VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };
//
//    JhFormCellModel *cell8 = JhFormCellModel_AddRightArrowCell(@"快速实现设置页面", nil);
//    cell8.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo9VC *jumpVC= [[FormDemo9VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };


//
//    JhFormCellModel *cell10 = JhFormCellModel_AddRightArrowCell(@"快速实现设置页面", nil);
//    cell10.Jh_cellSelectBlock = ^(JhFormCellModel *cellModel) {
//        FormDemo10VC *jumpVC= [[FormDemo10VC alloc]init];
//        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
//    };

    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9]];
    
    JhFormSectionModel *section0= JhSectionModel_Add(cellArr0);

    [self Jh_addSectionModel:section0];
    
    self.Jh_leftTitleWidth =300;
    
    //隐藏默认的footerView
    self.Jh_hiddenDefaultFooterView = YES;
    
    self.Jh_formCellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
      ViewController *jumpVC = [[cellModel.Jh_jumpClassName alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };

}

@end
