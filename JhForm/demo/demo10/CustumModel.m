//
//  CustumModel.m
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "CustumModel.h"


@implementation CustumModel

-(CGFloat)cellHeight{
    if (_cellHeight) return _cellHeight;
    _cellHeight += 20+20+5;
    _cellHeight +=[NSString Jh_autoHeightWithString:_content width:(Jh_ScreenWidth-65-15) font:13];
    _cellHeight += 10;
    _cellHeight += 3;
    return _cellHeight;
}

+(JhFormSectionModel *)createSection0Data {
    NSMutableArray *cellArr0 = [NSMutableArray array];
    CustumModel *model = [[CustumModel alloc]init];
    model.name = @"张三";
    model.content = @"这是内容";
    
    //使用xib要设置为yes
    model.Jh_isXibCell = YES;
    //必须设置类名
    model.Jh_cellClassName = @"CustumCell";
    model.Jh_cellHeight = model.cellHeight;
    model.Jh_switchBtn_on = YES;
    model.Jh_switchBtnBlock = ^(BOOL switchBtn_on, UISwitch * _Nonnull switchBtn) {
        NSLog(@"开关状态： %@", switchBtn_on ? @"YES" : @"NO");
    };
    model.clickBtnBlock = ^(CustumModel * _Nonnull cellModel) {
        NSLog(@" 点击了： %@ ",cellModel.name);
    };
    [cellArr0 addObject:model];
    
    JhFormSectionModel *section = JhSectionModel_Add(cellArr0);
    section.Jh_headerTitle = @"第一组 - 单条数据";
    section.Jh_headerHeight = 44;
    return section;
}


+(JhFormSectionModel *)createSection1Data{
    //获取数据
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i=0; i< 50; i++) {
        NSMutableDictionary *dic =[NSMutableDictionary new];
        int x = arc4random() % 100;
        NSString *text = @"正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文";
        dic[@"name1"] = [NSString stringWithFormat:@"%@%d",@"姓名",i];
        dic[@"content1"] = [text substringToIndex:x];
        [mArr addObject:dic];
    }
    //转换
    NSMutableArray *cellArr0 = [NSMutableArray array];
    for (NSDictionary *dic in mArr) {
        CustumModel *model = [[CustumModel alloc]init];
        model.name = dic[@"name1"];
        model.content = dic[@"content1"];
        model.hiddenSwitchBtn = YES;
        model.clickBtnBlock = ^(CustumModel * _Nonnull cellModel) {
            NSLog(@" 点击了： %@ ",cellModel.name);
        };
        //使用xib要设置为yes
        model.Jh_isXibCell = YES;
        //必须设置类名
        model.Jh_cellClassName = @"CustumCell";
        model.Jh_cellHeight = model.cellHeight;
        [cellArr0 addObject:model];
    }
    JhFormSectionModel *section = JhSectionModel_Add(cellArr0);
    section.Jh_headerTitle = @"第二组 - 列表";
    section.Jh_headerHeight = 44;
    return section;
}

@end
