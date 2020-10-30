//
//  FormDemo4VC.m
//  JhForm
//
//  Created by Jh on 2019/7/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo4VC.h"
#import "JhBaseHeaderView.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo4VC ()

@end

@implementation FormDemo4VC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self configFormModel];
    
    
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    self.Jh_navTitle = @"完全自定义Cell";
    

    
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"cell颜色0", @"设置InputCell的背景颜色", NO, 0);
    cell0.Jh_editable = NO;
    cell0.Jh_cellBgColor = JhRandomColor;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddSelectCell(@"cell颜色1", @"设置SelectCell的背景颜色", NO);
    cell1.Jh_cellBgColor = JhRandomColor;
    
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"cell颜色2", @"不设置", NO, 0);
    
    JhFormCellModel *cell3 = JhFormCellModel_AddCustumALLViewCell(10);
    cell3.Jh_cellBgColor = JhRandomColor;
    
    JhFormCellModel *cell4 = JhFormCellModel_AddCustumALLViewCell(80);
    cell4.Jh_cellBgColor = JhRandomColor; //完全自定义样式的cell 只有高度和背景颜色可以设置
    cell4.Jh_custumALLViewBlock = ^(UIView * _Nonnull AllView) {
        AllView.backgroundColor =[UIColor yellowColor];
        
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor =JhRandomColor;
        label.text =@"这是一个可以完全自定义的cell";
        label.frame=CGRectMake(0, 30, kWidth-30, 20);
        [AllView addSubview:label];
        
    };
    
    JhFormCellModel *cell5 = JhFormCellModel_AddCustumALLViewCell(44);
    cell5.Jh_custumALLViewBlock = ^(UIView * _Nonnull AllView) {
        AllView.backgroundColor = JhRandomColor;
        
        JhBaseHeaderView *headerV = [[JhBaseHeaderView alloc] initWithFrame:CGRectMake(0, 7, kWidth-30, 30)];
        headerV.backgroundColor =JhRandomColor;
        headerV.Jh_leftTitle = @"这是一个自定义view";
        headerV.Jh_rightBtnTitle = @"右侧文字";
        [AllView addSubview:headerV];
  
    };
    
    
    [cellModelArr addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self.Jh_formModelArr addObject:section0];
    
    
    
    
};


#pragma mark - SubmitRequest
-(void)SubmitRequest{
    
    
    
}

@end
