//
//  JhFormSelectBtnCell.m
//  JhForm
//
//  Created by Jh on 2020/10/26.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhFormSelectBtnCell.h"
#import "NSString+JhForm.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "UIImage+JhFormImage.h"

//// 按钮起始X
//#define kBtnStartX 10
//// 按钮高度
//#define kBtnHeight 24
////按钮水平间距
//#define kBtnHorizontalMargin  10
////按钮垂直间距
//#define kBtnVerticalMargin  10
////按钮title左右空白大小
//#define kBtnTitleBlank  10
////按钮图标和文字间距
//#define kBtnIconSpace  10
////按钮图片宽度
//#define kBtnIconW  20+kBtnIconSpace
////按钮圆角
//#define kBtnCornerRadius 0
////按钮边框宽度
//#define kBtnBorderWidth 0

////按钮标题颜色
//#define kBtnTitleColor Jh_rightTextViewTextColor
//#define kBtnTitleSelectColor Jh_rightTextViewTextColor
////按钮边框颜色
//#define kBtnBorderColor [UIColor grayColor]
////按钮默认背景颜色
//#define kBtnNormalBgColor [UIColor whiteColor]
////按钮选中背景颜色
//#define kBtnSelectBgColor [UIColor whiteColor]

@interface JhFormSelectBtnCell()

@property (nonatomic, strong) UIView *CustumRightView;

@property (nonatomic, strong) NSArray *btnTitleArray;

@property (nonatomic, strong) UIButton *currentSelectBtn;

@property (nonatomic, strong) NSMutableArray *selectTitleArray;
@property (nonatomic, strong) NSMutableArray *selectIndexArray;

@end

@implementation JhFormSelectBtnCell

- (NSMutableArray *)selectTitleArray{
    if (!_selectTitleArray) {
        _selectTitleArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectTitleArray;
}

- (NSMutableArray *)selectIndexArray{
    if (!_selectIndexArray) {
        _selectIndexArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectIndexArray;
}

-(UIView *)CustumRightView{
    if (!_CustumRightView) {
        _CustumRightView = [[UIView alloc]init];
        _CustumRightView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_CustumRightView];
        
        [self initBtn];
    }
    return _CustumRightView;
}


-(void)initBtn{
    
    self.btnTitleArray = self.data.Jh_selectBtnCell_btnTitleArr;
    
    CGFloat kBtnStartX = self.data.Jh_selectBtnCell_leftMargin?self.data.Jh_selectBtnCell_leftMargin:Jh_SelectBtnCell_LeftMargin;
    CGFloat kBtnHorizontalMargin = self.data.Jh_selectBtnCell_btnHorizontalMargin?self.data.Jh_selectBtnCell_btnHorizontalMargin:Jh_SelectBtnCell_BtnHorizontalMargin;
    CGFloat kBtnVerticalMargin = self.data.Jh_selectBtnCell_btnVerticalMargin?self.data.Jh_selectBtnCell_btnVerticalMargin:Jh_SelectBtnCell_BtnVerticalMargin;
    CGFloat kBtnHeight = self.data.Jh_selectBtnCell_btnHeight?self.data.Jh_selectBtnCell_btnHeight:Jh_SelectBtnCell_BtnHeight;
    CGFloat kBtnTitleBlank = self.data.Jh_selectBtnCell_btnTitleBlank?self.data.Jh_selectBtnCell_btnTitleBlank:Jh_SelectBtnCell_BtnTitleBlank;
    CGFloat kBtnIconSpace = self.data.Jh_selectBtnCell_btnIconSpace?self.data.Jh_selectBtnCell_btnIconSpace:Jh_SelectBtnCell_BtnIconSpace;
    CGFloat kBtnIconW = 20+kBtnIconSpace;
    
    CGFloat kBtnCornerRadius = self.data.Jh_selectBtnCell_btnCornerRadius?self.data.Jh_selectBtnCell_btnCornerRadius:Jh_SelectBtnCell_BtnCornerRadius;
    CGFloat kBtnBorderWidth = self.data.Jh_selectBtnCell_btnBorderWidth?self.data.Jh_selectBtnCell_btnBorderWidth:Jh_SelectBtnCell_BtnBorderWidth;
    
    UIColor * Jh_SelectBtnCell_BtnTitleColor_ = Jh_SelectBtnCell_BtnTitleColor;
    UIColor * Jh_SelectBtnCell_BtnTitleSelectColor_ = Jh_SelectBtnCell_BtnTitleSelectColor;
    UIColor * Jh_SelectBtnCell_BtnBorderColor_ = Jh_SelectBtnCell_BtnBorderColor;
    UIColor * Jh_SelectBtnCell_BtnBgColor_ = Jh_SelectBtnCell_BtnBgColor;
    if (@available(iOS 13.0, *)) {
        Jh_SelectBtnCell_BtnTitleColor_ = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return Jh_SelectBtnCell_BtnTitleColor_;
            } else {
                return UIColor.labelColor;
            }
        }];
        Jh_SelectBtnCell_BtnTitleSelectColor_ = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return Jh_SelectBtnCell_BtnTitleSelectColor_;
            } else {
                return UIColor.labelColor;
            }
        }];
        Jh_SelectBtnCell_BtnBgColor_ = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return Jh_SelectBtnCell_BtnBgColor_;
            } else {
                return UIColor.systemBackgroundColor;
            }
        }];
    }
    
    UIColor *kBtnTitleColor =
    self.data.Jh_selectBtnCell_btnTitleColor?self.data.Jh_selectBtnCell_btnTitleColor:Jh_SelectBtnCell_BtnTitleColor_;
    UIColor *kBtnTitleSelectColor =
    self.data.Jh_selectBtnCell_btnTitleSelectColor?self.data.Jh_selectBtnCell_btnTitleSelectColor:Jh_SelectBtnCell_BtnTitleSelectColor_;
    UIColor *kBtnBorderColor =
    self.data.Jh_selectBtnCell_btnBorderColor?self.data.Jh_selectBtnCell_btnBorderColor:Jh_SelectBtnCell_BtnBorderColor_;
    UIColor *kBtnNormalBgColor =
    self.data.Jh_selectBtnCell_btnBgColor?self.data.Jh_selectBtnCell_btnBgColor:Jh_SelectBtnCell_BtnBgColor_;
    
    //初始行_列的X、Y值设置
    float btnX = kBtnStartX;//self.data.Jh_selectBtnCell_leftMargin?
    float btnY = kBtnVerticalMargin;
    for(int i = 0; i < self.btnTitleArray.count; i++){
        //宽度自适应计算宽度
        CGFloat btnTextWidth = [self.btnTitleArray[i] sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(MAXFLOAT,kBtnHeight)].width;
        //按钮文字左右加空白
        CGFloat btnWidth = btnTextWidth+kBtnTitleBlank*2 + (self.data.Jh_selectBtnCell_hiddenLeftIcon ? 0:kBtnIconW);
        
        //判断是否换行（宽度计算得知当前行不够放置时换行计算累加Y值）
        CGFloat rightViewWidth = Jh_SCRREN_WIDTH - self.data.Jh_titleWidth -Jh_CustumRightView_rightEdgeMargin;
        if (self.data.Jh_selectBtnCell_isSingleLineDisplay) {
            btnX = kBtnStartX;
            if (i!=0) {
                btnY += (kBtnHeight+kBtnVerticalMargin);//Y值累加，具体值请结合项目自身需求设置 （值 = 按钮高度+按钮间隙）
            }
        }else{
            if (btnX+btnWidth > rightViewWidth-kBtnStartX) {
                btnX = kBtnStartX;
                btnY += (kBtnHeight+kBtnVerticalMargin);//Y值累加，具体值请结合项目自身需求设置 （值 = 按钮高度+按钮间隙）
            }
        }
        //创建按钮
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnWidth, kBtnHeight)];
        btn.backgroundColor = kBtnNormalBgColor;
        [btn setTitle:self.btnTitleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:kBtnTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:kBtnTitleSelectColor forState:UIControlStateSelected];
        [btn setTitleColor:kBtnTitleSelectColor forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:Jh_InfoFont];
        btn.layer.cornerRadius = kBtnCornerRadius;
        btn.clipsToBounds = YES ;
        btn.layer.borderWidth = kBtnBorderWidth;
        btn.layer.borderColor = kBtnBorderColor.CGColor;
        if (!self.data.Jh_selectBtnCell_hiddenLeftIcon) {
            
            NSString *unSelectImg = self.data.Jh_selectBtnCell_unSelectIcon?self.data.Jh_selectBtnCell_unSelectIcon:Jh_SelectBtnCell_UnSelectIcon;
            NSString *selectImg = self.data.Jh_selectBtnCell_selectIcon?self.data.Jh_selectBtnCell_selectIcon:(self.data.Jh_selectBtnCell_isUseBlackSelectIcon?Jh_SelectBtnCell_SelectIcon2:Jh_SelectBtnCell_SelectIcon);
            
            UIImage *unSelectImage = [UIImage imageNamed:unSelectImg];
            UIImage *selectImage = [UIImage imageNamed:selectImg];
            
            if (self.data.Jh_selectBtnCell_btnUnSelectIconColor) {
                unSelectImage = [unSelectImage Jh_imageWithTintColor:self.data.Jh_selectBtnCell_btnUnSelectIconColor];
            }
            if (self.data.Jh_selectBtnCell_btnSelectIconColor) {
                selectImage = [selectImage Jh_imageWithTintColor:self.data.Jh_selectBtnCell_btnSelectIconColor];
            }
            
            [btn setImage:unSelectImage forState:UIControlStateNormal];
            [btn setImage:selectImage forState:UIControlStateSelected];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -kBtnIconSpace, 0, 0);
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(ClickButton:isInit:) forControlEvents:UIControlEventTouchUpInside];
        [self.CustumRightView addSubview:btn];
        
        //一个按钮添加之后累加X值后续计算使用
        //        btnX = CGRectGetMaxX(btn.frame)+kBtnHorizontalMargin;
        btnX = btnX+btnWidth + kBtnHorizontalMargin;
        
        //如果设置默认选中数组，按设置的来，否则默认选中第一个
        if (self.data.Jh_selectBtnCell_selectTitleArr) {
            for (int j=0; j< self.data.Jh_selectBtnCell_selectTitleArr.count; j++) {
                NSString *tempStr = self.data.Jh_selectBtnCell_selectTitleArr[j];
                //设置选中样式
                if ([self.btnTitleArray containsObject:tempStr] && [tempStr isEqualToString:self.btnTitleArray[i]]) {
                    [self ClickButton:btn isInit:YES];
                }
            }
        }else{
            //默认选中第一个
            if (i==0) {
                [self ClickButton:btn isInit:NO];
            }
        }
    }
}


-(void)ClickButton:(UIButton*)button isInit:(BOOL)isInit{
    
    UIColor * Jh_SelectBtnCell_BtnBgColor_ = Jh_SelectBtnCell_BtnBgColor;
    UIColor * Jh_SelectBtnCell_BtnSelectBgColor_ = Jh_SelectBtnCell_BtnSelectBgColor;
    if (@available(iOS 13.0, *)) {
        Jh_SelectBtnCell_BtnBgColor_ = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return Jh_SelectBtnCell_BtnBgColor_;
            } else {
                return UIColor.systemBackgroundColor;
            }
        }];
        Jh_SelectBtnCell_BtnSelectBgColor_ = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return Jh_SelectBtnCell_BtnSelectBgColor_;
            } else {
                return UIColor.systemBackgroundColor;
            }
        }];
    }
    
    UIColor *kBtnNormalBgColor =
    self.data.Jh_selectBtnCell_btnBgColor?self.data.Jh_selectBtnCell_btnBgColor:Jh_SelectBtnCell_BtnBgColor_;
    UIColor *kBtnSelectBgColor =
    self.data.Jh_selectBtnCell_btnSelectBgColor?self.data.Jh_selectBtnCell_btnSelectBgColor:Jh_SelectBtnCell_BtnSelectBgColor_;
    
    NSString *title = button.titleLabel.text;
    NSNumber *index = [NSNumber numberWithInteger:button.tag];
    
    //多选
    if(self.data.Jh_selectBtnCell_isMultiSelect){
        if (!button.selected) {//没有选中过的先改变状态，再添加到保存按钮的数组中
            [self.selectTitleArray addObject:title];
            [self.selectIndexArray addObject:index];
            button.backgroundColor = kBtnSelectBgColor;
        }else{
            if ([self.selectTitleArray containsObject:title]) {
                [self.selectTitleArray removeObject:title];
            }
            if ([self.selectIndexArray containsObject:index]) {
                [self.selectIndexArray removeObject:index];
            }
            button.backgroundColor = kBtnNormalBgColor;
        }
        button.selected = !button.selected;
        
    }else{
        //单选
        self.currentSelectBtn.selected = NO ;
        self.currentSelectBtn.backgroundColor = kBtnNormalBgColor;
        
        button.selected = YES ;
        self.currentSelectBtn = button ;
        self.currentSelectBtn.backgroundColor = kBtnSelectBgColor;
        
        [self.selectTitleArray removeAllObjects];
        [self.selectIndexArray removeAllObjects];
        [self.selectTitleArray addObject:title];
        [self.selectIndexArray addObject:index];
        
    }
    
    if (isInit == NO) {
        self.data.Jh_selectBtnCell_selectTitleArr = self.selectTitleArray;
    }
    self.data.Jh_selectBtnCell_selectIndexArr = self.selectIndexArray;
    //    NSLog(@" 选中的title数组 %@ ",self.data.Jh_selectBtnCell_selectTitleArr);
    //    NSLog(@" 选中的index数组 %@ ",self.data.Jh_selectBtnCell_selectIndexArr);
    
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    if (data.Jh_titleMultiLineShow==YES) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
    }
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.accessoryType = UITableViewCellAccessoryNone;
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    self.userInteractionEnabled = !(data.Jh_Cell_NoEdit || !self.data.Jh_editable);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        self.CustumRightView.frame =CGRectMake(0, 0, Jh_SCRREN_WIDTH-Jh_Margin_left-Jh_EdgeMargin-3, self.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame));
    }else{
        //上下排列
        if(self.data.Jh_selectBtnCell_isTopTitleBottomOption){
            
            CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
            self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
            self.CustumRightView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), Jh_SCRREN_WIDTH, self.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame));
            
        }else{
            //左右排列
            
            /********************************* 左侧标题换行 ********************************/
            CGFloat titleHeight = _data.Jh_titleHeight;
            CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
            self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, titleHeight);
            
            if (_data.Jh_titleMultiLineShow==YES) {
                if (titleHeight >(_data.Jh_defaultHeight-Jh_EdgeMargin*2)){
                    _data.Jh_defaultHeight = titleHeight+Jh_EdgeMargin*2;
                    [self.baseTableView reloadData];
                }
            }
            /********************************* 左侧标题换行 ********************************/
            
            self.CustumRightView.frame =CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 2*Jh_EdgeMargin) - Jh_CustumRightView_rightEdgeMargin, self.bounds.size.height);
            
            //文字垂直居中
            if (_data.Jh_cellTextVerticalCenter == true || Jh_CellTextVerticalStyle == JhCellTextVerticalStyleCenter) {
                CGFloat newHeight = [JhFormSelectBtnCell heightWithCellModelData:self.data];
                CGFloat titleLabelY = (newHeight -titleHeight)/2;
                self.titleLabel.hx_y = titleLabelY;
            }
            
        }
        
    }
}

//高度自适应
+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data{
    NSArray *tempArr = data.Jh_selectBtnCell_btnTitleArr;
    if (!tempArr.count) {
        return data.Jh_defaultHeight;
    }
    
    CGFloat kBtnStartX = data.Jh_selectBtnCell_leftMargin?data.Jh_selectBtnCell_leftMargin:Jh_SelectBtnCell_LeftMargin;
    CGFloat kBtnHorizontalMargin = data.Jh_selectBtnCell_btnHorizontalMargin?data.Jh_selectBtnCell_btnHorizontalMargin:Jh_SelectBtnCell_BtnHorizontalMargin;
    CGFloat kBtnVerticalMargin = data.Jh_selectBtnCell_btnVerticalMargin?data.Jh_selectBtnCell_btnVerticalMargin:Jh_SelectBtnCell_BtnVerticalMargin;
    CGFloat kBtnHeight = data.Jh_selectBtnCell_btnHeight?data.Jh_selectBtnCell_btnHeight:Jh_SelectBtnCell_BtnHeight;
    CGFloat kBtnTitleBlank = data.Jh_selectBtnCell_btnTitleBlank?data.Jh_selectBtnCell_btnTitleBlank:Jh_SelectBtnCell_BtnTitleBlank;
    CGFloat kBtnIconSpace = data.Jh_selectBtnCell_btnIconSpace?data.Jh_selectBtnCell_btnIconSpace:Jh_SelectBtnCell_BtnIconSpace;
    CGFloat kBtnIconW = 20+kBtnIconSpace;
    
    //初始行_列的X、Y值设置
    CGFloat btnX = kBtnStartX;
    CGFloat btnY = kBtnVerticalMargin;
    for(int i = 0; i < tempArr.count; i++){
        //宽度自适应计算宽度
        CGFloat btnTextWidth = [tempArr[i] sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(MAXFLOAT,kBtnHeight)].width;
        //按钮文字左右加空白
        CGFloat btnWidth = btnTextWidth+kBtnTitleBlank*2 + (data.Jh_selectBtnCell_hiddenLeftIcon ? 0:kBtnIconW);
        //判断是否换行（宽度计算得知当前行不够放置时换行计算累加Y值）
        CGFloat rightViewWidth = Jh_SCRREN_WIDTH - data.Jh_titleWidth -Jh_CustumRightView_rightEdgeMargin;
        if (data.Jh_selectBtnCell_isSingleLineDisplay) {
            btnX = kBtnStartX;
            if (i!=0) {
                btnY += (kBtnHeight+kBtnVerticalMargin);//Y值累加，具体值请结合项目自身需求设置 （值 = 按钮高度+按钮间隙）
            }
        }else{
            if (btnX+btnWidth > rightViewWidth-kBtnStartX) {
                btnX = kBtnStartX;
                btnY += (kBtnHeight+kBtnVerticalMargin);//Y值累加，具体值请结合项目自身需求设置 （值 = 按钮高度+按钮间隙）
            }
        }
        //一个按钮添加之后累加X值后续计算使用
        btnX = btnX+btnWidth + kBtnHorizontalMargin;
    }
    CGFloat height = btnY + kBtnHeight + kBtnVerticalMargin;
    if(data.Jh_selectBtnCell_isTopTitleBottomOption){
        CGFloat titleHeight = data.Jh_title.length ? (Jh_EdgeMargin+Jh_TitleHeight):0;
        height = btnY + kBtnHeight + kBtnVerticalMargin + titleHeight;
    }
    return MAX(data.Jh_defaultHeight, height);
}

@end

@implementation UITableView (JhFormSelectBtnCell)

- (JhFormSelectBtnCell *)SelectBtnCellWithId:(NSString *)cellId {
    JhFormSelectBtnCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSelectBtnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end

