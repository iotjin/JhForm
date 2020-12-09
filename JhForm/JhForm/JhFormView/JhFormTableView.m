//
//  JhFormTableView.m
//  JhForm
//
//  Created by Jh on 2020/11/23.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhFormTableView.h"
#import "JhFormCellModel.h"
#import "JhFormSectionModel.h"
#import "JhFormBaseCell.h"

@interface JhFormTableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation JhFormTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor whiteColor];
    self.showsVerticalScrollIndicator = NO;
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
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    NSParameterAssert([sectionModel.Jh_sectionModelArr[indexPath.row] isKindOfClass:[JhFormCellModel class]]);
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    NSCAssert(cellModel.Jh_cellClassName.length >0, @" Jh_cellClassName 不能为空！！！");
    
    JhFormBaseCell *cell = [self dequeueReusableCellWithIdentifier:cellModel.Jh_cellIdentifier forIndexPath:indexPath];
    cell.baseTableView = self;
    if ([cell conformsToProtocol:@protocol(JhFormProtocol)]){
        [cell Jh_configCellModel:cellModel];
    }
    return cell;
}

#pragma mark -- TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    //两种方式设置高度
    Class <JhFormProtocol> cellClass = NSClassFromString(cellModel.Jh_cellClassName);
    if ([cellClass respondsToSelector:@selector(Jh_configCellHeight:)]) {
        return [cellClass Jh_configCellHeight:cellModel];
    }
    return cellModel.Jh_cellHeight;
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
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, sectionModel.Jh_headerHeight)];
    headerView.backgroundColor = Jh_SetValueAndDefault(sectionModel.Jh_headerBgColor, Jh_HeaderBgColor);
    if (sectionModel.Jh_headerTitle) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 10, headerView.frame.size.height)];
        titleLabel.font = JhFontsize(Jh_SetValueAndDefault(sectionModel.Jh_headerTitleFont, Jh_HeaderTitleFont));
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.text = sectionModel.Jh_headerTitle;
        titleLabel.textColor = Jh_SetValueAndDefault(sectionModel.Jh_headerTitleColor, Jh_HeaderTitleColor);
        [headerView addSubview:titleLabel];
    }
    return sectionModel.Jh_headerView ? sectionModel.Jh_headerView:headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[section];
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, sectionModel.Jh_footerHeight)];
    footerView.backgroundColor = sectionModel.Jh_footerBgColor;
    if (sectionModel.Jh_footerTitle) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 10, footerView.frame.size.height)];
        titleLabel.font = JhFontsize(Jh_SetValueAndDefault(sectionModel.Jh_footerTitleFont, Jh_FooterTitleFont));
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.text = sectionModel.Jh_footerTitle;
        titleLabel.textColor = Jh_SetValueAndDefault(sectionModel.Jh_footerTitleColor, Jh_FooterTitleColor);
        [footerView addSubview:titleLabel];
    }
    return sectionModel.Jh_footerView ? sectionModel.Jh_footerView:footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JhFormSectionModel *sectionModel = self.Jh_formModelArr[indexPath.section];
    JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[indexPath.row];
    if (cellModel.Jh_cellSelectBlock) {
        cellModel.Jh_cellSelectBlock(cellModel);
    }
    if (self.Jh_cellSelectBlock) {
        self.Jh_cellSelectBlock(cellModel,indexPath);
    }
}

////不用系统自带的箭头
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Jh_SelectCell_rightArrow]];
//        cell.accessoryView = imageView;
//    }
//}

#pragma mark - 数据源

-(void)setJh_formModelArr:(NSMutableArray *)Jh_formModelArr {
    _Jh_formModelArr = Jh_formModelArr;
    [self registerCell:Jh_formModelArr];
}

//注册Cell
- (void)registerCell:(NSMutableArray *)dataArr {
    for (int i=0; i< dataArr.count; i++) {
        JhFormSectionModel *sectionModel = dataArr[i];
        for (int j=0; j< sectionModel.Jh_sectionModelArr.count; j++) {
            JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[j];
            NSString *cell_id = [NSString stringWithFormat:@"%@_id_%d%d",cellModel.Jh_cellClassName,i,j];
            cellModel.Jh_cellIdentifier = cell_id;
            if (cellModel.Jh_isXibCell) {
                [self Jh_registerNibCell:NSClassFromString(cellModel.Jh_cellClassName) forCellReuseIdentifier:cell_id];
            } else {
                [self Jh_registerCell:NSClassFromString(cellModel.Jh_cellClassName) forCellReuseIdentifier:cell_id];
            }
        }
    }
}


/**
 Xib注册cell
 
 @param cls Cell
 @param reuseIdentifier CellID
 */
- (void)Jh_registerNibCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cls) bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

/**
 纯代码注册cell
 
 @param cls Cell
 @param reuseIdentifier CellID
 */
- (void)Jh_registerCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier {
    [self registerClass:cls forCellReuseIdentifier:reuseIdentifier];
}



@end
