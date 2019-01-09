//
//  JhFormTableViewVC.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTableViewVC.h"

#import "JhFormItem.h"
#import "JhFormSectionItem.h"
#import "JhFormInputCell.h"
#import "JhFormSelectCell.h"
#import "JhFormTextViewInputCell.h"
#import "JhFormCustumRightCell.h"
#import "JhFormCustumBottomCell.h"
#import "JhFormSelectImageCell.h"






@interface JhFormTableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, readonly) UITableViewStyle style;

@property (nonatomic,strong) UIView *FooterView;
@property (nonatomic, strong) UIButton *okBtn;

@end

@implementation JhFormTableViewVC



- (void)setNavTitleStr:(NSString *)NavTitleStr{
    _NavTitleStr = NavTitleStr;
    
    self.navigationItem.title = self.NavTitleStr;
    
}

- (void)setSubmitStr:(NSString *)submitStr{
    _submitStr =submitStr;
    [_okBtn setTitle:submitStr forState:UIControlStateNormal];
}


- (NSMutableArray *)mutableItems {
    if (!_mutableItems) {
        _mutableItems = [[NSMutableArray alloc]init];
    }
    return _mutableItems;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}


#pragma mark - 点击提交按钮
-(void)ClickOkBtn{

    if (self.submitCompletion) {
        self.submitCompletion();
    }
    
}


-(UIView *)FooterView{
    if (!_FooterView) {
        
        UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0,0, Kwidth, 70)];
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


-(UITableView *)FormTableView{
    if (!_FormTableView) {

        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, Kwidth, Kheight-kNavHeight-kBottomSafeHeight)];
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //不显示分割线
        tableView.showsVerticalScrollIndicator = NO;
        tableView.dataSource=self;
        tableView.delegate=self;
        tableView.backgroundColor =  BaseBgWhiteColor;
        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,15)];
        tableView.tableFooterView = [self FooterView];
        [self.view addSubview:tableView];
        _FormTableView =tableView;
        
    }
    return _FormTableView;
}

- (void)configureIOS11{

    /// 适配 iOS 11.0 ,iOS11以后，控制器的automaticallyAdjustsScrollViewInsets已经废弃，所以默认就会是YES
    /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
    if (@available(iOS 11.0, *)) {

        _FormTableView.estimatedRowHeight = 0;
        _FormTableView.estimatedSectionHeaderHeight = 0;
        _FormTableView.estimatedSectionFooterHeight = 0;
        //防止列表/页面偏移
        _FormTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BaseBgWhiteColor;
    
//    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:_style];
//    [self addChildViewController:tableViewController];
//    [tableViewController.view setFrame:self.view.bounds];
//
//    // 获取tableViewController的tableView实现表单自动上移
//    FormTableView = tableViewController.tableView;
//    FormTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    FormTableView.dataSource = self;
//    FormTableView.delegate = self;
//    //FormTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
//    FormTableView.showsVerticalScrollIndicator = NO;
//    FormTableView.showsHorizontalScrollIndicator = NO;
//    FormTableView.backgroundColor = [UIColor whiteColor];
//    FormTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CGFLOAT_MIN)];
//    FormTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CGFLOAT_MIN)];
//
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
//    //  加上这句不会影响你 tableview 上的 action (button,cell selected...)
//    singleTap.cancelsTouchesInView = NO;
//    [FormTableView addGestureRecognizer:singleTap];
//
//    [self.view addSubview:FormTableView];
    
    
    [self FormTableView];
    
    [self configureIOS11];
    
    
}


- (void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

#pragma mark -- TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mutableItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSParameterAssert([self.mutableItems[section] isKindOfClass:[JhFormSectionItem class]]);
    JhFormSectionItem *sectionItem = self.mutableItems[section];
    return sectionItem.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    NSParameterAssert([sectionItem.items[indexPath.row] isKindOfClass:[JhFormItem class]]);
    JhFormItem *item = sectionItem.items[indexPath.row];
    
        // 表单条目类别判断
        if (item.itemType == JhFormItemTypeTextViewInput) {
            static NSString *cell_id = @"textViewInput_cell_id";
            JhFormTextViewInputCell *cell = [tableView textViewInputCellWithId:cell_id];
            cell.item = item;
            cell.textViewInputCompletion = ^(NSString *text) {
                [self updateTextViewInputWithText:text indexPath:indexPath];
            };
            return cell;
            
        }else if (item.itemType == JhFormItemTypeSelect) {
            static NSString *cell_id = @"select_cell_id";
            JhFormSelectCell *cell = [tableView selectCellWithId:cell_id];
            cell.item = item;
            return cell;
            
        }else if (item.itemType == JhFormItemTypeCustumRight) {
            static NSString *cell_id = @"custumRight_cell_id";
            JhFormCustumRightCell *cell = [tableView custumRightCellWithId:cell_id];
            cell.item = item;
        
            if (item.custumRightViewBlock) {
                item.custumRightViewBlock(cell.CustumRightView);
            }
            
            return cell;
        }else if (item.itemType == JhFormItemTypeCustumBottom) {
            static NSString *cell_id = @"custumBottom_cell_id";
            JhFormCustumBottomCell *cell = [tableView CustumBottomCellWithId:cell_id];
            cell.item = item;
            if (item.custumBottomViewBlock) {
                item.custumBottomViewBlock(cell.CustumBottomView);
            }
            
            return cell;
        }else if (item.itemType == JhFormItemTypeSelectImage) {
            static NSString *cell_id = @"SelectImage_cell_id";
            JhFormSelectImageCell *cell = [tableView SelectImageCellWithId:cell_id];
            cell.item = item;
            cell.imageSelectCompletion = ^(NSArray *images) {
                [self updateImageWithImages:images indexPath:indexPath];
            };
            return cell;
        }
    
        else {
            
            static NSString *cell_id = @"input_cell_id";
            JhFormInputCell *cell = [tableView inputCellWithId:cell_id];
            cell.item = item;
            cell.inputCompletion = ^(NSString *text) {
                [self updateInputWithText:text indexPath:indexPath];
            };
            return cell;
        }
    
    
}


#pragma mark -- TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    JhFormItem *item = sectionItem.items[indexPath.row];
    
    if (item.itemType == JhFormItemTypeTextViewInput) {
        return [JhFormTextViewInputCell heightWithItem:item];
    }else if (item.itemType == JhFormItemTypeSelect) {
        return [JhFormSelectCell heightWithItem:item];
    }
    else {
        return [JhFormInputCell heightWithItem:item];
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    JhFormItem *item = sectionItem.items[indexPath.row];
    if (item.itemType == JhFormItemTypeSelect && item.itemSelectCompletion) {
        item.itemSelectCompletion(item);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    JhFormSectionItem *sectionItem = self.mutableItems[section];
    return sectionItem.headerHeight > 0 ? sectionItem.headerHeight:0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    JhFormSectionItem *sectionItem = self.mutableItems[section];
    return sectionItem.footerHeight > 0 ? sectionItem.footerHeight:0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JhFormSectionItem *sectionItem = self.mutableItems[section];
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionItem.headerHeight)];
    return sectionItem.headerView ? sectionItem.headerView:header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    JhFormSectionItem *sectionItem = self.mutableItems[section];
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, sectionItem.footerHeight)];
    return sectionItem.footerView ? sectionItem.footerView:footer;
}

#pragma mark -- 表单条目响应block处理
- (void)updateInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath {
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    JhFormItem *item = sectionItem.items[indexPath.row];
    item.info = text;
}

- (void)updateTextViewInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath {
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    JhFormItem *item = sectionItem.items[indexPath.row];
    item.info = text;
}

- (void)updateImageWithImages:(NSArray *)images indexPath:(NSIndexPath *)indexPath {
    JhFormSectionItem *sectionItem = self.mutableItems[indexPath.section];
    JhFormItem *item = sectionItem.items[indexPath.row];
    item.images = images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
