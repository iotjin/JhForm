//
//  FormDemo9VC.m
//  JhForm
//
//  Created by Jh on 2020/10/27.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "FormDemo9VC.h"

@interface FormDemo9VC ()

@end

@implementation FormDemo9VC

-(void)dealloc{
    NSLog(@" FormDemo9VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo9 - 快速实现设置页面";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    JhFormCellModel *cell_line = JhFormCellModel_AddCustumALLViewCell(10);
    cell_line.Jh_cellBgColor = JhBaseBgColor;
    cell_line.Jh_hiddenLine = YES;
    
    JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"支付", @"");
    cell0.Jh_leftImgName = @"ic_wallet";
    cell0.Jh_leftImgWH = 30;
    cell0.Jh_hiddenLine = YES;
    cell0.Jh_leftImgRightMargin = 12;
    cell0.Jh_rightBtnWidth = 60;
    cell0.Jh_rightBtnHeight = 20;
    cell0.Jh_rightBtnTitle = @"去开通";
    cell0.Jh_rightBtnTitleColor = [UIColor whiteColor];
    cell0.Jh_rightBtnBgColor = [UIColor redColor];
    cell0.Jh_rightBtnCornerRadius = 10;
    cell0.Jh_rightBtnTitleCenter = YES;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"收藏", @"");
    cell1.Jh_leftImgName = @"ic_collections";
    cell1.Jh_lineLeftMargin = 50;
    cell1.Jh_rightBtnWidth = 8;

    JhFormCellModel *cell2 = JhFormCellModel_AddRightArrowCell(@"相册", @"");
    cell2.Jh_leftImgName = @"ic_album";
    cell2.Jh_lineLeftMargin = 50;
    cell2.Jh_rightBtnImgName = @"lufei";
    cell2.Jh_rightBtnWidth = 35;
    cell2.Jh_rightBtnImgWH = 35;
    cell2.Jh_rightBtnHeight = 35;
    cell2.Jh_rightBtnCornerRadius = 17.5;
    
    JhFormCellModel *cell3 = JhFormCellModel_AddRightArrowCell(@"卡包", @"");
    cell3.Jh_leftImgName = @"ic_cards_wallet";
    cell3.Jh_lineLeftMargin = 50;
    cell3.Jh_rightBtnWidth = 8;
    cell3.Jh_rightBtnHeight = 8;
    cell3.Jh_rightBtnCornerRadius = 4;
    cell3.Jh_rightBtnBgColor = [UIColor redColor];
    
    JhFormCellModel *cell4 = JhFormCellModel_AddRightArrowCell(@"表情", @"");
    cell4.Jh_leftImgName = @"ic_emotions";
    cell4.Jh_lineLeftMargin = 0.1;
    cell4.Jh_hiddenLine = YES;
    cell4.Jh_rightBtnWidth = 90;
    cell4.Jh_rightBtnTitle = @"新表情";
    cell4.Jh_rightBtnImgName = @"ic_emotions";
    cell4.Jh_rightBtnImgWH = 20;
    cell4.Jh_rightBtnImgTextMargin = 3;
    
    JhFormCellModel *cell5 = JhFormCellModel_AddRightArrowCell(@"检查更新", @"有新版本");
    cell5.Jh_leftImgName = @"ic_settings";
    cell5.Jh_infoTextColor = [UIColor redColor];
    cell5.Jh_hiddenLine = YES;
    
    JhFormCellModel *cell6 = JhFormCellModel_AddRightArrowCell(@"清理占用空间", @"0.0M");
    JhFormCellModel *cell7 = JhFormCellModel_AddSwitchBtnCell(@"视频自动播放", YES);
    cell7.Jh_hiddenLine = YES;
    
    JhFormCellModel *cell8 = JhFormCellModel_AddRightArrowCell(@"指纹支付", @"已开启");
    cell8.Jh_tipInfo = @"开启后，可使用指纹快捷付款";
    cell8.Jh_cellTextVerticalCenter = YES;
    JhFormCellModel *cell9 = JhFormCellModel_AddSwitchBtnCell(@"允许非WiFi网络下载", YES);
    cell9.Jh_titleWidth = 160;
    cell9.Jh_tipInfo = @"请慎重选择开启，避免过度使用流量";

    JhFormCellModel *selectCell2 = JhFormCellModel_AddRightArrowCell(@"标题", @"");
    selectCell2.Jh_leftImgName = @"ic_collections";
    selectCell2.Jh_leftImgWH = 30;
    selectCell2.Jh_leftImgRightMargin = 12;
    selectCell2.Jh_tipInfo = @"这是提示文字";
    selectCell2.Jh_info = @"info";
    
    JhFormCellModel *switchBtn2 = JhFormCellModel_AddSwitchBtnCell(@"标题", NO);
    switchBtn2.Jh_leftImgName = @"ic_collections";
    switchBtn2.Jh_leftImgWH = 50;
    switchBtn2.Jh_leftImgRightMargin = 12;
    switchBtn2.Jh_tipInfo = @"这是提示文字";
    switchBtn2.Jh_hiddenLine = YES;
    
    //文本居中
    JhFormCellModel *centerText = JhFormCellModel_AddCenterTextCell(@"退出登录");
    centerText.Jh_cellHeight = 60;
    centerText.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf.view hx_showImageHUDText:@"点击了退出登录"];
    };
    
    CGFloat cellH = 55;
    cell0.Jh_cellHeight=cellH;
    cell1.Jh_cellHeight=cellH;
    cell2.Jh_cellHeight=cellH;
    cell3.Jh_cellHeight=cellH;
    cell4.Jh_cellHeight=cellH;
    cell5.Jh_cellHeight=cellH;
    
    [cellArr0 addObjectsFromArray: @[cell_line,cell0,cell_line,cell1,cell2,cell3,cell4,cell_line,cell5,cell_line,cell6,cell7,cell_line,cell8,cell9,selectCell2,switchBtn2,cell_line,centerText]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    self.Jh_hiddenDefaultFooterView =YES;
    
}


@end
