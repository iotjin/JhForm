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
    
    [cellArr0 addObjectsFromArray: @[cell0,cell1,cell2,cell3]];
    
    JhFormSectionModel *section0= JhSectionModel_Add(cellArr0);
    
    [self.Jh_formModelArr addObject:section0];
    

    //隐藏默认的footerView
    self.Jh_hiddenDefaultFooterView = YES;
    
}

@end
