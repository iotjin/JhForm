//
//  FormDemo11VC.m
//  JhForm
//
//  Created by Jh on 2021/3/30.
//  Copyright © 2021 Jh. All rights reserved.
//

#import "FormDemo11VC.h"

@interface FormDemo11VC ()

@end

@implementation FormDemo11VC

-(void)dealloc{
    NSLog(@" FormDemo11VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo11 - 主题切换";
    self.Jh_navRightTitle = @"文字";
    [self configFormModel];
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    NSUserDefaults *user= [NSUserDefaults standardUserDefaults];
    NSInteger index = [[user objectForKey:@"kCurrentTheme"] integerValue];
    self.Jh_themeType = index;
    
    JhWeakSelf
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    NSArray *themeArr = @[@"跟随系统",@"浅色模式",@"深色模式"];
    JhFormCellModel *cell0 = JhFormCellModel_AddSelectBtnCell(@"主题", NO, NO);
    cell0.Jh_selectBtnCell_btnTitleArr = themeArr;
    cell0.Jh_selectBtnCell_selectTitleArr = @[themeArr[index]];
    cell0.Jh_selectBtnCell_isSingleLineDisplay = YES;
    cell0.Jh_cellTextVerticalCenter =YES;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@".", @"返回主页面或demo1查看效果", NO, 0);
    cell1.Jh_cellNotEdit= YES;
    
    [cellModelArr addObjectsFromArray: @[cell0,cell1]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self Jh_addSectionModel:section0];
    self.Jh_hiddenDefaultFooterView = YES;
    
    //点击按钮切换主题，就按照const中的Jh_ThemeType = JhThemeTypeAuto ，做主题切换处理
    cell0.Jh_selectBtnCellClickBlock = ^(NSString * _Nonnull selectText, NSInteger selectIndex) {
        NSLog(@" selectText %@ ",selectText);
        NSLog(@" selectIndex %zd ",selectIndex);
        
        if (selectIndex == 0) {
            weakSelf.Jh_themeType = JhThemeTypeAuto;
        }
        if (selectIndex == 1) {
            weakSelf.Jh_themeType = JhThemeTypeLight;
        }
        if (selectIndex == 2) {
            weakSelf.Jh_themeType = JhThemeTypeDark;
        }
        weakSelf.Jh_navRightTitle = @"文字";
        
        //更新主题，只在ViewController和demo1两个页面做了处理
        [weakSelf updateNavColor];
        [weakSelf updateStatusBar];
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:@(selectIndex) forKey:@"kCurrentTheme"];
        [user synchronize];
    };
};

-(void)updateNavColor {
    UIColor *navBgColor = JhBaseNavBgColor;
    UIColor *navTitleColor = JhBaseNavTitleColor;
    self.navigationController.navigationBar.barTintColor = navBgColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:navTitleColor};
}

//状态栏切换先设置 info View controller-based status bar appearance 为 NO
- (void)updateStatusBar {
    if (Jh_IOS13_Later) {
        if (self.Jh_themeType == JhThemeTypeAuto) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
        if (self.Jh_themeType == JhThemeTypeLight) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        }
        if (self.Jh_themeType == JhThemeTypeDark) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        }
    }
}

@end
