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

@interface JhFormTableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIView  *FooterView;
@property (strong, nonatomic) UIButton  *okBtn;

@end

@implementation JhFormTableViewVC


-(void)dealloc{
    NSLog(@" JhFormTableViewVC - dealloc ");
}

- (void)setJh_navTitle:(NSString *)Jh_navTitle{
    _Jh_navTitle =Jh_navTitle;
    self.navigationItem.title =Jh_navTitle;
}

-(void)setJh_navRightTitle:(NSString *)Jh_navRightTitle{
    _Jh_navRightTitle = Jh_navRightTitle;
    if (Jh_navRightTitle.length) {
        UIColor *color = [UIColor blackColor];
        if (@available(iOS 13.0, *)) {
            color = [UIColor labelColor];
        }
        UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTitle:Jh_navRightTitle titleColor:color target:self action:@selector(ClickRightItem)];
        self.navigationItem.rightBarButtonItems =  @[rightItem];
    }
}
-(void)setJh_navRightImage:(NSString *)Jh_navRightImage{
    _Jh_navRightImage = Jh_navRightImage;
    if (Jh_navRightImage.length) {
        UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:Jh_navRightImage highImage:Jh_navRightImage target:self action:@selector(ClickRightItem)];
        self.navigationItem.rightBarButtonItems =  @[rightItem];
    }
    
}


-(void)ClickRightItem{
    if (self.JhClickNavRightItemBlock) {
        self.JhClickNavRightItemBlock();
    }
}


-(void)setJh_submitStr:(NSString *)Jh_submitStr{
    _Jh_submitStr = Jh_submitStr;
    [_okBtn setTitle:Jh_submitStr forState:UIControlStateNormal];
}


-(NSMutableArray *)Jh_formModelArr{
    if (!_Jh_formModelArr) {
        _Jh_formModelArr = [NSMutableArray array];
        
    }
    return _Jh_formModelArr;
}

-(void)setJh_hiddenDefaultFooterView:(BOOL)Jh_hiddenDefaultFooterView{
    
    _Jh_hiddenDefaultFooterView = Jh_hiddenDefaultFooterView;
    self.FooterView.hidden = Jh_hiddenDefaultFooterView;
}


#pragma mark - 点击提交按钮
-(void)ClickOkBtn{

    if (self.Jh_formSubmitBlock) {
        self.Jh_formSubmitBlock();
    }
    
}


-(UIView *)FooterView{
    if (!_FooterView) {
        
        UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0,0, Kwidth, 80)];
        footerView.backgroundColor = [UIColor clearColor];
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(15, 25, footerView.bounds.size.width - 15*2, 40);
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = BaseThemeColor;
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn.layer setCornerRadius:5];
        [btn addTarget:self action:@selector(ClickOkBtn) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"提 交" forState:UIControlStateNormal];
        [footerView addSubview:btn];
        
        _FooterView = footerView;
//        btn.lee_theme.LeeConfigBackgroundColor(Common_ThemeColor);

        _okBtn =btn;
        
    }
    return _FooterView;
}


-(UITableView *)Jh_formTableView{
    if (!_Jh_formTableView) {

        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, Kwidth, Kheight-kNavHeight-kBottomSafeHeight)];
        
        tableView.showsVerticalScrollIndicator = NO;
        tableView.dataSource=self;
        tableView.delegate=self;
        tableView.backgroundColor =  BaseBgWhiteColor;
//       tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,15)];
        tableView.tableFooterView = [self FooterView];
        
        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CGFLOAT_MIN)];

        [self.view addSubview:tableView];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        //  加上这句不会影响你 tableview 上的 action (button,cell selected...)
        singleTap.cancelsTouchesInView = NO;
        [tableView addGestureRecognizer:singleTap];
        
        
        _Jh_formTableView =tableView;
        
    }
    return _Jh_formTableView;
}

- (void)configureIOS11{

    /// 适配 iOS 11.0 ,iOS11以后，控制器的automaticallyAdjustsScrollViewInsets已经废弃，所以默认就会是YES
    /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
    if (@available(iOS 11.0, *)) {

        _Jh_formTableView.estimatedRowHeight = 0;
        _Jh_formTableView.estimatedSectionHeaderHeight = 0;
        _Jh_formTableView.estimatedSectionFooterHeight = 0;
        //防止列表/页面偏移
        _Jh_formTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self configureIOS13Theme];
        }
    }

}


- (void)configureIOS13Theme{
    
    if (@available(iOS 13.0, *)) {
        
        switch (Jh_ThemeType) {
            case JhThemeTypeAuto:
            {
                if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    self.view.backgroundColor = BaseBgWhiteColor_dark;
                    self.Jh_formTableView.backgroundColor = BaseBgWhiteColor_dark;
                }else {
                    self.view.backgroundColor = BaseBgWhiteColor;
                    self.Jh_formTableView.backgroundColor = BaseBgWhiteColor;
                }
            }
                break;
            case JhThemeTypeLight:
            {
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            }
                break;
            default:
                break;
        }
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BaseBgWhiteColor;
    
    [self Jh_formTableView];
    
    [self configureIOS11];
    
    
    [self configureIOS13Theme];
    
}




#pragma mark - 单击手势点击事件
-(void)tapClick:(UITapGestureRecognizer *)tap{
     [self.view endEditing:YES];
}

#pragma mark -- TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.Jh_formModelArr.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSParameterAssert([self.Jh_formModelArr[section] isKindOfClass:[JhFormSectionModel class]]);
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    return sectionModel.Jh_sectionModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    NSParameterAssert([sectionModel.Jh_sectionModelArr[indexPath.row] isKindOfClass:[JhFormCellModel class]]);
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    
    CGFloat LeftTitleWidth = self.Jh_leftTitleWidth ? self.Jh_leftTitleWidth :Jh_TitleWidth;
    
    if(self.Jh_leftTitleHiddenRedStar ==YES){
        cellModel.Jh_titleHiddenRedStar = YES;
    }
    
    if(self.Jh_useLightTheme ==YES){
        if(@available(iOS 13.0,*)){
            self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            
        }
    }
    
    
     // 表单条目类别判断
       if (cellModel.Jh_cellType == JhFormCellTypeTextViewInput) {
           NSString *cell_id = [NSString stringWithFormat:@"textViewInput_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormTextViewInputCell *cell = [tableView textViewInputCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           cell.textViewInputCompletion = ^(NSString *text) {
               [weakSelf updateTextViewInputWithText:text indexPath:indexPath];
           };
           return cell;
           
       }else if (cellModel.Jh_cellType == JhFormCellTypeSelect) {
           NSString *cell_id = [NSString stringWithFormat:@"select_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormSelectCell *cell = [tableView selectCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           return cell;
           
       }else if (cellModel.Jh_cellType == JhFormCellTypeCustumRight) {
           NSString *cell_id = [NSString stringWithFormat:@"custumRight_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormCustumRightCell *cell = [tableView CustumRightCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           if (cellModel.Jh_custumRightViewBlock) {
               cellModel.Jh_custumRightViewBlock(cell.CustumRightView);
           }
           return cell;
       }else if (cellModel.Jh_cellType == JhFormCellTypeCustumBottom) {
           NSString *cell_id = [NSString stringWithFormat:@"custumBottom_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormCustumBottomCell *cell = [tableView CustumBottomCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           if (cellModel.Jh_custumBottomViewBlock) {
               cellModel.Jh_custumBottomViewBlock(cell.CustumBottomView);
           }
           return cell;
       }else if (cellModel.Jh_cellType == JhFormCellTypeSelectImage) {
           NSString *cell_id = [NSString stringWithFormat:@"custumBottom_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormSelectImageCell *cell = [tableView SelectImageCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           cell.JhImageSelectBlock = ^(NSArray *imageArr) {
               [weakSelf updateImageWithImages:imageArr indexPath:indexPath];
           };
           return cell;
       }
       else if (cellModel.Jh_cellType == JhFormCellTypeRightSwitchBtn) {
           NSString *cell_id = [NSString stringWithFormat:@"SwitchBtn_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormSwitchBtnCell *cell = [tableView SwitchBtnCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           return cell;
       }
       else if (cellModel.Jh_cellType == JhFormCellTypeCenterTextCell) {
           NSString *cell_id = [NSString stringWithFormat:@"CenterText_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormCenterTextCell *cell = [tableView CenterTextWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           return cell;
       }
       else if (cellModel.Jh_cellType == JhFormCellTypePwdInput) {
           NSString *cell_id = [NSString stringWithFormat:@"PwdInput_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormPwdCell *cell = [tableView PwdCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           cell.Jh_pwdInputCompletion = ^(NSString *text) {
               [weakSelf updatePwdInputWithText:text indexPath:indexPath];
           };
           return cell;
       }
       else if (cellModel.Jh_cellType == JhFormCellTypeCustumALLView) {
           NSString *cell_id = [NSString stringWithFormat:@"CustumALLView_cell_id_%ld%ld", (long)[indexPath section], (long)[indexPath row]];
           JhFormCustumALLViewCell *cell = [tableView CustumALLCellWithId:cell_id];
           cell.data = cellModel;
           cell.data.Jh_titleWidth = LeftTitleWidth;
           if (cellModel.Jh_custumALLViewBlock) {
               cellModel.Jh_custumALLViewBlock(cell.CustumALLView);
           }
           return cell;
       }
       
       else {
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


#pragma mark -- TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    
    if (cellModel.Jh_cellType  == JhFormCellTypeTextViewInput) {
        return [JhFormTextViewInputCell heightWithCellModelData:cellModel];
    }else if (cellModel.Jh_cellType  == JhFormCellTypeSelect) {
        return [JhFormSelectCell heightWithCellModelData:cellModel];
    }
    else if (cellModel.Jh_cellType  == JhFormCellTypeCustumALLView || cellModel.Jh_cellType  == JhFormCellTypePwdInput) {
        return cellModel.Jh_defaultHeight;
    }
    else if (cellModel.Jh_cellType  == JhFormCellTypeSelectImage) {
        return [JhFormSelectImageCell heightWithCellModelData:cellModel];
    }
    else {
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
    return sectionModel.Jh_headerHeight > 0 ? sectionModel.Jh_headerHeight:0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    return sectionModel.Jh_footerHeight > 0 ? sectionModel.Jh_footerHeight:0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionModel.Jh_headerHeight)];
    return sectionModel.Jh_headerView ? sectionModel.Jh_headerView:headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionModel.Jh_footerHeight)];
    return sectionModel.Jh_footerView ? sectionModel.Jh_footerView:footerView;
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
