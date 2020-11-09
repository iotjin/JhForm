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
    
}


#pragma mark - initModel
-(void)initModel{
    
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"默认表单", nil);
    cell0.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo1VC *jumpVC= [[FormDemo1VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"自定义view表单", nil);
    cell1.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo2VC *jumpVC= [[FormDemo2VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell2 = JhFormCellModel_AddRightArrowCell(@"密码样式", nil);
    cell2.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo3VC *jumpVC= [[FormDemo3VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell3 = JhFormCellModel_AddRightArrowCell(@"完全自定义Cell", nil);
    cell3.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo4VC *jumpVC= [[FormDemo4VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell5 = JhFormCellModel_AddRightArrowCell(@"inputCell最右侧添加自定义View,title换行处理", nil);

    cell5.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo5VC *jumpVC= [[FormDemo5VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell6 = JhFormCellModel_AddRightArrowCell(@"左侧标题为空样式", nil);
    cell6.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo6VC *jumpVC= [[FormDemo6VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell7 = JhFormCellModel_AddRightArrowCell(@"设置标题颜色", nil);
    cell7.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo7VC *jumpVC= [[FormDemo7VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell8 = JhFormCellModel_AddRightArrowCell(@"cell文字居中", nil);
    cell8.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo8VC *jumpVC= [[FormDemo8VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell9 = JhFormCellModel_AddRightArrowCell(@"单选、多选按钮", nil);
    cell9.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo9VC *jumpVC= [[FormDemo9VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    JhFormCellModel *cell10 = JhFormCellModel_AddRightArrowCell(@"设置样式", nil);
    cell10.Jh_CellSelectCellBlock = ^(JhFormCellModel *cellModel) {
        FormDemo10VC *jumpVC= [[FormDemo10VC alloc]init];
        [weakSelf.navigationController pushViewController:jumpVC animated:YES];
    };
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell5,cell6,cell7,cell8,cell9,cell10]];
    
    JhFormSectionModel *section0= JhSectionModel_Add(cellArr0);
    
    [self.Jh_formModelArr addObject:section0];
    
    
    self.Jh_leftTitleWidth =300;

    //隐藏默认的footerView
    self.Jh_hiddenDefaultFooterView = YES;
    
}

@end
