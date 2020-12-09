//
//  FormDemo10VC.m
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "FormDemo10VC.h"
#import "CustumModel.h"

@interface FormDemo10VC ()

@end

@implementation FormDemo10VC

-(void)dealloc{
    NSLog(@" FormDemo10VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo10 - 自定义xibCell与model";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhFormSectionModel *section0 = [CustumModel createSection0Data];
    JhFormSectionModel *section1 = [CustumModel createSection1Data];

    [self Jh_addSectionModel:section0];
    [self Jh_addSectionModel:section1];
    
    self.Jh_formTableView.showsVerticalScrollIndicator = YES;
    self.Jh_hiddenDefaultFooterView = YES;
    
    JhWeakSelf
    self.Jh_formCellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        [weakSelf.Jh_formTableView deselectRowAtIndexPath:indexPath animated:YES];
        CustumModel *model = (CustumModel *)cellModel;
        [weakSelf.view hx_showImageHUDText:model.name];
    };
}

@end
