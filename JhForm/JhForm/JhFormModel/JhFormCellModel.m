//
//  JhFormCellModel.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCellModel.h"
#import "NSString+JhForm.h"

@interface JhFormCellModel()

/** JhFormCellModel_Add 快捷构建新增表单Cell  */
+ (instancetype)Jh_initWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType images:(NSArray *)images showPlaceholder:(BOOL)showPlaceholder;

@end

#pragma mark - ******************************* 快捷构建新增表单Cell ********************************

/**  默认 - 快捷构建新增表单Cell  */
inline JhFormCellModel *JhFormCellModel_AddCell(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType, BOOL editable, BOOL required, UIKeyboardType keyboardType) {
    return [JhFormCellModel Jh_initWithTitle:title info:info cellType:cellType editable:editable required:required keyboardType:keyboardType images:nil showPlaceholder:YES];
}

/** 快捷构建展示Cell（ 非必填，不可编辑 ） */
inline JhFormCellModel *JhFormCellModel_AddInfoCell(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType) {
    return [JhFormCellModel Jh_initWithTitle:title info:info cellType:cellType editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/** 快捷构建录入Cell（ 左标题，右录入框 (文字居左)，可编辑 ） */
inline JhFormCellModel *JhFormCellModel_AddInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required, UIKeyboardType keyboardType) {
    return [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypeInput editable:YES required:required keyboardType:keyboardType images:nil showPlaceholder:YES];
}

/** 快捷构建选择Cell（ 左标题，右文字(居左)，带箭头，可选择 ） */
inline JhFormCellModel *JhFormCellModel_AddSelectCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required) {
    return [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypeSelect editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:YES];
}

/** 快捷构建一个TextView录入类型的Cell（上标题，下TextView，可编辑，显示字数统计 ）*/
inline JhFormCellModel *JhFormCellModel_AddTextViewInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required) {
    JhFormCellModel *model = [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypeTextViewInput editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:YES];
    model.Jh_showLength = YES;
    return model;
}

/** 快捷构建密码录入Cell（ 左标题，右录入框 (居左)，可编辑 ） */
inline JhFormCellModel *JhFormCellModel_AddPwdInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required) {
    return [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypePwdInput editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:YES];
}

/** 快捷构建选择图片Cell */
inline JhFormCellModel *JhFormCellModel_AddImageCell(NSString * _Nonnull title, BOOL required) {
    return [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeSelectImage editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/** 快捷构建按钮单选或多选Cell （ 左标题，右文字按钮组，可选择 ）*/
inline JhFormCellModel *JhFormCellModel_AddSelectBtnCell(NSString * _Nonnull title,BOOL editable, BOOL required) {
    return [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeSelectBtn editable:editable required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/** 快捷构建右侧自定义View Cell */
inline JhFormCellModel *JhFormCellModel_AddCustumRightCell(NSString * _Nonnull title) {
    return [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeCustumRight editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/** 快捷构建底部自定义View Cell*/
inline JhFormCellModel *JhFormCellModel_AddCustumBottomCell(NSString * _Nonnull title) {
    return [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeCustumBottom editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/** 快捷构建完全自定义View Cell */
inline JhFormCellModel *JhFormCellModel_AddCustumALLViewCell(CGFloat cellHeight) {
    JhFormCellModel *model = [JhFormCellModel Jh_initWithTitle:nil info:nil cellType:JhFormCellTypeCustumALLView editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_cellHeight = cellHeight;
    return model;
}

/** 快捷构建 标题居中Cell */
inline JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title) {
    return [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeCenterTextCell editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

#pragma mark - 快速创建本文居右的Cell

/** 右文本 - 快捷添加一个info(居右)的 不可编辑 Cell */
inline JhFormCellModel *JhFormCellModel_AddRightTextCell(NSString * _Nonnull title, NSString * _Nullable info) {
    JhFormCellModel *model = [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypeInput editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    return model;
}

/** 右箭头 - 快捷添加一个info(居右)带箭头 Cell */
inline JhFormCellModel *JhFormCellModel_AddRightArrowCell(NSString * _Nonnull title, NSString * _Nullable info) {
    JhFormCellModel *model = [JhFormCellModel Jh_initWithTitle:title info:info cellType:JhFormCellTypeSelect editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    return model;
}

/** 右Switch - 快捷添加一个右侧为 SwitchBtn Cell */
inline JhFormCellModel *JhFormCellModel_AddSwitchBtnCell(NSString * _Nonnull title, BOOL Jh_switchBtn_on) {
    JhFormCellModel *model = [JhFormCellModel Jh_initWithTitle:title info:nil cellType:JhFormCellTypeSwitchBtn editable:YES required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    model.Jh_switchBtn_on = Jh_switchBtn_on;
    return model;
}

@implementation JhFormCellModel

+ (instancetype)Jh_initWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType images:(NSArray *)images showPlaceholder:(BOOL)showPlaceholder {
    return [[self alloc] initWithTitle:title info:info cellType:cellType editable:editable required:required keyboardType:keyboardType images:images showPlaceholder:showPlaceholder];
}


#pragma mark - ******************************* init ********************************

- (instancetype)initWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType images:(NSArray *)images showPlaceholder:(BOOL)showPlaceholder {
    self = [super init];
    if (self) {
        if (cellType == JhFormCellTypeSelectImage) {
            self.Jh_maxImageCount = Jh_SetValueAndDefault(self.Jh_maxImageCount, Jh_GlobalMaxImages);
            self.Jh_imageArr = images;
        }
        self.Jh_titleWidth = Jh_SetValueAndDefault(self.Jh_titleWidth, Jh_TitleWidth);
        self.Jh_titleFont = Jh_SetValueAndDefault(self.Jh_titleFont, Jh_TitleFont);
        self.Jh_infoFont = Jh_SetValueAndDefault(self.Jh_infoFont, Jh_InfoFont);
        self.Jh_title = title;
        self.Jh_info = info;
        self.Jh_cellType = cellType;
        self.Jh_editable = editable;
        self.Jh_required = required;
        self.Jh_keyboardType = keyboardType;
        self.Jh_showPlaceholder = showPlaceholder;
        
        [self setDefaultHeight:cellType];
        [self setTitleWithRequired:required title:title cellModelType:cellType];
        [self setPlaceholderWithShow:showPlaceholder cellModelType:cellType];
        if (cellType == JhFormCellTypeTextViewInput) {
            self.Jh_textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
        } else{
            self.Jh_textContainerInset = UIEdgeInsetsMake(2, 0, -2, 0);
        }
    }
    return self;
}

-(NSString *)Jh_cellClassName {
    if (!_Jh_cellClassName) {
        switch (self.Jh_cellType) {
            case JhFormCellTypeInput: return @"JhFormInputCell";
                break;
            case JhFormCellTypeSelect: return @"JhFormSelectCell";
                break;
            case JhFormCellTypeTextViewInput: return @"JhFormTextViewInputCell";
                break;
            case JhFormCellTypeCustumRight: return @"JhFormCustumRightCell";
                break;
            case JhFormCellTypeSwitchBtn:  return @"JhFormSwitchBtnCell";
                break;
            case JhFormCellTypeCenterTextCell: return @"JhFormCenterTextCell";
                break;
            case JhFormCellTypeCustumBottom: return @"JhFormCustumBottomCell";
                break;
            case JhFormCellTypeSelectImage:  return @"JhFormSelectImageCell";
                break;
            case JhFormCellTypePwdInput: return @"JhFormPwdCell";
                break;
            case JhFormCellTypeCustumALLView: return @"JhFormCustumALLViewCell";
                break;
            case JhFormCellTypeSelectBtn: return @"JhFormSelectBtnCell";
                break;
            default:
                break;
        }
    }
    return _Jh_cellClassName;
}

//表单Cell类型设置Cell默认高度
- (void)setDefaultHeight:(JhFormCellType)cellType {
    if(cellType ==JhFormCellTypeTextViewInput) {
        self.Jh_cellHeight = Jh_DefaultInputTextViewHeight+Jh_DefaultCellHeight+Jh_LineHeight;
    }
    else if(cellType ==JhFormCellTypeCustumBottom) {
        self.Jh_cellHeight = Jh_DefaultCustumBottomViewCellHeight;
    }
    else if(cellType ==JhFormCellTypeSelectImage) {
        [self updateSelectImageCellHeight];
    }
    else {
        self.Jh_cellHeight = Jh_DefaultCellHeight;
    }
}

//设置标题显示
- (void)setTitleWithRequired:(BOOL)required title:(NSString *)title cellModelType:(JhFormCellType)cellModelType {
    if (required) {
        if (Jh_TitleShowType == JhTitleShowTypeAddText) {
            switch (self.Jh_cellType) {
                case JhFormCellTypeInput:
                case JhFormCellTypePwdInput:
                case JhFormCellTypeTextViewInput:
                {
                    title = [NSString stringWithFormat:@"%@(必填)", title];
                }
                    break;
                case JhFormCellTypeSelect:
                case JhFormCellTypeSelectImage:
                case JhFormCellTypeSelectBtn:
                {
                    title = [NSString stringWithFormat:@"%@(必选)", title];
                }
                    break;
                default:
                    break;
            }
        }
    }
    _Jh_title = title;
}

//设置是否显示录入框占位字符
- (void)setPlaceholderWithShow:(BOOL)show cellModelType:(JhFormCellType)cellType {
    if (!show) {
        self.Jh_placeholder = @"";
        return;
    }
    switch (cellType) {
        case JhFormCellTypeInput:
        case JhFormCellTypePwdInput:
        case JhFormCellTypeTextViewInput:
        {
            self.Jh_placeholder = @"请输入";
        }
            break;
        case JhFormCellTypeSelect:
        {
            self.Jh_placeholder = @"请选择";
        }
            break;
        default:
            self.Jh_placeholder = @"";
            break;
    }
}

//更新标题高度
- (CGFloat )upDateJh_titleHeight {
    CGFloat titleHeight = Jh_TitleHeight;
    BOOL isCenter = self.Jh_cellTextVerticalCenter == YES || Jh_CellTextVerticalStyle == JhCellTextVerticalStyleCenter;
    if (self.Jh_titleMultiLineShow==YES || isCenter) {
        titleHeight = [NSString Jh_autoHeightWithString:self.Jh_title width:self.Jh_titleWidth font:self.Jh_titleFont];
    }
    return self.Jh_titleHeight = titleHeight;
}

//更新textView宽度
-(CGFloat )upDateJh_textViewWidth {
    CGFloat width = 0.0;
    if (self.Jh_cellType == JhFormCellTypeTextViewInput) {
        return self.Jh_textViewWidth = Jh_ScreenWidth - Jh_LeftMargin - Jh_RightMargin;
    }
    CGFloat leftImgWidth = self.Jh_leftImgName.length ? self.Jh_leftImgWH +self.Jh_leftImgRightMargin : 0;
    CGFloat rightBtnWidth = self.Jh_rightBtnWidth ? self.Jh_rightBtnWidth +Jh_RightViewLeftMargin: 0;
    if (!self.Jh_title.length) {
        width = (self.Jh_rightViewWidth>0) ? (Jh_LeftMargin+leftImgWidth +Jh_InfoLeftMargin+ Jh_RightViewLeftMargin+self.Jh_rightViewWidth +Jh_RightMargin) : (Jh_LeftMargin+Jh_InfoLeftMargin+rightBtnWidth+Jh_RightMargin);
    } else {
        width = (self.Jh_rightViewWidth>0) ? (Jh_LeftMargin+self.Jh_titleWidth+Jh_InfoLeftMargin+Jh_RightViewLeftMargin+self.Jh_rightViewWidth+Jh_RightMargin) : (Jh_LeftMargin+self.Jh_titleWidth+Jh_InfoLeftMargin+rightBtnWidth+Jh_RightMargin);
    }
    if (self.Jh_isShowArrow || (self.Jh_cellType == JhFormCellTypeSelect && !self.Jh_hiddenArrow) ) {
        width = width + Jh_rightArrowWidth;
    }
    return self.Jh_textViewWidth = Jh_ScreenWidth - width;
}

//更新textView高度
-(CGFloat )upDateJh_textViewHeight {
    CGFloat textViewWidth = [self upDateJh_textViewWidth];
    CGFloat marginLR = self.Jh_textContainerInset.left + self.Jh_textContainerInset.right;
    CGFloat marginTB = self.Jh_textContainerInset.top + self.Jh_textContainerInset.bottom;
    CGFloat textViewHeight = [NSString Jh_autoHeightWithString:self.Jh_info width:textViewWidth-marginLR font:self.Jh_infoFont] + marginTB;
    if (textViewHeight <= Jh_TitleHeight) {
        textViewHeight = Jh_TitleHeight;
    }
    if (self.Jh_showLength) {
        textViewHeight += 15;
    }
    if (self.Jh_cellType == JhFormCellTypeTextViewInput) {
        return self.Jh_textViewHeight = MAX(Jh_DefaultInputTextViewHeight,textViewHeight);
    }
    if (self.Jh_cellType == JhFormCellTypePwdInput) {
        return self.Jh_textViewHeight = Jh_DefaultCellHeight - 2*Jh_Margin;
    }
    return self.Jh_textViewHeight = textViewHeight;
}

//更新Cell高度，主要是左标题右info结构的cell
- (CGFloat )upDateInputCellHeight {
    CGFloat cellHeight = self.Jh_cellHeight;
    CGFloat titleHeight = [self upDateJh_titleHeight];
    CGFloat textViewHeight = [self upDateJh_textViewHeight];
    CGFloat textHeight = MAX(titleHeight, textViewHeight);
    if (textHeight + 2*Jh_Margin >= Jh_DefaultCellHeight) {
        cellHeight = textHeight  + 2*Jh_Margin;
    } else {
        cellHeight = cellHeight;
    }
    if (self.Jh_cellType == JhFormCellTypeTextViewInput) {
        CGFloat titleH = self.Jh_title.length ? Jh_DefaultCellHeight:0;
        if (textHeight > Jh_DefaultInputTextViewHeight) {
            cellHeight = textHeight +titleH+Jh_LineHeight+Jh_Margin;
        } else {
            cellHeight = Jh_DefaultInputTextViewHeight+titleH+Jh_LineHeight+Jh_Margin;
        }
    }
    CGFloat tipHeight = self.Jh_tipInfo.length ? Jh_TipInfoHeight : 0;
    return self.Jh_cellHeight = cellHeight + tipHeight;
}

#pragma mark - ******************************* cell 高度计算 ********************************

- (void)upDateJh_cellHeight {
    if (self.Jh_cellType == JhFormCellTypeSelectImage) {
        [self updateSelectImageCellHeight];
    } else if (self.Jh_cellType == JhFormCellTypeSelectBtn) {
        [self updateSelectBtnCellHeight];
    } else {
        [self upDateInputCellHeight];
    }
}

//选择图片高度自适应
-(void)updateSelectImageCellHeight {
    CGFloat titleHeight = self.Jh_title.length ? self.Jh_titleHeight+Jh_Margin*2 +Jh_LineHeight : 0;
    CGFloat tipHeight = self.Jh_tipInfo.length>0 ? Jh_TipInfoHeight + Jh_TipInfoTopMargin*2 : 0 ;
    CGFloat height = titleHeight + tipHeight;
#if kHasHXPhotoPicker
    NSInteger row = 1;
    NSInteger count = self.Jh_imageAllList.count;
    count = (self.Jh_noShowAddImgBtn == YES || count == self.Jh_maxImageCount)? count : count+1;
    row = count % Jh_ImageOneLineCount == 0 ? count / Jh_ImageOneLineCount : count / Jh_ImageOneLineCount + 1;
    CGFloat imageViewHeight = (row-1)*Jh_ImageMargin + row*Jh_ImageHeight;
    height += Jh_OnePhotoViewTopMargin*2 + imageViewHeight;
#endif
    self.Jh_cellHeight = height;
}

//选择按钮高度自适应
- (void)updateSelectBtnCellHeight {
    NSArray *tempArr = self.Jh_selectBtnCell_btnTitleArr;
    if (!tempArr.count) {
        return ;
    }
    CGFloat kBtnStartX = Jh_SetValueAndDefault(self.Jh_selectBtnCell_leftMargin, Jh_SelectBtnCell_LeftMargin);
    CGFloat kBtnHorizontalMargin = Jh_SetValueAndDefault(self.Jh_selectBtnCell_btnHorizontalMargin, Jh_SelectBtnCell_BtnHorizontalMargin);
    CGFloat kBtnVerticalMargin = Jh_SetValueAndDefault(self.Jh_selectBtnCell_btnVerticalMargin, Jh_SelectBtnCell_BtnVerticalMargin);
    CGFloat kBtnHeight = Jh_SetValueAndDefault(self.Jh_selectBtnCell_btnHeight, Jh_SelectBtnCell_BtnHeight);
    CGFloat kBtnTitleBlank = Jh_SetValueAndDefault(self.Jh_selectBtnCell_btnTitleBlank, Jh_SelectBtnCell_BtnTitleBlank);
    CGFloat kBtnIconSpace = Jh_SetValueAndDefault(self.Jh_selectBtnCell_btnIconSpace, Jh_SelectBtnCell_BtnIconSpace);
    CGFloat kBtnIconW = 20+kBtnIconSpace;
    //初始行_列的X、Y值设置
    CGFloat btnX = kBtnStartX;
    CGFloat btnY = kBtnVerticalMargin;
    for (int i = 0; i < tempArr.count; i++) {
        //宽度自适应计算宽度
        CGFloat btnTextWidth = [tempArr[i] Jh_sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(MAXFLOAT,kBtnHeight)].width;
        //按钮文字左右加空白
        CGFloat btnWidth = btnTextWidth+kBtnTitleBlank*2 + (self.Jh_selectBtnCell_hiddenLeftIcon ? 0:kBtnIconW);
        //判断是否换行（宽度计算得知当前行不够放置时换行计算累加Y值）
        CGFloat rightViewWidth = Jh_ScreenWidth - self.Jh_titleWidth -Jh_RightMargin;
        if (self.Jh_selectBtnCell_isSingleLineDisplay) {
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
        //一个按钮添加之后累加X值后续计算使用
        btnX = btnX+btnWidth + kBtnHorizontalMargin;
    }
    CGFloat height = btnY + kBtnHeight + kBtnVerticalMargin;
    if(self.Jh_selectBtnCell_isTopTitleBottomOption){
        CGFloat titleHeight = self.Jh_title.length ? (Jh_Margin+Jh_TitleHeight):0;
        height = btnY + kBtnHeight + kBtnVerticalMargin + titleHeight;
    }
    self.Jh_cellHeight = height;
}

#pragma mark -- 重写get方法
- (NSArray *)Jh_selectImageArr {
    NSMutableArray *tempImages = [NSMutableArray array];
    for (id temp in self.Jh_imageArr) {
        if ([temp isKindOfClass:[UIImage class]]) {
            [tempImages addObject:temp];
        }
    }
    return tempImages;
}

#pragma mark -- 重写属性set方法，防止单独改变属性无响应效果

-(void)setJh_cellTextVerticalCenter:(BOOL)Jh_cellTextVerticalCenter {
    _Jh_cellTextVerticalCenter = Jh_cellTextVerticalCenter;
    if (self.Jh_cellType == JhFormCellTypeSelect || self.Jh_cellType == JhFormCellTypeSwitchBtn) return;
    [self upDateJh_cellHeight];
}

-(void)setJh_titleMultiLineShow:(BOOL)Jh_titleMultiLineShow {
    _Jh_titleMultiLineShow = Jh_titleMultiLineShow;
    [self upDateJh_cellHeight];
}

-(void)setJh_required:(BOOL)Jh_required {
    _Jh_required = Jh_required;
    [self setTitleWithRequired:Jh_required title:self.Jh_title cellModelType:self.Jh_cellType];
    [self upDateJh_cellHeight];
}

-(void)setJh_cellType:(JhFormCellType)Jh_cellType {
    _Jh_cellType = Jh_cellType;
    [self setDefaultHeight:Jh_cellType];
    [self setTitleWithRequired:self.Jh_required title:self.Jh_title cellModelType:Jh_cellType];
    [self setPlaceholderWithShow:self.Jh_showPlaceholder cellModelType:Jh_cellType];
    [self upDateJh_cellHeight];
}

-(void)setJh_titleShowType:(JhTitleShowType)Jh_titleShowType {
    _Jh_titleShowType = Jh_titleShowType;
    [self setTitleWithRequired:self.Jh_required title:self.Jh_title cellModelType:self.Jh_cellType];
    [self upDateJh_cellHeight];
}

-(void)setJh_titleHiddenRedStar:(BOOL)Jh_titleHiddenRedStar {
    _Jh_titleHiddenRedStar = Jh_titleHiddenRedStar;
    if (Jh_titleHiddenRedStar ==YES) {
        self.Jh_titleShowType = JhTitleShowTypeOnlyTitle;
    } else {
        self.Jh_titleShowType = JhTitleShowTypeRedStarFront;
    }
}

-(void)setJh_title:(NSString *)Jh_title {
    _Jh_title = Jh_title;
    [self setTitleWithRequired:self.Jh_required title:Jh_title cellModelType:self.Jh_cellType];
    [self upDateJh_cellHeight];
}

-(void)setJh_titleFont:(CGFloat)Jh_titleFont {
    _Jh_titleFont = Jh_titleFont;
    [self upDateJh_cellHeight];
}

- (void)setJh_info:(NSString *)Jh_info {
    _Jh_info = Jh_info;
    [self upDateJh_cellHeight];
}

-(void)setJh_infoFont:(CGFloat)Jh_infoFont {
    _Jh_infoFont = Jh_infoFont;
    [self upDateJh_cellHeight];
}

-(void)setJh_titleWidth:(CGFloat)Jh_titleWidth {
    _Jh_titleWidth = Jh_titleWidth;
    if (self.Jh_cellType == JhFormCellTypeSelect || self.Jh_cellType == JhFormCellTypeSwitchBtn) return;
    [self upDateJh_cellHeight];
}

-(void)setJh_showPlaceholder:(BOOL)Jh_showPlaceholder {
    _Jh_showPlaceholder = Jh_showPlaceholder;
    [self setPlaceholderWithShow:Jh_showPlaceholder cellModelType:self.Jh_cellType];
}

- (void)setJh_rightViewWidth:(CGFloat)Jh_rightViewWidth {
    _Jh_rightViewWidth = Jh_rightViewWidth;
    [self upDateJh_cellHeight];
}

-(void)setJh_rightBtnWidth:(CGFloat)Jh_rightBtnWidth {
    _Jh_rightBtnWidth = Jh_rightBtnWidth;
    [self upDateJh_cellHeight];
}

-(void)setJh_showLength:(BOOL)Jh_showLength {
    _Jh_showLength = Jh_showLength;
    [self upDateJh_cellHeight];
}

-(void)setJh_textContainerInset:(UIEdgeInsets)Jh_textContainerInset{
    _Jh_textContainerInset = Jh_textContainerInset;
    [self upDateJh_cellHeight];
}

-(void)setJh_imageArr:(NSArray *)Jh_imageArr {
    _Jh_imageArr = Jh_imageArr;
    if (Jh_imageArr.count > self.Jh_maxImageCount) {
        _Jh_imageArr = [Jh_imageArr subarrayWithRange:NSMakeRange(0, self.Jh_maxImageCount)];
    }
    [self Jh_selectImageArr];
    [self updateSelectImageCellHeight];
}
#if kHasHXPhotoPicker
- (void)setJh_imageAllList:(NSArray<HXPhotoModel *> *)Jh_imageAllList {
    _Jh_imageAllList = Jh_imageAllList;
    [self updateSelectImageCellHeight];
}

- (void)setJh_mixImageArr:(NSArray<HXCustomAssetModel *> *)Jh_mixImageArr {
    _Jh_mixImageArr = Jh_mixImageArr;
    [self updateSelectImageCellHeight];
}
#endif

-(void)setJh_maxImageCount:(NSUInteger)Jh_maxImageCount {
    _Jh_maxImageCount =Jh_maxImageCount;
    [self updateSelectImageCellHeight];
}

-(void)setJh_tipInfo:(NSString *)Jh_tipInfo {
    _Jh_tipInfo = Jh_tipInfo;
    [self upDateJh_cellHeight];
}

// 选择按钮Cell
- (void)setJh_selectBtnCell_isSingleLineDisplay:(BOOL)Jh_selectBtnCell_isSingleLineDisplay{
    _Jh_selectBtnCell_isSingleLineDisplay = Jh_selectBtnCell_isSingleLineDisplay;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_isTopTitleBottomOption:(BOOL)Jh_selectBtnCell_isTopTitleBottomOption{
    _Jh_selectBtnCell_isTopTitleBottomOption = Jh_selectBtnCell_isTopTitleBottomOption;
    [self updateSelectBtnCellHeight];
}

- (void)setJh_selectBtnCell_btnTitleArr:(NSArray *)Jh_selectBtnCell_btnTitleArr{
    _Jh_selectBtnCell_btnTitleArr = Jh_selectBtnCell_btnTitleArr;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_selectTitleArr:(NSArray *)Jh_selectBtnCell_selectTitleArr{
    _Jh_selectBtnCell_selectTitleArr = Jh_selectBtnCell_selectTitleArr;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_hiddenLeftIcon:(BOOL)Jh_selectBtnCell_hiddenLeftIcon{
    _Jh_selectBtnCell_hiddenLeftIcon = Jh_selectBtnCell_hiddenLeftIcon;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_leftMargin:(CGFloat)Jh_selectBtnCell_leftMargin{
    _Jh_selectBtnCell_leftMargin = Jh_selectBtnCell_leftMargin;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_btnHorizontalMargin:(CGFloat)Jh_selectBtnCell_btnHorizontalMargin{
    _Jh_selectBtnCell_btnHorizontalMargin = Jh_selectBtnCell_btnHorizontalMargin;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_btnVerticalMargin:(CGFloat)Jh_selectBtnCell_btnVerticalMargin{
    _Jh_selectBtnCell_btnVerticalMargin = Jh_selectBtnCell_btnVerticalMargin;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_btnHeight:(CGFloat)Jh_selectBtnCell_btnHeight{
    _Jh_selectBtnCell_btnHeight = Jh_selectBtnCell_btnHeight;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_btnTitleBlank:(CGFloat)Jh_selectBtnCell_btnTitleBlank{
    _Jh_selectBtnCell_btnTitleBlank = Jh_selectBtnCell_btnTitleBlank;
    [self updateSelectBtnCellHeight];
}

-(void)setJh_selectBtnCell_btnIconSpace:(CGFloat)Jh_selectBtnCell_btnIconSpace{
    _Jh_selectBtnCell_btnIconSpace = Jh_selectBtnCell_btnIconSpace;
    [self updateSelectBtnCellHeight];
}

@end

