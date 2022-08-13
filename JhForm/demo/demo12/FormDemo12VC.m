//
//  FormDemo12VC.m
//  JhForm
//
//  Created by Jh on 2021/3/30.
//  Copyright © 2021 Jh. All rights reserved.
//

#import "FormDemo12VC.h"
#import "DynamicView.h"

@interface FormDemo12VC ()

@property (nonatomic, strong) NSMutableArray *cellModelArr;
@property (nonatomic, assign) int  number;

@end

@implementation FormDemo12VC

- (void)dealloc{
    NSLog(@" FormDemo12VC - dealloc ");
}

- (NSMutableArray *)cellModelArr {
    if (!_cellModelArr) {
        _cellModelArr = [NSMutableArray array];
    }
    return _cellModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _number = 0;
    self.Jh_navTitle = @"Demo12 - 动态增减cell";
    [self configFormModel];
}

#pragma mark - configFormModel
- (void)configFormModel{
    
    JhWeakSelf
    JhFormCellModel *name = JhFormCellModel_AddInputCell(@"姓名:",@"", YES, UIKeyboardTypeDefault);
    name.Jh_placeholder = @"请输入姓名";
    __weak typeof(name) weakName = name;
    name.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputStates) {
        weakName.Jh_info_idStr = inputText;
    };
    
    JhFormCellModel *custumAdd = JhFormCellModel_AddRightArrowCell(@"", @"添加金额");
    custumAdd.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel) {
        [weakSelf AddMoneyCell];
    };
    
    [self.cellModelArr addObjectsFromArray: @[name,custumAdd]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(self.cellModelArr);
    
    [self Jh_addSectionModel:section0];
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkEmptyWithFormData:weakSelf.Jh_formModelArr success:^{
            [weakSelf SubmitRequest];
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
            //使用自己熟悉的弹框组件
            [weakSelf.view hx_showImageHUDText:error];
        }];
    };
};

- (void)AddMoneyCell {
    _number ++;
    
    JhWeakSelf
    DynamicView *bgView = [DynamicView Jh_viewFromXib];
    bgView.ClickNameBlock = ^{
        [weakSelf.view hx_showImageHUDText:@"点击选择"];
    };
    bgView.ClickDeleteBlock = ^(UIButton * _Nonnull button) {
        UITableViewCell * cell = (UITableViewCell*) [[[[[button superview] superview]superview]superview]superview];
        NSIndexPath *IndexPath0 = [weakSelf.Jh_formTableView indexPathForCell:cell];
        [weakSelf.cellModelArr removeObjectAtIndex:IndexPath0.row];
        [weakSelf.Jh_formTableView reloadData];
    };
    
    JhFormCellModel *money = JhFormCellModel_AddCustumRightCell(@"金额");
    money.Jh_cellIdentifier = [NSString stringWithFormat:@"%d",_number]; // 必须设置identifier
    money.Jh_info_idStr = [NSString stringWithFormat:@"金额%d",_number];
    money.Jh_cellHeight = 80;
    money.Jh_rightViewBlock = ^(UIView * _Nonnull rightView) {
        bgView.frame = CGRectMake(0, 0, rightView.Jh_width, rightView.Jh_height);
        [rightView addSubview:bgView];
    };
    
    __weak typeof(money) weakMoney = money;
    bgView.InputBlock = ^(NSString * _Nonnull value) {
        weakMoney.Jh_info_idStr = value;
    };
    
    [self.cellModelArr insertObject:money atIndex:self.cellModelArr.count-1];
    JhFormSectionModel *section0 = JhSectionModel_Add(self.cellModelArr);
    NSMutableArray *modelArr = [NSMutableArray array];
    [modelArr addObject:section0];
    self.Jh_formTableView.Jh_formModelArr = modelArr;
    
    [self.Jh_formTableView reloadData];
}

// 根据数据获取对应的值，返回数组
- (NSArray *)getValueWithFormData:(NSArray *)datas {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int section = 0; section < datas.count; section++) {
        JhFormSectionModel *sectionModel = datas[section];
        for (int row = 0; row < sectionModel.Jh_sectionModelArr.count; row++) {
            JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[row];
            if (cellModel.Jh_info_idStr.length > 0) {
                NSString *info = cellModel.Jh_info_idStr;
                [mArr addObject:info];
            }
        }
    }
    return mArr.mutableCopy;
}

#pragma mark - 提交请求
- (void)SubmitRequest {
    NSArray *arr = [self getValueWithFormData:self.Jh_formModelArr];
    NSLog(@" 录入的数据： %@ ",arr);
}

@end
