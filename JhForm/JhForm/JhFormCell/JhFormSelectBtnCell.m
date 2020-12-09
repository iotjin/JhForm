//
//  JhFormSelectBtnCell.m
//  JhForm
//
//  Created by Jh on 2020/10/26.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhFormSelectBtnCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"
#import "NSString+JhForm.h"
#import "UIImage+JhFormImage.h"

@interface JhFormSelectBtnCell ()

@property (nonatomic, strong) NSArray *btnTitleArray;
@property (nonatomic, strong) UIButton *currentSelectBtn;
@property (nonatomic, strong) NSMutableArray *selectTitleArray;
@property (nonatomic, strong) NSMutableArray *selectIndexArray;
@property (nonatomic, strong) UIView *custumRightView;

@end

@implementation JhFormSelectBtnCell

- (NSMutableArray *)selectTitleArray {
    if (!_selectTitleArray) {
        _selectTitleArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectTitleArray;
}

- (NSMutableArray *)selectIndexArray {
    if (!_selectIndexArray) {
        _selectIndexArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectIndexArray;
}

-(UIView *)custumRightView {
    if (!_custumRightView) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:view];
        _custumRightView = view;
        [self initBtn];
    }
    return _custumRightView;
}

-(void)initBtn {
    self.btnTitleArray = self.cellModel.Jh_selectBtnCell_btnTitleArr;
    
    CGFloat kBtnStartX = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_leftMargin, Jh_SelectBtnCell_LeftMargin);
    CGFloat kBtnHorizontalMargin = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnHorizontalMargin, Jh_SelectBtnCell_BtnHorizontalMargin);
    CGFloat kBtnVerticalMargin = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnVerticalMargin, Jh_SelectBtnCell_BtnVerticalMargin);
    CGFloat kBtnHeight = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnHeight, Jh_SelectBtnCell_BtnHeight);
    //按钮title左右空白大小
    CGFloat kBtnTitleBlank = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnTitleBlank, Jh_SelectBtnCell_BtnTitleBlank);
    //按钮图标和文字间距
    CGFloat kBtnIconSpace = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnIconSpace, Jh_SelectBtnCell_BtnIconSpace);
    CGFloat kBtnIconW = 20+kBtnIconSpace;
    CGFloat kBtnCornerRadius = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnCornerRadius, Jh_SelectBtnCell_BtnCornerRadius);
    CGFloat kBtnBorderWidth = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnBorderWidth, Jh_SelectBtnCell_BtnBorderWidth);
    
    UIColor *kBtnTitleColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnTitleColor, Jh_SelectBtnCell_BtnTitleColor);
    UIColor *kBtnTitleSelectColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnTitleSelectColor, Jh_SelectBtnCell_BtnTitleSelectColor);
    UIColor *kBtnBorderColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnBorderColor, Jh_SelectBtnCell_BtnBorderColor);
    UIColor *kBtnNormalBgColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnBgColor, Jh_SelectBtnCell_BtnBgColor);
    
    //初始行_列的X、Y值设置
    float btnX = kBtnStartX;//self.cellModel.Jh_selectBtnCell_leftMargin?
    float btnY = kBtnVerticalMargin;
    for (int i = 0; i < self.btnTitleArray.count; i++) {
        //宽度自适应计算宽度
        CGFloat btnTextWidth = [self.btnTitleArray[i] Jh_sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(MAXFLOAT,kBtnHeight)].width;
        //按钮文字左右加空白
        CGFloat btnWidth = btnTextWidth+kBtnTitleBlank*2 + (self.cellModel.Jh_selectBtnCell_hiddenLeftIcon ? 0:kBtnIconW);
        //判断是否换行（宽度计算得知当前行不够放置时换行计算累加Y值）
        CGFloat rightViewWidth = Jh_ScreenWidth - self.cellModel.Jh_titleWidth -Jh_RightMargin;
        if (self.cellModel.Jh_selectBtnCell_isSingleLineDisplay) {
            btnX = kBtnStartX;
            if (i!=0) {
                btnY += (kBtnHeight+kBtnVerticalMargin);//Y值累加，具体值请结合项目自身需求设置 （值 = 按钮高度+按钮间隙）
            }
        } else {
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
        if (!self.cellModel.Jh_selectBtnCell_hiddenLeftIcon) {
            NSString *unSelectImg = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_unSelectIcon, Jh_SelectBtnCell_UnSelectIcon);
            NSString *selectImg = self.cellModel.Jh_selectBtnCell_selectIcon?self.cellModel.Jh_selectBtnCell_selectIcon:(self.cellModel.Jh_selectBtnCell_isUseBlackSelectIcon?Jh_SelectBtnCell_SelectIcon2:Jh_SelectBtnCell_SelectIcon);
            UIImage *unSelectImage = [UIImage imageNamed:unSelectImg];
            UIImage *selectImage = [UIImage imageNamed:selectImg];
            
            if (self.cellModel.Jh_selectBtnCell_btnUnSelectIconColor) {
                unSelectImage = [unSelectImage Jh_imageWithTintColor:self.cellModel.Jh_selectBtnCell_btnUnSelectIconColor];
            }
            if (self.cellModel.Jh_selectBtnCell_btnSelectIconColor) {
                selectImage = [selectImage Jh_imageWithTintColor:self.cellModel.Jh_selectBtnCell_btnSelectIconColor];
            }
            [btn setImage:unSelectImage forState:UIControlStateNormal];
            [btn setImage:selectImage forState:UIControlStateSelected];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -kBtnIconSpace, 0, 0);
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(ClickButton:isInit:) forControlEvents:UIControlEventTouchUpInside];
        [self.custumRightView addSubview:btn];
        //一个按钮添加之后累加X值后续计算使用
        //        btnX = CGRectGetMaxX(btn.frame)+kBtnHorizontalMargin;
        btnX = btnX+btnWidth + kBtnHorizontalMargin;
        //如果设置默认选中数组，按设置的来，否则默认选中第一个
        if (self.cellModel.Jh_selectBtnCell_selectTitleArr) {
            for (int j=0; j< self.cellModel.Jh_selectBtnCell_selectTitleArr.count; j++) {
                NSString *tempStr = self.cellModel.Jh_selectBtnCell_selectTitleArr[j];
                //设置选中样式
                if ([self.btnTitleArray containsObject:tempStr] && [tempStr isEqualToString:self.btnTitleArray[i]]) {
                    [self ClickButton:btn isInit:YES];
                }
            }
        } else {
            //默认选中第一个
            if (i==0) {
                [self ClickButton:btn isInit:NO];
            }
        }
    }
}

-(void)ClickButton:(UIButton*)button isInit:(BOOL)isInit {
    UIColor *kBtnNormalBgColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnBgColor, Jh_SelectBtnCell_BtnBgColor);
    UIColor *kBtnSelectBgColor = Jh_SetValueAndDefault(self.cellModel.Jh_selectBtnCell_btnSelectBgColor, Jh_SelectBtnCell_BtnSelectBgColor);
    NSString *title = button.titleLabel.text;
    NSNumber *index = [NSNumber numberWithInteger:button.tag];
    //多选
    if (self.cellModel.Jh_selectBtnCell_isMultiSelect){
        if (!button.selected) {//没有选中过的先改变状态，再添加到保存按钮的数组中
            [self.selectTitleArray addObject:title];
            [self.selectIndexArray addObject:index];
            button.backgroundColor = kBtnSelectBgColor;
        } else {
            if ([self.selectTitleArray containsObject:title]) {
                [self.selectTitleArray removeObject:title];
            }
            if ([self.selectIndexArray containsObject:index]) {
                [self.selectIndexArray removeObject:index];
            }
            button.backgroundColor = kBtnNormalBgColor;
        }
        button.selected = !button.selected;
    } else {
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
        self.cellModel.Jh_selectBtnCell_selectTitleArr = self.selectTitleArray;
    }
    self.cellModel.Jh_selectBtnCell_selectIndexArr = self.selectIndexArray;
    //    NSLog(@" 选中的title数组 %@ ",self.cellModel.Jh_selectBtnCell_selectTitleArr);
    //    NSLog(@" 选中的index数组 %@ ",self.cellModel.Jh_selectBtnCell_selectIndexArr);
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    self.rightTextView.hidden = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat rightView_X = 0;
    if (!self.cellModel.Jh_title.length) {
        rightView_X = Jh_LeftMargin+Jh_InfoLeftMargin;
    } else {
        rightView_X = Jh_LeftMargin+self.cellModel.Jh_titleWidth+Jh_InfoLeftMargin;
    }
    self.custumRightView.frame =CGRectMake(rightView_X, 0, Jh_ScreenWidth - rightView_X - Jh_RightMargin,self.cellModel.Jh_cellHeight);
    //上下排列
    if(self.cellModel.Jh_selectBtnCell_isTopTitleBottomOption){
        self.titleLabel.frame = CGRectMake(Jh_LeftMargin, Jh_Margin, Jh_ScreenWidth - Jh_LeftMargin - Jh_RightMargin, Jh_TitleHeight);
        self.custumRightView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), Jh_ScreenWidth, self.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame));
    }
}

@end
