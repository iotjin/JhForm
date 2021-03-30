//
//  JhFormTableViewVC.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTableViewVC.h"
#import "JhFormInputCell.h"
#import "UIBarButtonItem+JhForm.h"

@interface JhFormTableViewVC ()

@property (nonatomic, strong) NSMutableArray *mArr;
@property (nonatomic, strong) UIView *footerView;

@end

@implementation JhFormTableViewVC

-(void)dealloc {
    NSLog(@" JhFormTableViewVC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Jh_formTableView];
    [self Jh_configureIOS11];
    [self Jh_configureIOS13Theme];
}

- (void)Jh_configureIOS11 {
    /// 适配 iOS 11.0 ,iOS11以后，控制器的automaticallyAdjustsScrollViewInsets已经废弃，所以默认就会是YES
    /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
    if (@available(iOS 11.0, *)) {
        self.Jh_formTableView.estimatedRowHeight = 0;
        self.Jh_formTableView.estimatedSectionHeaderHeight = 0;
        self.Jh_formTableView.estimatedSectionFooterHeight = 0;
        //防止列表页面偏移
        self.Jh_formTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
}

//暗黑模式颜色已通过分类处理，此处是处理整个页面的Auto、Light、Dark样式
- (void)Jh_configureIOS13Theme {
    self.view.backgroundColor = JhBaseBgColor;
    if (@available(iOS 13.0, *)) {
        JhThemeType type = Jh_ThemeType;
        if (self.Jh_themeType) {
            type = self.Jh_themeType;
        }
        switch (type) {
            case JhThemeTypeAuto:
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
                break;
            case JhThemeTypeLight:
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
                break;
            case JhThemeTypeDark:
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
                break;
            default:
                break;
        }
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self Jh_configureIOS13Theme];
        }
    }
}

-(JhFormTableView *)Jh_formTableView {
    if (!_Jh_formTableView) {
        JhFormTableView *tableView = [[JhFormTableView alloc]init];
        tableView.frame = CGRectMake(0, Jh_NavHeight, Jh_ScreenWidth, Jh_ScreenHeight-Jh_NavHeight-Jh_BottomSafeHeight);
        tableView.showsVerticalScrollIndicator = NO;
        tableView.backgroundColor = JhBaseBgColor;
        //        tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //不显示分割线
        //        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,15)];
        tableView.tableFooterView = [self footerView];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        singleTap.cancelsTouchesInView = NO;
        [tableView addGestureRecognizer:singleTap];
        [self.view addSubview:tableView];
        JhWeakSelf
        tableView.Jh_cellSelectBlock = ^(JhFormCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
            if (weakSelf.Jh_formCellSelectBlock) {
                weakSelf.Jh_formCellSelectBlock(cellModel, indexPath);
            }
        };
        _Jh_formTableView = tableView;
    }
    return _Jh_formTableView;
}

#pragma mark - 单击手势点击事件
-(void)tapClick:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES];
}

- (UIView *)footerView {
    if (!_footerView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Jh_ScreenWidth, Jh_SubmitBtn_Height + Jh_SubmitBtn_TBSpace*2)];
        view.backgroundColor = [UIColor clearColor];
        // 提交按钮
        UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        submitButton.frame = CGRectMake(Jh_SubmitBtn_LRSpace, Jh_SubmitBtn_TBSpace, view.bounds.size.width - Jh_SubmitBtn_LRSpace*2, Jh_SubmitBtn_Height);
        submitButton.backgroundColor = JhBaseThemeColor;
        [submitButton setTitle:Jh_SubmitBtn_Text forState:UIControlStateNormal];
        [submitButton setTitleColor:Jh_SubmitBtn_TextColor forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:Jh_SubmitBtn_TextFontSize];
        submitButton.layer.cornerRadius = Jh_SubmitBtn_CornerRadius;
        [submitButton addTarget:self action:@selector(ClickSubmitBtn) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:submitButton];
        _footerView = view;
        self.Jh_submitBtn = submitButton;
    }
    return _footerView;
}

-(void)setJh_hiddenDefaultFooterView:(BOOL)Jh_hiddenDefaultFooterView {
    _Jh_hiddenDefaultFooterView = Jh_hiddenDefaultFooterView;
    self.Jh_formTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Jh_ScreenWidth, CGFLOAT_MIN)];
}

-(NSMutableArray *)mArr {
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}

- (void)setJh_formModelArr:(NSMutableArray *)Jh_formModelArr {
    _Jh_formModelArr = Jh_formModelArr;
    self.mArr = Jh_formModelArr;
    self.Jh_formTableView.Jh_formModelArr = self.mArr;
}

/** 添加sectionModel  */
#pragma mark - 添加sectionModel 数据源
-(void)Jh_addSectionModel:(JhFormSectionModel *)sectionModel {
    [self.mArr addObject:sectionModel];
    self.Jh_formTableView.Jh_formModelArr = self.mArr;
    _Jh_formModelArr = self.mArr;
}

-(void)setJh_leftTitleWidth:(CGFloat)Jh_leftTitleWidth {
    _Jh_leftTitleWidth = Jh_leftTitleWidth;
    for (JhFormSectionModel *sectionModel in self.mArr) {
        for (JhFormCellModel *cellModel in sectionModel.Jh_sectionModelArr) {
            cellModel.Jh_titleWidth = Jh_leftTitleWidth;
        }
    }
    self.Jh_formTableView.Jh_formModelArr = self.mArr;
    _Jh_formModelArr = self.mArr;
}

-(void)setJh_leftTitleHiddenRedStar:(BOOL)Jh_leftTitleHiddenRedStar {
    _Jh_leftTitleHiddenRedStar = Jh_leftTitleHiddenRedStar;
    for (JhFormSectionModel *sectionModel in self.mArr) {
        for (JhFormCellModel *cellModel in sectionModel.Jh_sectionModelArr) {
            cellModel.Jh_titleHiddenRedStar = Jh_leftTitleHiddenRedStar;
        }
    }
    self.Jh_formTableView.Jh_formModelArr = self.mArr;
    _Jh_formModelArr = self.mArr;
}

-(void)setJh_themeType:(JhThemeType)Jh_themeType {
    _Jh_themeType = Jh_themeType;
    for (JhFormSectionModel *sectionModel in self.mArr) {
        for (JhFormCellModel *cellModel in sectionModel.Jh_sectionModelArr) {
            cellModel.Jh_cellThemeType = Jh_themeType;
        }
    }
    self.Jh_formTableView.Jh_formModelArr = self.mArr;
    [self Jh_configureIOS13Theme];
}

#pragma mark - 导航栏

- (void)setJh_navTitle:(NSString *)Jh_navTitle {
    _Jh_navTitle =Jh_navTitle;
    self.navigationItem.title =Jh_navTitle;
}

-(void)setJh_navRightTitle:(NSString *)Jh_navRightTitle {
    _Jh_navRightTitle = Jh_navRightTitle;
    if (Jh_navRightTitle.length) {
        UIColor *color = JhBaseNavTextColor;
        UIBarButtonItem *rightItem = [UIBarButtonItem Jh_itemWithTitle:Jh_navRightTitle titleColor:color target:self action:@selector(ClickNavRightItem)];
        self.navigationItem.rightBarButtonItems =  @[rightItem];
    }
}

-(void)setJh_navRightImage:(NSString *)Jh_navRightImage {
    _Jh_navRightImage = Jh_navRightImage;
    if (Jh_navRightImage.length) {
        UIBarButtonItem *rightItem = [UIBarButtonItem Jh_itemWithImage:Jh_navRightImage highImage:Jh_navRightImage target:self action:@selector(ClickNavRightItem)];
        self.navigationItem.rightBarButtonItems =  @[rightItem];
    }
}

-(void)ClickNavRightItem {
    if (self.JhClickNavRightItemBlock) {
        self.JhClickNavRightItemBlock();
    }
}


#pragma mark - 提交按钮

-(void)ClickSubmitBtn {
    if (self.Jh_formSubmitBlock) {
        self.Jh_formSubmitBlock();
    }
}

-(void)setJh_submitStr:(NSString *)Jh_submitStr {
    _Jh_submitStr = Jh_submitStr;
    [self.Jh_submitBtn setTitle:Jh_submitStr forState:UIControlStateNormal];
}

- (void)setJh_submitBtnBgColor:(UIColor *)Jh_submitBtnBgColor {
    _Jh_submitBtnBgColor = Jh_submitBtnBgColor;
    self.Jh_submitBtn.backgroundColor = Jh_submitBtnBgColor;
}

-(void)setJh_submitBtnTBSpace:(CGFloat)Jh_submitBtnTBSpace {
    _Jh_submitBtnTBSpace = Jh_submitBtnTBSpace;
    self.Jh_submitBtn.Jh_y = Jh_submitBtnTBSpace;
    if (self.Jh_submitBtnHeight) {
        self.footerView.Jh_height = self.Jh_submitBtnHeight + Jh_submitBtnTBSpace*2;
    } else {
        self.footerView.Jh_height = Jh_SubmitBtn_Height + Jh_submitBtnTBSpace*2;
    }
}

-(void)setJh_submitBtnLRSpace:(CGFloat)Jh_submitBtnLRSpace {
    _Jh_submitBtnLRSpace = Jh_submitBtnLRSpace;
    self.Jh_submitBtn.Jh_x = Jh_submitBtnLRSpace;
    self.Jh_submitBtn.Jh_width = self.footerView.bounds.size.width - Jh_submitBtnLRSpace*2;
}

-(void)setJh_submitBtnCornerRadius:(CGFloat)Jh_submitBtnCornerRadius {
    _Jh_submitBtnCornerRadius = Jh_submitBtnCornerRadius;
    self.Jh_submitBtn.layer.cornerRadius = Jh_submitBtnCornerRadius;
}

-(void)setJh_submitBtnHeight:(CGFloat)Jh_submitBtnHeight {
    _Jh_submitBtnHeight = Jh_submitBtnHeight;
    self.Jh_submitBtn.Jh_height = Jh_submitBtnHeight;
    if (self.Jh_submitBtnTBSpace>0) {
        self.footerView.Jh_height = Jh_submitBtnHeight + self.Jh_submitBtnTBSpace*2;
    } else {
        self.footerView.Jh_height = Jh_submitBtnHeight + Jh_SubmitBtn_TBSpace*2;
    }
}

-(void)setJh_submitBtnTextFontSize:(CGFloat)Jh_submitBtnTextFontSize {
    _Jh_submitBtnTextFontSize = Jh_submitBtnTextFontSize;
    self.Jh_submitBtn.titleLabel.font = [UIFont systemFontOfSize:Jh_submitBtnTextFontSize];
}

-(void)setJh_submitBtnTextColor:(UIColor *)Jh_submitBtnTextColor {
    _Jh_submitBtnTextColor = Jh_submitBtnTextColor;
    [self.Jh_submitBtn setTitleColor:Jh_submitBtnTextColor forState:UIControlStateNormal];
}


@end
