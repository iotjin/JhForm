//
//  FormDemo6VC.m
//  JhForm
//
//  Created by Jh on 2019/9/10.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo6VC.h"

#ifdef DEBUG
#define JhLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[[NSString alloc] initWithData:[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] dataUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding] UTF8String]);
#else
#define JhLog(...)
#endif


@interface FormDemo6VC ()

@end

@implementation FormDemo6VC

-(void)dealloc{
    NSLog(@" FormDemo6VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo6 - 单选、多选按钮";
    [self configFormModel];
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    JhWeakSelf
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    //单选一个选项，必填，默认样式
    JhFormCellModel *cell0 = JhFormCellModel_AddSelectBtnCell(@"单选1选项", YES, NO);
    cell0.Jh_selectBtnCell_btnTitleArr = @[@"选项一"];
    cell0.Jh_leftImgName = @"ic_emotions";
    
    //单选，2个选项
    JhFormCellModel *cell1 = JhFormCellModel_AddSelectBtnCell(@"单选2选项", YES, YES);
    cell1.Jh_selectBtnCell_btnTitleArr = @[@"男",@"女"];
    cell1.Jh_selectBtnCell_btnHorizontalMargin = 40;
    cell1.Jh_selectBtnCellClickBlock = ^(NSString * _Nonnull selectText, NSInteger selectIndex) {
        NSLog(@" selectText %@ ",selectText);
        NSLog(@" selectIndex %zd ",selectIndex);
    };
    
    //单选，3个选项，设置图标
    JhFormCellModel *cell2 = JhFormCellModel_AddSelectBtnCell(@"单选3选项", YES, YES);
    cell2.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
    cell2.Jh_selectBtnCell_unSelectIcon=Jh_Icon_CheckBoxNormal;
    cell2.Jh_selectBtnCell_selectIcon=Jh_Icon_CheckBoxSelect;
    
    //单选，多个选项，设置一些间距
    JhFormCellModel *cell3 = JhFormCellModel_AddSelectBtnCell(@"单选多选项", YES, YES);
    cell3.Jh_selectBtnCell_btnHorizontalMargin =60;
    cell3.Jh_selectBtnCell_btnVerticalMargin =30;
    cell3.Jh_cellTextVerticalCenter =YES;
    cell3.Jh_selectBtnCell_btnTitleArr = @[@"春",@"夏",@"秋",@"冬"];
    cell3.Jh_selectBtnCell_selectTitleArr = @[@"秋"];
    cell3.Jh_selectBtnCell_isUseBlackSelectIcon = YES;
    
    //单选，不可编辑，设置一个选项一行
    JhFormCellModel *cell4 = JhFormCellModel_AddSelectBtnCell(@"不可编辑", NO, NO);
    cell4.Jh_selectBtnCell_btnTitleArr = @[@"选项一",@"选项二",@"选项三"];
    cell4.Jh_cellNotEdit = YES;
    cell4.Jh_selectBtnCell_selectTitleArr = @[@"选项二"];
    cell4.Jh_selectBtnCell_isSingleLineDisplay = YES;
    cell4.Jh_cellTextVerticalCenter =YES;
    
    //单选，设置上标题下选项，一个选项一行
    JhFormCellModel *cell5 = JhFormCellModel_AddSelectBtnCell(@"单选，一选项一行：", YES, YES);
    cell5.Jh_selectBtnCell_btnIconSpace = 40;
    cell5.Jh_selectBtnCell_btnTitleArr = @[@"2020年1月-3月",@"2020年4月-6月",@"2020年7月-9月"];
    cell5.Jh_selectBtnCell_isSingleLineDisplay = YES;
    cell5.Jh_selectBtnCell_isTopTitleBottomOption = YES;
    
    //多选，2个选项
    JhFormCellModel *cell6 = JhFormCellModel_AddSelectBtnCell(@"多选2选项", YES, YES);
    cell6.Jh_selectBtnCell_isMultiSelect=YES;
    cell6.Jh_selectBtnCell_btnTitleArr = @[@"选项一",@"选项二"];
    //多选，3个选项
    JhFormCellModel *cell7 = JhFormCellModel_AddSelectBtnCell(@"多选3选项", YES, YES);
    cell7.Jh_selectBtnCell_isMultiSelect=YES;
    cell7.Jh_selectBtnCell_btnTitleArr = @[@"上午",@"下午",@"晚上"];
    cell7.Jh_selectBtnCell_selectTitleArr = @[@"晚上"];
    
    //多选，多个选项，设置图标颜色
    JhFormCellModel *cell8 = JhFormCellModel_AddSelectBtnCell(@"多选多选项", YES, YES);
    cell8.Jh_selectBtnCell_isMultiSelect=YES;
    cell8.Jh_selectBtnCell_btnTitleArr = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",];
    cell8.Jh_selectBtnCell_btnUnSelectIconColor = [UIColor blueColor];
    cell8.Jh_selectBtnCell_btnSelectIconColor = [UIColor redColor];
    cell8.Jh_selectBtnCell_selectTitleArr = @[@"星期二",@"星期三",@"星期四"];
    
    
    JhFormCellModel *cell9 = JhFormCellModel_AddSelectBtnCell(@"其它", YES, YES);
    NSArray *arr = @[@"希望是本无所谓有",@"无所谓无的",@"这正如地上的路",@"其实地上本没有路",@"走的人多了",@"也便成了路",@"抱歉！",@"我是周树人，我为自己代言"];
    cell9.Jh_selectBtnCell_btnTitleArr = arr;
    cell9.Jh_selectBtnCell_isMultiSelect =YES;
    cell9.Jh_selectBtnCell_hiddenLeftIcon =YES;
    cell9.Jh_selectBtnCell_btnBgColor = [UIColor orangeColor];
    cell9.Jh_selectBtnCell_btnSelectBgColor = [UIColor redColor];
    cell9.Jh_selectBtnCell_btnTitleColor = [UIColor whiteColor];
    cell9.Jh_selectBtnCell_btnTitleSelectColor = [UIColor yellowColor];
    cell9.Jh_selectBtnCell_btnCornerRadius = 10;
    cell9.Jh_selectBtnCell_btnBorderWidth = 1;
    cell9.Jh_selectBtnCell_btnBorderColor = [UIColor purpleColor];
    
    [cellModelArr addObjectsFromArray: @[cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self Jh_addSectionModel:section0];
    
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        
        NSLog(@" 单选1选项---------------------------------- ");
        JhLog(@" cell0 - selectIndexArr%@ -- selectTitleArr%@ ",cell0.Jh_selectBtnCell_selectIndexArr,cell0.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 单选2选项---------------------------------- ");
        JhLog(@" cell2 - selectIndexArr%@ -- selectTitleArr%@ ",cell1.Jh_selectBtnCell_selectIndexArr,cell1.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 单选3选项---------------------------------- ");
        JhLog(@" cell3 - selectIndexArr%@ -- selectTitleArr%@ ",cell2.Jh_selectBtnCell_selectIndexArr,cell2.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 单选多选项---------------------------------- ");
        JhLog(@" cell3 - selectIndexArr%@ -- selectTitleArr%@ ",cell3.Jh_selectBtnCell_selectIndexArr,cell3.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 不可编辑---------------------------------- ");
        JhLog(@" cell4 - selectIndexArr%@ -- selectTitleArr%@ ",cell4.Jh_selectBtnCell_selectIndexArr,cell4.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 单选，一选项一行：---------------------------------- ");
        JhLog(@" cell5 - selectIndexArr%@ -- selectTitleArr%@ ",cell5.Jh_selectBtnCell_selectIndexArr,cell5.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 多选2选项---------------------------------- ");
        JhLog(@" cell6 - selectIndexArr%@ -- selectTitleArr%@ ",cell6.Jh_selectBtnCell_selectIndexArr,cell6.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 多选3选项---------------------------------- ");
        JhLog(@" cell7 - selectIndexArr%@ -- selectTitleArr%@ ",cell7.Jh_selectBtnCell_selectIndexArr,cell7.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 多选多选项---------------------------------- ");
        JhLog(@" cell8 - selectIndexArr%@ -- selectTitleArr%@ ",cell8.Jh_selectBtnCell_selectIndexArr,cell8.Jh_selectBtnCell_selectTitleArr);
        NSLog(@" 其它---------------------------------- ");
        JhLog(@" cell9 - selectIndexArr%@ -- selectTitleArr%@ ",cell9.Jh_selectBtnCell_selectIndexArr,cell9.Jh_selectBtnCell_selectTitleArr);
        
        [weakSelf SubmitRequest];
    };
    
};


#pragma mark - SubmitRequest
-(void)SubmitRequest{
    
}

@end
