//
//  FormDemo7VC.m
//  JhForm
//
//  Created by Jh on 2019/9/30.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo7VC.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@implementation FormDemo7VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"设置title字体颜色";
    [self initializeForm];
}

- (void)initializeForm {
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"设置标题颜色0", @"", YES, 0);
    cell0.Jh_titleTextColor = JhRandomColor;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"设置标题颜色1", @"", YES, 0);
    
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc]initWithString:@"*设置标题颜色11" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor orangeColor]}];
    [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, @"*设置标题颜色11".length)];
    cell1.Jh_attributedTitle = attributedTitle;
    
    JhFormCellModel *cell2 = JhFormCellModel_AddPwdInputCell(@"设置标题颜色2", @"", YES);
    cell2.Jh_placeholder = @"PwdInputCell(请输入密码)";
    cell2.Jh_titleTextColor = JhRandomColor;
    
    JhFormCellModel *cell3 = JhFormCellModel_AddSelectCell(@"设置标题颜色3", @"", YES);
    cell3.Jh_placeholder = @"请选择";
    cell3.Jh_titleTextColor = JhRandomColor;
    
    JhFormCellModel *cell4 = JhFormCellModel_AddSelectCell(@"隐藏箭头", @"", YES);
    cell4.Jh_hiddenArrow =YES;
    
    NSArray *cells = @[cell0,cell1,cell2,cell3,cell4];
    JhFormSectionModel *section0 = JhSectionModel_Add(cells);
    [self.Jh_formModelArr addObject:section0];
    
    self.Jh_useLightTheme = YES;
}

@end
