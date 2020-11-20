//
//  JhFormCellModel.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "NSString+JhForm.h"

static NSString *const JhUnitYuan = @"元";
static NSString *const JhUnitYear = @"年";
static NSString *const JhUnitMillion = @"万元";

@interface JhFormCellModel()

+ (instancetype)Jh_cellWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType;

+ (instancetype)Jh_cellWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType;

/// 输入类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_inputCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType;

/// 选择类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_selectCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required;

/// 选择图片的cell
+ (instancetype)Jh_imageCellWithTitle:(NSString *)title required:(BOOL)required;

/// 密码输入类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_pwdInputCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required;

/// 完全自定义类型的cell
+ (instancetype)Jh_custumALLViewCellWithCellHeight:(CGFloat)cellHeight;

/// 按钮单选或多选的cell
+ (instancetype)Jh_selectBtnWithTitle:(NSString *)title editable:(BOOL)editable required:(BOOL)required;

#pragma mark - 快速创建本文居右的 cell

/// 添加一个左标题，右文字(居右)、不可编辑的 cell
+ (instancetype)Jh_TextCellWithTitle:(NSString *)title info:(NSString *)info;
/// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
+ (instancetype)Jh_ArrowCellWithTitle:(NSString *)title info:(NSString *)info;
/// 添加一个左标题，右侧为 Switch 开关的 cell
+ (instancetype)Jh_SwitchBtnCellWithTitle:(NSString *)title switchBtn_on:(BOOL)Jh_switchBtn_on;

@end

inline JhFormCellModel *JhFormCellModel_Add(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType, BOOL editable, BOOL required, UIKeyboardType keyboardType) {
    return [JhFormCellModel Jh_cellWithTitle:title info:info cellType:cellType editable:editable required:required keyboardType:keyboardType];
}

inline JhFormCellModel *JhFormCellModel_Info(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType) {
    return [JhFormCellModel Jh_cellWithTitle:title info:info cellType:cellType];
}

/// 快捷添加一个输入类型的cell(默认样式,居左,可编辑)
inline JhFormCellModel *JhFormCellModel_AddInputCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required, UIKeyboardType keyboardType){
    return [JhFormCellModel Jh_inputCellWithTitle:title info:info required:required keyboardType:keyboardType];
}

/// 快捷添加一个选择类型的cell(默认样式,居左,可编辑)
inline JhFormCellModel *JhFormCellModel_AddSelectCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required){
    return [JhFormCellModel Jh_selectCellWithTitle:title info:info required:required];
}

/// 快捷添加一个选择图片的cell
inline JhFormCellModel *JhFormCellModel_AddImageCell(NSString * _Nonnull title, BOOL required) {
    return [JhFormCellModel Jh_imageCellWithTitle:title required:required];
}

/// 快捷添加一个密码输入类型的cell(默认样式,居左,可编辑)
inline JhFormCellModel *JhFormCellModel_AddPwdInputCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required) {
    return [JhFormCellModel Jh_pwdInputCellWithTitle:title info:info required:required];
}

/// 快捷添加一个完全自定义View的cell
inline JhFormCellModel *JhFormCellModel_AddCustumALLViewCell(CGFloat cellHeight) {
    return [JhFormCellModel Jh_custumALLViewCellWithCellHeight:cellHeight];
}

/// 快捷添加右侧自定义View cell
inline JhFormCellModel *JhFormCellModel_AddCustumRightCell(NSString * _Nonnull title) {
    return [JhFormCellModel Jh_cellWithTitle:title info:nil cellType:JhFormCellTypeCustumRight];
}

/// 快捷添加底部自定义View cell
inline JhFormCellModel *JhFormCellModel_AddCustumBottomCell(NSString * _Nonnull title) {
    return  [JhFormCellModel Jh_cellWithTitle:title info:nil cellType:JhFormCellTypeCustumBottom];
}

/// 快捷添加一个文本居中的 cell
inline JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title) {
    return [JhFormCellModel Jh_cellWithTitle:title info:nil cellType:JhFormCellTypeCenterTextCell];
}

/// 快捷添加一个按钮单选或多选的cell
inline JhFormCellModel *JhFormCellModel_AddSelectBtnCell(NSString * _Nonnull title, BOOL editable, BOOL required) {
    return [JhFormCellModel Jh_selectBtnWithTitle:title editable:editable required:required];
}

#pragma mark - 快速创建本文居右的 cell

/// 添加一个左标题，右文字(居右)、不可编辑的 cell
inline JhFormCellModel *JhFormCellModel_AddRightTextCell(NSString * _Nonnull title, NSString * _Nullable info) {
    return [JhFormCellModel Jh_TextCellWithTitle:title info:info];
}

/// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
inline JhFormCellModel *JhFormCellModel_AddRightArrowCell(NSString * _Nonnull title, NSString * _Nullable info) {
    return [JhFormCellModel Jh_ArrowCellWithTitle:title info:info];
}

/// 添加一个左标题，右侧为 Switch 开关的 cell
inline JhFormCellModel *JhFormCellModel_AddSwitchBtnCell(NSString * _Nonnull title, BOOL Jh_switchBtn_on) {
    return [JhFormCellModel Jh_SwitchBtnCellWithTitle:title switchBtn_on:Jh_switchBtn_on];
}

@implementation JhFormCellModel

+ (instancetype)Jh_cellWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType {
    return [[self alloc] initWithTitle:title info:info cellType:cellType editable:editable required:required keyboardType:keyboardType images:nil showPlaceholder:YES];
}

+ (instancetype)Jh_cellWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType {
    return [[self alloc] initWithTitle:title info:info cellType:cellType editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/// 输入类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_inputCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType {
    return [[self alloc] initWithTitle:title info:info cellType:JhFormCellTypeInput editable:YES required:required keyboardType:keyboardType images:nil showPlaceholder:YES];
}

/// 选择类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_selectCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required {
    return [[self alloc] initWithTitle:title info:info cellType:JhFormCellTypeSelect editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:YES];
}

/// 选择图片的cell
+ (instancetype)Jh_imageCellWithTitle:(NSString *)title required:(BOOL)required {
    return [[self alloc] initWithTitle:title info:nil cellType:JhFormCellTypeSelectImage editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/// 密码输入类型的cell(默认样式,居左,可编辑)
+ (instancetype)Jh_pwdInputCellWithTitle:(NSString *)title info:(NSString *)info required:(BOOL)required {
    return [[self alloc] initWithTitle:title info:info cellType:JhFormCellTypePwdInput editable:YES required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:YES];
}

/// 完全自定义类型的cell
+ (instancetype)Jh_custumALLViewCellWithCellHeight:(CGFloat)cellHeight {
    JhFormCellModel *model = [[self alloc] initWithTitle:@"" info:@"" cellType:JhFormCellTypeCustumALLView editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_defaultHeight = cellHeight;
    return model;
}

/// 按钮单选或多选的cell
+ (instancetype)Jh_selectBtnWithTitle:(NSString *)title editable:(BOOL)editable required:(BOOL)required {
    return [[self alloc] initWithTitle:title info:@"" cellType:JhFormCellTypeSelectBtn editable:editable required:required keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

/// 添加一个左标题，右文字(居右)、不可编辑的 cell
+ (instancetype)Jh_TextCellWithTitle:(NSString *)title info:(NSString *)info {
    JhFormCellModel *model = [[self alloc] initWithTitle:title info:info cellType:JhFormCellTypeInput editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    return model;
}

/// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
+ (instancetype)Jh_ArrowCellWithTitle:(NSString *)title info:(NSString *)info {
    JhFormCellModel *model = [[self alloc] initWithTitle:title info:info cellType:JhFormCellTypeSelect editable:YES required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    return model;
}

/// 添加一个左标题，右侧为 Switch 开关的 cell
+ (instancetype)Jh_SwitchBtnCellWithTitle:(NSString *)title switchBtn_on:(BOOL)Jh_switchBtn_on {
    JhFormCellModel *model = [[self alloc] initWithTitle:title info:nil cellType:JhFormCellTypeRightSwitchBtn editable:YES required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
    model.Jh_InfoTextAlignment = JhFormCellInfoTextAlignmentRight;
    model.Jh_switchBtn_on = Jh_switchBtn_on;
    return model;
}

/// MARK: 指定初始化方法
- (instancetype)initWithTitle:(NSString *)title info:(NSString *)info cellType:(JhFormCellType)cellType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType images:(NSArray *)images showPlaceholder:(BOOL)showPlaceholder {
    self = [super init];
    if (self) {
        self.Jh_cellUnitType = JhFormCellUnitTypeNone;
        self.Jh_maxInputLength = Jh_GlobalMaxInputLength;
        self.Jh_maxImageCount = (self.Jh_maxImageCount ? : Jh_GlobalMaxImages);
        self.Jh_titleWidth = (self.Jh_titleWidth ? : Jh_TitleWidth);
        self.Jh_title = title;
        self.Jh_info = info;
        self.Jh_cellType = cellType;
        self.Jh_editable = editable;
        self.Jh_required = required;
        self.Jh_titleShowType = JhTitleShowTypeRedStarFront;
        self.Jh_keyboardType = keyboardType;
        self.Jh_imageArr = images;
        self.Jh_showPlaceholder = showPlaceholder;
        [self jh_setDefaultHeight:cellType];
        [self jh_setPlaceholderWithShow:showPlaceholder cellModelType:cellType];
        [self jh_setAttributedTitleWithRequired:required title:title cellModelType:cellType];
    }
    return self;
}

/// MARK: 根据表单条目类型设置 cell 默认高度
- (void)jh_setDefaultHeight:(JhFormCellType)cellType {
    if(cellType == JhFormCellTypeTextViewInput) {
        self.Jh_defaultHeight = Jh_DefaultTextViewCellHeight;
    } else if (cellType == JhFormCellTypeCustumBottom) {
        self.Jh_defaultHeight = Jh_DefaultCustumBottomViewCellHeight;
    } else {
        self.Jh_defaultHeight = Jh_DefaultCellHeight;
    }
}

/// MARK: 设置是否显示输入框占位字符
- (void)jh_setPlaceholderWithShow:(BOOL)show cellModelType:(JhFormCellType)cellType {
    if (!show) {
        self.Jh_placeholder = @"";
        return;
    }
    
    switch (cellType) {
        case JhFormCellTypeInput:
        case JhFormCellTypePwdInput:
        case JhFormCellTypeTextViewInput: {
            self.Jh_placeholder = @"请输入";
            break;
        }
        case JhFormCellTypeSelect: {
            self.Jh_placeholder = @"请选择";
            break;
        }
        default:
            self.Jh_placeholder = @"";
            break;
    }
}

/// MARK: 设置默认标题呈现样式
/// 设置 Jh_title 属性后，最终会将属性字符串赋值到 Jh_attributedTitle 属性
- (void)jh_setAttributedTitleWithRequired:(BOOL)required title:(NSString *)title cellModelType:(JhFormCellType)cellModelType {
    // 1.设置默认标题文本
    if (required) {
        if (self.Jh_titleShowType == JhTitleShowTypeAddText) {
            // 标题后加必填文字，如: 标题(必填)
            switch (self.Jh_cellType) {
                case JhFormCellTypeInput:
                case JhFormCellTypePwdInput:
                case JhFormCellTypeTextViewInput: {
                    title = [NSString stringWithFormat:@"%@(必填)", title];
                    break;
                }
                case JhFormCellTypeSelect:
                case JhFormCellTypeSelectImage: {
                    title = [NSString stringWithFormat:@"%@(必选)", title];
                    break;
                }
                default:
                    break;
            }
        } else if (self.Jh_titleShowType == JhTitleShowTypeRedStarFront) {
            // 标题前部加红色*，如: *标题
            title = [NSString stringWithFormat:@"*%@", title];
        } else if (self.Jh_titleShowType == JhTitleShowTypeRedStarBack) {
            // 标题后部加红色*，如: 标题*
            title = [NSString stringWithFormat:@"%@*", title];
        }
    }
    
    // 2.设置默认标题颜色
    UIColor *titleColor = (self.Jh_titleTextColor ? : Jh_titleColor);
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Jh_TitleFont], NSForegroundColorAttributeName:titleColor}];
    if (@available(iOS 13.0, *)) {
        titleColor = (self.Jh_titleTextColor ? : UIColor.labelColor);
        [attributedTitle addAttribute:NSForegroundColorAttributeName value:titleColor range:NSMakeRange(0, title.length)];
    }
    
    // 将添加的“*”设置为红色字体
    if (required) {
        if (self.Jh_titleShowType == JhTitleShowTypeRedStarFront) {
            [attributedTitle addAttribute:NSForegroundColorAttributeName value:UIColor.redColor range:NSMakeRange(0, 1)];
        } else if (self.Jh_titleShowType == JhTitleShowTypeRedStarBack) {
            [attributedTitle addAttribute:NSForegroundColorAttributeName value:UIColor.redColor range:NSMakeRange(title.length - 1, 1)];
        }
    }
    
    // 将带有样式的属性字符串赋值到 _Jh_attributedTitle
    _Jh_attributedTitle = attributedTitle;
}

#pragma mark -- Getter

- (NSArray *)Jh_selectImageArr {
    NSMutableArray *tempImages = [NSMutableArray arrayWithCapacity:self.Jh_imageArr.count];
    [self.Jh_imageArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UIImage.class]) {
            [tempImages addObject:obj];
        }
    }];
    return [tempImages copy];
}

- (CGFloat)Jh_titleHeight {
    CGFloat titleHeight;
    if (self.Jh_titleMultiLineShow) {
        // 计算多行字符串的高度
        NSString *title = self.Jh_attributedTitle.string;
        titleHeight = [title heightWithFixedWidth:self.Jh_titleWidth textFont:Jh_TitleFont];
        titleHeight = ((titleHeight > Jh_TitleHeight) ? titleHeight + 5 : Jh_TitleHeight);
    } else {
        titleHeight = Jh_TitleHeight;
    }
    _Jh_titleHeight = titleHeight;
    return _Jh_titleHeight;
}

#pragma mark -- Setter

// 设置表单条目附带单位
- (void)setJh_cellUnitType:(JhFormCellUnitType)Jh_cellUnitType {
    NSString *tempUnit = self.Jh_unit? : @"";
    switch (Jh_cellUnitType) {
        case JhFormCellUnitTypeYuan: {
            tempUnit = JhUnitYuan;
            break;
        }
        case JhFormCellUnitTypeYear: {
            tempUnit = JhUnitYear;
            break;
        }
        case JhFormCellUnitTypeMillion: {
            tempUnit = JhUnitMillion;
            break;
        }
        default:
            break;
    }
    _Jh_unit = tempUnit;
}

// 根据单位设置单元格单位类别，防止单位与单元格式不一致
- (void)setJh_unit:(NSString *)Jh_unit {
    _Jh_unit =Jh_unit;
    if ([Jh_unit isEqualToString:@""]) {
        _Jh_cellUnitType = JhFormCellUnitTypeNone;
    } else if (Jh_unit == JhUnitYuan) {
        _Jh_cellUnitType = JhFormCellUnitTypeYuan;
    } else if (Jh_unit == JhUnitYear) {
        _Jh_cellUnitType = JhFormCellUnitTypeYear;
    } else if (Jh_unit == JhUnitMillion) {
        _Jh_cellUnitType = JhFormCellUnitTypeMillion;
    } else {
        _Jh_cellUnitType = JhFormCellUnitTypeCustom;
    }
}

- (void)setJh_imageArr:(NSArray *)Jh_imageArr {
    _Jh_imageArr =Jh_imageArr;
    [self Jh_selectImageArr];
}

- (void)setJh_title:(NSString *)Jh_title {
    _Jh_title = Jh_title;
    [self jh_setAttributedTitleWithRequired:self.Jh_required title:Jh_title cellModelType:self.Jh_cellType];
}

- (void)setJh_required:(BOOL)Jh_required {
    _Jh_required = Jh_required;
    [self jh_setAttributedTitleWithRequired:Jh_required title:self.Jh_title cellModelType:self.Jh_cellType];
}

- (void)setJh_cellType:(JhFormCellType)Jh_cellType {
    _Jh_cellType = Jh_cellType;
    [self jh_setDefaultHeight:Jh_cellType];
    [self jh_setAttributedTitleWithRequired:self.Jh_required title:self.Jh_title cellModelType:Jh_cellType];
    [self jh_setPlaceholderWithShow:self.Jh_showPlaceholder cellModelType:Jh_cellType];
}

- (void)setJh_showPlaceholder:(BOOL)Jh_showPlaceholder {
    _Jh_showPlaceholder = Jh_showPlaceholder;
    [self jh_setPlaceholderWithShow:Jh_showPlaceholder cellModelType:self.Jh_cellType];
}

- (void)setJh_placeholder:(NSString *)Jh_placeholder {
    _Jh_placeholder =Jh_placeholder;
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:(Jh_placeholder ? : @"") attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Jh_InfoFont],NSForegroundColorAttributeName:Jh_PlaceholderColor}];
    _Jh_attributedPlaceholder = attributedPlaceholder;
}

- (void)setJh_placeholderFont:(CGFloat)Jh_placeholderFont {
    _Jh_placeholderFont = Jh_placeholderFont;
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:(self.Jh_placeholder ? : @"") attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Jh_placeholderFont],NSForegroundColorAttributeName:Jh_PlaceholderColor}];
    self.Jh_attributedPlaceholder = attributedPlaceholder;
}

- (void)setJh_attributedPlaceholder:(NSAttributedString *)Jh_attributedPlaceholder {
    _Jh_attributedPlaceholder = (Jh_attributedPlaceholder ? : [[NSAttributedString alloc] initWithString:@""]);
}

- (void)setJh_tipsInfo:(NSString *)Jh_tipsInfo {
    _Jh_tipsInfo = Jh_tipsInfo;
    if (self.Jh_cellType == JhFormCellTypeSelectImage) {
        self.Jh_defaultHeight += 25;
    }
}

- (void)setJh_titleShowType:(JhTitleShowType)Jh_titleShowType {
    _Jh_titleShowType = Jh_titleShowType;
    [self jh_setAttributedTitleWithRequired:self.Jh_required title:self.Jh_title cellModelType:self.Jh_cellType];
}

- (void)setJh_titleHiddenRedStar:(BOOL)Jh_titleHiddenRedStar {
    _Jh_titleHiddenRedStar = Jh_titleHiddenRedStar;
    self.Jh_titleShowType = (Jh_titleHiddenRedStar ? JhTitleShowTypeOnlyTitle : JhTitleShowTypeRedStarFront);
}

- (void)setJh_titleTextColor:(UIColor *)Jh_titleTextColor {
    _Jh_titleTextColor = Jh_titleTextColor;
    [self jh_setAttributedTitleWithRequired:self.Jh_required title:self.Jh_title cellModelType:self.Jh_cellType];
}

@end
