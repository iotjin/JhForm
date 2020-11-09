//
//  FormDemo10VC.m
//  JhForm
//
//  Created by Jh on 2020/11/6.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "FormDemo10VC.h"
#import "Masonry.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo10VC ()

@end

@implementation FormDemo10VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configFormModel];
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    UIColor * bgColor = JhGrayColor(240);
    
    if (@available(iOS 13.0, *)) {
        UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return JhGrayColor(240);
            } else {
                return JhGrayColor(17);
            }
        }];
        bgColor = dyColor;
    }
    
    self.Jh_navTitle = @"设置样式";
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddRightArrowCell(@"支付", @"");
    cell0.Jh_leftImgName = @"ic_wallet";
    cell0.Jh_leftImgWH = 30;
    cell0.Jh_hiddenLine = YES;
    cell0.Jh_leftImgRightMargin = 12;
    
    JhFormCellModel *cell1 = JhFormCellModel_AddRightArrowCell(@"收藏", @"");
    cell1.Jh_leftImgName = @"ic_collections";
    cell1.Jh_lineLeftMargin = 50;
    
    
    JhFormCellModel *cell_line = JhFormCellModel_AddCustumALLViewCell(10);
    cell_line.Jh_cellBgColor = bgColor;
    cell_line.Jh_hiddenLine = YES;
    
    JhFormCellModel *cell2 = JhFormCellModel_AddRightArrowCell(@"相册", @"");
    cell2.Jh_leftImgName = @"ic_album";
    cell2.Jh_lineLeftMargin = 50;
    
    JhFormCellModel *cell3 = JhFormCellModel_AddRightArrowCell(@"卡包", @"");
    cell3.Jh_leftImgName = @"ic_cards_wallet";
    cell3.Jh_lineLeftMargin = 50;
    
    JhFormCellModel *cell4 = JhFormCellModel_AddRightArrowCell(@"表情", @"");
    cell4.Jh_leftImgName = @"ic_emotions";
    cell4.Jh_lineLeftMargin = 0.1;
    cell4.Jh_hiddenLine = YES;
    
    JhFormCellModel *cell5 = JhFormCellModel_AddRightArrowCell(@"检查更新", @"有新版本");
    cell5.Jh_leftImgName = @"ic_settings";
    cell5.Jh_infoTextColor = [UIColor redColor];
    
    JhFormCellModel *cell6 = JhFormCellModel_AddRightArrowCell(@"自定义1", @"");
    cell6.Jh_leftImgName = @"ic_settings";
    cell6.Jh_rightViewWidth = 100;
    cell6.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = JhRandomColor;
        [RightView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    JhFormCellModel *cell7 = JhFormCellModel_AddRightArrowCell(@"自定义2", @"");
    cell7.Jh_leftImgName = @"ic_settings";
    cell7.Jh_rightViewWidth = kWidth - cell7.Jh_titleWidth;
    cell7.Jh_rightViewBlock = ^(UIView * _Nonnull RightView) {
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = JhRandomColor;
        [RightView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    
    CGFloat cellH = 55;
    cell0.Jh_defaultHeight=cellH;
    cell1.Jh_defaultHeight=cellH;
    cell2.Jh_defaultHeight=cellH;
    cell3.Jh_defaultHeight=cellH;
    cell4.Jh_defaultHeight=cellH;
    cell5.Jh_defaultHeight=cellH;
    cell6.Jh_defaultHeight=cellH;
    cell7.Jh_defaultHeight=cellH;
    
    [cellModelArr addObjectsFromArray: @[cell_line,cell0,cell_line,cell1,cell2,cell3,cell4,cell_line,cell5,cell6,cell7]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self.Jh_formModelArr addObject:section0];
    self.Jh_hiddenDefaultFooterView =YES;
    
    
}

@end
