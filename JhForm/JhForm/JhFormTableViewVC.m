//
//  JhFormTableViewVC.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTableViewVC.h"
#import "UIBarButtonItem+JhForm.h"
#import "JhFormCellModel.h"
#import "JhFormSectionModel.h"
#import "JhFormInputCell.h"
#import "JhFormSelectCell.h"
#import "JhFormTextViewInputCell.h"
#import "JhFormCustumRightCell.h"
#import "JhFormCustumBottomCell.h"
#import "JhFormSelectImageCell.h"
#import "JhFormSwitchBtnCell.h"
#import "JhFormCenterTextCell.h"
#import "JhFormPwdCell.h"
#import "JhFormCustumALLViewCell.h"
#import "JhFormSelectBtnCell.h"

@interface JhFormTableViewVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *footerView;
@end

@implementation JhFormTableViewVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.Jh_formTableView];
    [self Jh_configureIOS11];
    [self Jh_configureIOS13Theme];
}

- (void)Jh_configureIOS11 {
    /// 适配 iOS 11.0, iOS11 以后，控制器的 automaticallyAdjustsScrollViewInsets 已经废弃，所以默认就会是 YES
    /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
    if (@available(iOS 11.0, *)) {
        _Jh_formTableView.estimatedRowHeight = 0;
        _Jh_formTableView.estimatedSectionHeaderHeight = 0;
        _Jh_formTableView.estimatedSectionFooterHeight = 0;
        // 防止列表/页面偏移
        _Jh_formTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
}

#pragma mark - Custom Accessors

- (UITableView *)Jh_formTableView {
    if (!_Jh_formTableView) {
        _Jh_formTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Jh_NAV_HEIGHT, Jh_SCRREN_WIDTH, Jh_SCREEN_HEIGHT-Jh_NAV_HEIGHT-Jh_BOTTOM_SAFE_HEIGHT)];
        _Jh_formTableView.backgroundColor = BaseBgWhiteColor;
        _Jh_formTableView.showsVerticalScrollIndicator = NO;
        _Jh_formTableView.showsHorizontalScrollIndicator = NO;
        _Jh_formTableView.dataSource = self;
        _Jh_formTableView.delegate = self;
        _Jh_formTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CGFLOAT_MIN)];
        _Jh_formTableView.tableFooterView = self.footerView;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        // 加上这句不会影响你 tableview 上的 action (button,cell selected...)
        singleTap.cancelsTouchesInView = NO;
        [_Jh_formTableView addGestureRecognizer:singleTap];
    }
    return _Jh_formTableView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Jh_SCRREN_WIDTH, Jh_SubmitBtn_Height + Jh_SubmitBtn_TBSpace*2)];
        _footerView.backgroundColor = [UIColor clearColor];
        
        // 提交按钮
        UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        submitButton.frame = CGRectMake(Jh_SubmitBtn_LRSpace, Jh_SubmitBtn_TBSpace, _footerView.bounds.size.width - Jh_SubmitBtn_LRSpace*2, Jh_SubmitBtn_Height);
        submitButton.backgroundColor = BaseThemeColor;
        [submitButton setTitle:Jh_SubmitBtn_Text forState:UIControlStateNormal];
        [submitButton setTitleColor:Jh_SubmitBtn_TextColor forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:Jh_SubmitBtn_TextFontSize];
        submitButton.layer.cornerRadius = Jh_SubmitBtn_CornerRadius;
        [submitButton addTarget:self action:@selector(submitButtonDidClickedAction:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:submitButton];
        
        self.Jh_submitBtn = submitButton;
    }
    return _footerView;
}

- (NSMutableArray *)Jh_formModelArr {
    if (!_Jh_formModelArr) {
        _Jh_formModelArr = [NSMutableArray array];
    }
    return _Jh_formModelArr;
}

- (void)setJh_navTitle:(NSString *)Jh_navTitle {
    _Jh_navTitle = Jh_navTitle;
    self.navigationItem.title =Jh_navTitle;
}

- (void)setJh_navRightTitle:(NSString *)Jh_navRightTitle {
    _Jh_navRightTitle = Jh_navRightTitle;
    if (Jh_navRightTitle.length) {
        UIColor *color;
        if (@available(iOS 13.0, *)) {
            color = UIColor.labelColor;
        } else {
            color = UIColor.blackColor;
        }
        UIBarButtonItem *rightBarButton = [UIBarButtonItem itemWithTitle:Jh_navRightTitle titleColor:color target:self action:@selector(ClickRightItem)];
        self.navigationItem.rightBarButtonItem = rightBarButton;
    }
}

- (void)setJh_navRightImage:(NSString *)Jh_navRightImage {
    _Jh_navRightImage = Jh_navRightImage;
    if (Jh_navRightImage.length) {
        UIBarButtonItem *rightBarButton = [UIBarButtonItem itemWithImage:Jh_navRightImage highImage:Jh_navRightImage target:self action:@selector(ClickRightItem)];
        self.navigationItem.rightBarButtonItem = rightBarButton;
    }
}

- (void)setJh_submitStr:(NSString *)Jh_submitStr {
    _Jh_submitStr = Jh_submitStr;
    [self.Jh_submitBtn setTitle:Jh_submitStr forState:UIControlStateNormal];
}

- (void)setJh_submitBtnBgColor:(UIColor *)Jh_submitBtnBgColor {
    _Jh_submitBtnBgColor = Jh_submitBtnBgColor;
    self.Jh_submitBtn.backgroundColor = Jh_submitBtnBgColor;
}

- (void)setJh_submitBtnTBSpace:(CGFloat)Jh_submitBtnTBSpace {
    _Jh_submitBtnTBSpace = Jh_submitBtnTBSpace;
    self.Jh_submitBtn.hx_y = Jh_submitBtnTBSpace;
    if (self.Jh_submitBtnHeight) {
        self.footerView.hx_h = self.Jh_submitBtnHeight + Jh_submitBtnTBSpace*2;
    } else {
        self.footerView.hx_h = Jh_SubmitBtn_Height + Jh_submitBtnTBSpace*2;
    }
}

- (void)setJh_submitBtnLRSpace:(CGFloat)Jh_submitBtnLRSpace {
    _Jh_submitBtnLRSpace = Jh_submitBtnLRSpace;
    self.Jh_submitBtn.hx_x = Jh_submitBtnLRSpace;
    self.Jh_submitBtn.hx_w = self.footerView.bounds.size.width - Jh_submitBtnLRSpace*2;
}

- (void)setJh_submitBtnCornerRadius:(CGFloat)Jh_submitBtnCornerRadius {
    _Jh_submitBtnCornerRadius = Jh_submitBtnCornerRadius;
    self.Jh_submitBtn.layer.cornerRadius = Jh_submitBtnCornerRadius;
}

- (void)setJh_submitBtnHeight:(CGFloat)Jh_submitBtnHeight {
    _Jh_submitBtnHeight = Jh_submitBtnHeight;
    self.Jh_submitBtn.hx_h = Jh_submitBtnHeight;
    if (self.Jh_submitBtnTBSpace > 0) {
        self.footerView.hx_h = Jh_submitBtnHeight + self.Jh_submitBtnTBSpace*2;
    }else{
        self.footerView.hx_h = Jh_submitBtnHeight + Jh_SubmitBtn_TBSpace*2;
    }
}

- (void)setJh_submitBtnTextFontSize:(CGFloat)Jh_submitBtnTextFontSize {
    _Jh_submitBtnTextFontSize = Jh_submitBtnTextFontSize;
    self.Jh_submitBtn.titleLabel.font = [UIFont systemFontOfSize:Jh_submitBtnTextFontSize];
}

- (void)setJh_submitBtnTextColor:(UIColor *)Jh_submitBtnTextColor {
    _Jh_submitBtnTextColor = Jh_submitBtnTextColor;
    [self.Jh_submitBtn setTitleColor:Jh_submitBtnTextColor forState:UIControlStateNormal];
}

- (void)setJh_hiddenDefaultFooterView:(BOOL)Jh_hiddenDefaultFooterView {
    _Jh_hiddenDefaultFooterView = Jh_hiddenDefaultFooterView;
    self.footerView.hidden = Jh_hiddenDefaultFooterView;
}

#pragma mark - Actions

// 导航栏右侧按钮点击事件
- (void)ClickRightItem {
    if (self.Jh_clickNavRightItemBlock) {
        self.Jh_clickNavRightItemBlock();
    }
}

// 提交按钮点击事件
- (void)submitButtonDidClickedAction:(UIButton *)sender {
    if (self.Jh_formSubmitBlock) {
        self.Jh_formSubmitBlock();
    }
}

// 单击触摸手势点击事件
- (void)tapClick:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES]; // 收起键盘
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.Jh_formModelArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSParameterAssert([self.Jh_formModelArr[section] isKindOfClass:JhFormSectionModel.class]);
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    return sectionModel.Jh_sectionModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    NSParameterAssert([sectionModel.Jh_sectionModelArr[indexPath.row] isKindOfClass:JhFormCellModel.class]);
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    
    CGFloat LeftTitleWidth = (self.Jh_leftTitleWidth ? : Jh_TitleWidth);
    
    if (self.Jh_leftTitleHiddenRedStar) {
        cellModel.Jh_titleHiddenRedStar = YES;
    }
    
    if (self.Jh_useLightTheme) {
        if(@available(iOS 13.0,*)) {
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    }
    
    // 表单条目类别判断
    __weak typeof(self) weakSelf = self;
    if (cellModel.Jh_cellType == JhFormCellTypeTextViewInput) {
        NSString *cell_id = [NSString stringWithFormat:@"textViewInput_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormTextViewInputCell *cell = [tableView textViewInputCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        cell.textViewInputCompletion = ^(NSString *text) {
            [weakSelf updateTextViewInputWithText:text indexPath:indexPath];
        };
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeSelect) {
        NSString *cell_id = [NSString stringWithFormat:@"select_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormSelectCell *cell = [tableView selectCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeCustumRight) {
        NSString *cell_id = [NSString stringWithFormat:@"custumRight_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormCustumRightCell *cell = [tableView CustumRightCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        if (cellModel.Jh_custumRightViewBlock) {
            cellModel.Jh_custumRightViewBlock(cell.custumRightView);
        }
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeCustumBottom) {
        NSString *cell_id = [NSString stringWithFormat:@"custumBottom_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormCustumBottomCell *cell = [tableView CustumBottomCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        if (cellModel.Jh_custumBottomViewBlock) {
            cellModel.Jh_custumBottomViewBlock(cell.CustumBottomView);
        }
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeSelectImage) {
        NSString *cell_id = [NSString stringWithFormat:@"selectImage_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormSelectImageCell *cell = [tableView SelectImageCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        cell.JhImageSelectBlock = ^(NSArray *imageArr) {
            [weakSelf updateImageWithImages:imageArr indexPath:indexPath];
        };
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeRightSwitchBtn) {
        NSString *cell_id = [NSString stringWithFormat:@"SwitchBtn_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormSwitchBtnCell *cell = [tableView SwitchBtnCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeCenterTextCell) {
        NSString *cell_id = [NSString stringWithFormat:@"CenterText_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormCenterTextCell *cell = [tableView CenterTextWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypePwdInput) {
        NSString *cell_id = [NSString stringWithFormat:@"PwdInput_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormPwdCell *cell = [tableView PwdCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        cell.Jh_pwdInputCompletion = ^(NSString *text) {
            [weakSelf updatePwdInputWithText:text indexPath:indexPath];
        };
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeCustumALLView) {
        NSString *cell_id = [NSString stringWithFormat:@"CustumALLView_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormCustumALLViewCell *cell = [tableView CustumALLCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        if (cellModel.Jh_custumALLViewBlock) {
            cellModel.Jh_custumALLViewBlock(cell.custumALLView);
        }
        return cell;
    } else if (cellModel.Jh_cellType == JhFormCellTypeSelectBtn) {
        NSString *cell_id = [NSString stringWithFormat:@"SelectBtn_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormSelectBtnCell *cell = [tableView SelectBtnCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        return cell;
    } else {
        NSString *cell_id = [NSString stringWithFormat:@"input_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        JhFormInputCell *cell = [tableView inputCellWithId:cell_id];
        cell.data = cellModel;
        cell.data.Jh_titleWidth = LeftTitleWidth;
        cell.inputCompletion = ^(NSString *text) {
            [weakSelf updateInputWithText:text indexPath:indexPath];
        };
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    
    if (cellModel.Jh_cellType  == JhFormCellTypeTextViewInput) {
        return [JhFormTextViewInputCell heightWithCellModelData:cellModel];
    } else if (cellModel.Jh_cellType  == JhFormCellTypeSelect) {
        return [JhFormSelectCell heightWithCellModelData:cellModel];
    } else if (cellModel.Jh_cellType  == JhFormCellTypeCustumALLView || cellModel.Jh_cellType  == JhFormCellTypePwdInput) {
        return cellModel.Jh_defaultHeight;
    } else if (cellModel.Jh_cellType  == JhFormCellTypeSelectImage) {
        return [JhFormSelectImageCell heightWithCellModelData:cellModel];
    } else if (cellModel.Jh_cellType  == JhFormCellTypeSelectBtn) {
        return [JhFormSelectBtnCell heightWithCellModelData:cellModel];
    } else {
        return [JhFormInputCell heightWithCellModelData:cellModel];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    
    if (cellModel.Jh_cellType == JhFormCellTypeSelect && cellModel.Jh_CellSelectCellBlock) {
        cellModel.Jh_CellSelectCellBlock(cellModel);
    }
    
    if(cellModel.Jh_cellType == JhFormCellTypeCenterTextCell && cellModel.JhCellClickCenterTextBlock){
        cellModel.JhCellClickCenterTextBlock();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    return (sectionModel.Jh_headerHeight > 0 ? sectionModel.Jh_headerHeight : 0.01);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    return (sectionModel.Jh_footerHeight > 0 ? sectionModel.Jh_footerHeight : 0.01);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionModel.Jh_headerHeight)];
    return (sectionModel.Jh_headerView ? sectionModel.Jh_headerView : headerView);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionModel.Jh_footerHeight)];
    return (sectionModel.Jh_footerView ? sectionModel.Jh_footerView : footerView);
}

#pragma mark -- 表单条目响应block处理

- (void)updateInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    cellModel.Jh_info = text;
}

- (void)updateTextViewInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    cellModel.Jh_info = text;
}

- (void)updateImageWithImages:(NSArray *)images indexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    cellModel.Jh_imageArr = images;
}

//更新密码输入样式信息
- (void)updatePwdInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    cellModel.Jh_info = text;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
// 不用系统自带的箭头
//    if (cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Jh_SelectCell_rightArrow]];
//        cell.accessoryView = imageView;
//    }
//}

#pragma mark - Override

// 重写方法，监控特性集合（traitCollection）属性的变换，适配深色模式
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self Jh_configureIOS13Theme];
        }
    }
}

- (void)Jh_configureIOS13Theme {
    if (@available(iOS 13.0, *)) {
        switch (Jh_ThemeType) {
            case JhThemeTypeAuto: {
                BOOL isDarkMode = (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
                self.view.backgroundColor = (isDarkMode ? BaseBgWhiteColor_dark : BaseBgWhiteColor);
                self.Jh_formTableView.backgroundColor = (isDarkMode ? BaseBgWhiteColor_dark : BaseBgWhiteColor);
                break;
            }
            case JhThemeTypeLight: {
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
                break;
            }
        }
    } else {
        self.view.backgroundColor = BaseBgWhiteColor;
        self.Jh_formTableView.backgroundColor = BaseBgWhiteColor;
    }
}

@end
