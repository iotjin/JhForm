//
//  JhFormCellModel.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <HXPhotoPicker.h>

/** 图标  CheckBox   未选中 */
#define kIcon_CheckBoxNormal @"JhForm.bundle/ic_checkbox_normal"
/** 图标  CheckBox   选中 */
#define kIcon_CheckBoxSelect @"JhForm.bundle/ic_checkbox_select"
/** 图标  CheckBox   选中2 */
#define kIcon_CheckBoxSelect2 @"JhForm.bundle/ic_checkbox_select2"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

/// cell 类型
typedef NS_ENUM(NSInteger, JhFormCellType) {
    JhFormCellTypeInput = 0,      // 输入框样式，可单行或多行输入（标题居左）
    JhFormCellTypeSelect,         // 选择器样式（标题居左）
    JhFormCellTypeTextViewInput,  // 可多行输入（标题居上）
    JhFormCellTypeCustumRight,    // 右侧自定义
    JhFormCellTypeRightSwitchBtn, // 右侧是 Switch 开关按钮
    JhFormCellTypeCenterTextCell, // 文字在cell中间
    JhFormCellTypeCustumBottom,   // 底部自定义
    JhFormCellTypeSelectImage,    // 图片选择器
    JhFormCellTypePwdInput,       // 密码输入框样式
    JhFormCellTypeCustumALLView,  // 完全自定义
    JhFormCellTypeSelectBtn,      // 单选按钮、多选按钮
};

/// cell 单位类别
typedef NS_ENUM(NSInteger, JhFormCellUnitType) {
    JhFormCellUnitTypeNone = 0, // 无单位
    JhFormCellUnitTypeYuan,     // 元
    JhFormCellUnitTypeYear,     // 年
    JhFormCellUnitTypeMillion,  // 万元
    JhFormCellUnitTypeCustom,   // 自定义单位
};

/// info 文字在水平方向上的对齐方式
typedef NS_ENUM(NSInteger, JhFormCellInfoTextAlignmentStyle) {
    JhFormCellInfoTextAlignmentLeft = 0, // 水平左对齐，离初始位置默认10
    JhFormCellInfoTextAlignmentRight,    // 水平右对齐，离初始位置默认10
};

/// 必选条目，标题呈现样式
typedef NS_ENUM(NSInteger, JhTitleShowType) {
    JhTitleShowTypeOnlyTitle = 0, // 仅显示标题
    JhTitleShowTypeAddText,       // 标题后加必填文字，如: 标题(必填)
    JhTitleShowTypeRedStarFront,  // 标题前部加红色*，如: *标题
    JhTitleShowTypeRedStarBack,   // 标题后部加红色*，如: 标题*
};

/// 选择图片类型
typedef NS_ENUM(NSInteger, JhSelectImageType) {
    JhSelectImageTypeImage = 0, // 图片
    JhSelectImageTypeVideo,     // 视频
    JhSelectImageTypeAll,       // 图片和视频
};

typedef void(^JhCellRightViewBlock)(UIView *RightView);
typedef void(^JhCellSelectCellBlock)(JhFormCellModel *cellModel);
typedef void(^JhCellCustumRightViewBlock)(UIView *RightView);
typedef void(^JhCellCustumBottomViewBlock)(UIView *BottomView);
typedef void(^JhCellCustumALLViewBlock)(UIView *AllView);
typedef void (^JhCellSwitchBtnBlock)(BOOL switchBtn_on, UISwitch *switchBtn);
/** 获取输入内容 和 输入状态 */
typedef void(^JhInputBlock)(NSString *text, BOOL isInputCompletion);

/// 对表单条目提供动态配置
@interface JhFormCellModel : NSObject

/** 右侧设置自定义视图，需要先设置 Jh_rightViewWidth */
@property (nonatomic, copy, nullable) JhCellRightViewBlock Jh_rightViewBlock;
/** 右侧自定义视图的 Block (左默认120，右5，高是cell的高) */
@property (nonatomic, copy, nullable) JhCellCustumRightViewBlock Jh_custumRightViewBlock;
/** 底部自定义视图的 Block (左0，右0，高默认240) */
@property (nonatomic, copy, nullable) JhCellCustumBottomViewBlock Jh_custumBottomViewBlock;
/** 完全自定义视图的 Block (左15，右15，高需要设置) */
@property (nonatomic, copy, nullable) JhCellCustumALLViewBlock Jh_custumALLViewBlock;

/** Switch 开关按钮的 Block  */
@property (nonatomic, copy) JhCellSwitchBtnBlock Jh_switchBtnBlock;
/** 点击居中文本的 Block */
@property (nonatomic, copy) void(^JhCellClickCenterTextBlock)(void);
/** 获取输入内容 和 输入状态（是否输入完成）的 Block */
@property (nonatomic, copy) JhInputBlock JhInputBlock;
/** 点击 cell 时执行的 Block */
@property (nonatomic, copy, nullable) JhCellSelectCellBlock Jh_CellSelectCellBlock;

/** cell 默认高度，默认值为 44.0f, 可根据需求设置(如果设置底部自定义view 最好设置view的高度+60 ) */
@property (nonatomic, assign) CGFloat Jh_defaultHeight;

/** cell 类型 */
@property (nonatomic, assign) JhFormCellType Jh_cellType;

/** 必选条目，标题呈现样式(默认标题前加红星，Jh_leftTitleHiddenRedStar 可隐藏整个页面的红星按只有标题显示) */
@property (nonatomic, assign) JhTitleShowType Jh_titleShowType;

/** 键盘类型 */
@property (nonatomic, assign) UIKeyboardType Jh_keyboardType;

/** cell 是否可编辑 */
@property (nonatomic, assign) BOOL Jh_editable;

/** cell 是否必填(必选)，必填(必选)/可填(可选) */
@property (nonatomic, assign) BOOL Jh_required;

/** cell 附带单位 */
@property (nonatomic, copy, nullable) NSString *Jh_unit;

/** cell 单位类别 */
@property (nonatomic, assign) JhFormCellUnitType Jh_cellUnitType;

/** cell 背景颜色 */
@property (nonatomic, strong) UIColor *Jh_cellBgColor;

/** 隐藏左侧小红星(把 JhTitleShowType 改为默认) */
@property (nonatomic, assign) BOOL Jh_titleHiddenRedStar;

/** 如果设置该属性为 YES，则整个 cell 不可编辑 */
@property (nonatomic, assign) BOOL Jh_Cell_NoEdit;

/**
 设置单个界面的 cell 文字垂直居中 ，JhFormCellTypeInput，JhFormCellTypeSelect ，JhFormCellTypeSelectBtn 样式生效
 
 默认值为 false，JhFormConst 文件的 Jh_CellTextVerticalStyle 可全局设置居中或居上
 */
@property (nonatomic, assign) BOOL Jh_cellTextVerticalCenter;

/**
 标题换行展示 (默认值为 NO，单行展示)
 
 可生效的 cell：JhFormInputCell,JhFormPwdCell,JhFormSelectCell,JhFormCustumRightCell
 */
@property (nonatomic, assign) BOOL Jh_titleMultiLineShow;


#pragma mark - 标题相关

/** title 的宽度，默认值为 100，若标题太长，不想牺牲字体大小，可设置宽度 */
@property (nonatomic, assign) CGFloat Jh_titleWidth;
/** title 的高度（一般不用设置，设置 Jh_title 后，内部会自动计算高度）*/
@property (nonatomic, assign) CGFloat Jh_titleHeight;

/**
 表单条目标题，表单标题为单行显示，尽可能简短，若标题太长，会牺牲字体大小以达到显示完全的效果 (左侧标题)
 
 Jh_title为空时,只显示右侧控件(可生效的cell:JhFormInputCell,JhFormPwdCell,JhFormSelectCell,JhFormTextViewInputCell,JhFormCustumRightCell)
 */
@property (nonatomic, copy, nonnull) NSString *Jh_title;
@property (nonatomic, strong, nonnull) NSAttributedString *Jh_attributedTitle;

/** 标题文字颜色 */
@property (nonatomic, strong) UIColor *Jh_titleTextColor;


#pragma mark - info 相关

/** 表单条目详情 (右侧Text) */
@property (nonatomic, copy, nullable) NSString *Jh_info;

/** 表单条目详情 (右侧Text对应的IdStr) */
@property (nonatomic, copy) NSString *Jh_info_idStr;

/** 是否显示表单条目占位字符 YES:显示 NO:不显示 --- 新增 default is YES；详情 default is NO */
@property (nonatomic, assign) BOOL Jh_showPlaceholder;

/** 表单条目占位字符（右侧占位字符） */
@property (nonatomic, copy, nullable) NSString *Jh_placeholder;
@property (nonatomic, strong, nullable) NSAttributedString *Jh_attributedPlaceholder;

/** 表单条目占位字符字体大小（默认为 #15） */
@property (nonatomic, assign) CGFloat Jh_placeholderFont;

/** 表单条目右侧文本的排列方式, (居左,居右 ,默认居左,只在选择和输入样式下生效) */
@property (nonatomic, assign) JhFormCellInfoTextAlignmentStyle Jh_InfoTextAlignment;

/** 是否显示右侧箭头 (只在CustumRightCell样式下生效,默认不显示) */
@property (nonatomic, assign) BOOL Jh_custumRightCellShowArrow;

/**
 右侧自定义 view 的宽度，和 Jh_rightViewBlock 配合使用
 
 Jh_rightViewBlock 使用之前要先设置宽度
 JhFormInputCell，JhFormPwdCell，JhFormSelectCell，生效
 */
@property (nonatomic, assign) CGFloat Jh_rightViewWidth;

/**
 JhFormCellTypeInput 以及 JhFormCellTypeTextViewInput 类别中表示最大输入字数 (默认50)
 
 0 表示无限制
 */
@property (nonatomic, assign) NSUInteger Jh_maxInputLength;


#pragma mark - Select Cell

/** 是否隐藏右侧箭头(只对选择样式cell起作用) */
@property (nonatomic, assign) BOOL  Jh_hiddenArrow;
/** 选择Cell  左侧图片宽高，默认Jh_LeftImgWH配置（24）  */
@property (nonatomic, assign) CGFloat  Jh_leftImgWH;
/** 选择Cell  左侧图片名称  */
@property (nonatomic, strong) NSString *Jh_leftImgName;
/** 选择Cell  左侧图片右侧间距 默认Jh_LeftImgRightMargin配置（10）  */
@property (nonatomic, assign) CGFloat  Jh_leftImgRightMargin;
/** 选择Cell  右侧文字颜色，SelectCell 生效*/
@property (nonatomic, strong) UIColor *Jh_infoTextColor;
/** 选择Cell  下划线左间距  */
@property (nonatomic, assign) CGFloat Jh_lineLeftMargin;
/** 隐藏下划线（选择 Cell 和 完全自定义Cell生效） */
@property (nonatomic, assign) BOOL  Jh_hiddenLine;


#pragma mark - SwitchBtn Cell

/** 表单条目右侧 SwitchBtn 开关状态 */
@property (nonatomic, assign) BOOL Jh_switchBtn_on;
/** 表单条目右侧 SwitchBtn 开关处于开启状态时的颜色 */
@property (nonatomic, strong) UIColor  *Jh_switchOnTintColor;
/** 表单条目右侧 SwitchBtn 开关处于关闭状态时边框的颜色(注意这边是边框的颜色) */
@property (nonatomic, strong) UIColor  *Jh_switchTintColor;


#pragma mark - SelectImage Cell

/**
 图片选择 Cell 图片数组，支持 UIImage、NSURL、NSString(图片 URLString) 类型元素
 
 Jh_selectImageType == JhSelectImageTypeImage 时使用此参数
 */
@property (nonatomic, strong, nullable) NSArray *Jh_imageArr;

/** 是否隐藏添加图片按钮，默认显示 */
@property (nonatomic, assign) BOOL Jh_noShowAddImgBtn;

/** 是否隐藏图片右上角删除按钮，默认显示*/
@property (nonatomic, assign) BOOL Jh_hideDeleteButton;

/** images 图片数组中类型筛选出为 UIImage 的数组子集，以实现图片上传筛选 */
@property (nonatomic, strong, readonly) NSArray *Jh_selectImageArr;

/** JhFormCellTypeImage 类别中表示最大选择图片数，默认8 */
@property (nonatomic, assign) NSUInteger Jh_maxImageCount;

/** 选择图片底部的提示文字，默认不设置, 显示图片 cell 左下角 */
@property (nonatomic, strong) NSString *Jh_tipsInfo;

/** 选择图片底部提示文字的颜色 */
@property (nonatomic, strong) UIColor *Jh_tipsInfoColor;

/**
 选择图片类型（默认仅选图片，可设置仅选视频，或都选 ）
 
 仅选图片，使用 Jh_imageArr 或J h_selectImageArr 可获取图片资源
 仅选视频，使用 Jh_selectVideoArr 获取视频 URL 链接
 选图片和视频，使用 Jh_imageArr 和 Jh_selectVideoArr 分别获取数据，或使用 Jh_imageAllList 自定义获取所有资源
 */
@property (nonatomic, assign) JhSelectImageType Jh_selectImageType;

/** 图片选择 Cell，所有的图片 model 数组 */
@property (nonatomic, strong) NSArray<HXPhotoModel *> *Jh_imageAllList;

/** 图片选择 Cell，选择的视频数组，NSURL格式（ Jh_selectImageType == JhSelectImageTypeVideo 时此参数生效） */
@property (nonatomic, strong) NSArray *Jh_selectVideoArr;

/** 图片选择 Cell，混合资源数组，初始化时使用，可展示在线图片或视频资源（Jh_imageArr也可初始化网络图片，此参数优先级高于Jh_imageArr ） */
@property (nonatomic, strong) NSArray<HXCustomAssetModel*> *Jh_initImageArr;

/** 拍摄的 照片/视频 是否不保存到系统相册，默认保存 */
@property (nonatomic, assign) BOOL Jh_imageNoSaveAblum;

/** 相机视频录制最小秒数，默认3s */
@property (nonatomic, assign) NSTimeInterval Jh_videoMinimumDuration;


#pragma mark - TextViewInputCell

/**
 是否显示当前输入字数，默认不显示
 
 只在 JhFormCellTypeTextViewInput 类型下有效，若无最大字数限制，则只显示字数； 若有字数限制，则显示 "当前字数/最大字数"
 */
@property (nonatomic, assign) BOOL Jh_showLength;


#pragma mark - 选择按钮 Cell

/** 选择按钮Cell，是否多选，默认单选*/
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isMultiSelect;
/** 选择按钮Cell，是否单行展示（一个选项一行），默认自适应 */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isSingleLineDisplay;
/** 选择按钮Cell，是否按上标题下选项排列展示，默认左右 */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isTopTitleBottomOption;

/** 选择按钮Cell，标题数组  */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_btnTitleArr;
/** 选择按钮Cell，选中title数组，如需初始化时设置选中，使用此参数 ，不设置默认选中第一个 */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_selectTitleArr;
/** 选择按钮Cell，选中index数组，如需初始化时设置选中，使用title数组  */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_selectIndexArr;
/** 选择按钮Cell，是否隐藏左侧图标 */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_hiddenLeftIcon;

/** 选择按钮Cell，按钮左间距，默认10 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_leftMargin;
/** 选择按钮Cell，按钮水平间距，默认10 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnHorizontalMargin;
/** 选择按钮Cell，按钮垂直间距，默认10 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnVerticalMargin;
/** 选择按钮Cell，按钮高度，默认24 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnHeight;
/** 选择按钮Cell，按钮title左右空白大小 ，默认10*/
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnTitleBlank;
/** 选择按钮Cell，按钮图标和文字间距，默认10 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnIconSpace;
/** 选择按钮Cell，按钮圆角，默认0 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnCornerRadius;
/** 选择按钮Cell，按钮边框宽度，默认0 */
@property (nonatomic, assign) CGFloat Jh_selectBtnCell_btnBorderWidth;
/** 选择按钮Cell，按钮标题颜色，默认Jh_rightTextViewTextColor */
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnTitleColor;
/** 选择按钮Cell，按钮标题选中颜色 ，默认Jh_rightTextViewTextColor  */
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnTitleSelectColor;
/** 选择按钮Cell，按钮边框颜色，默认grayColor */
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnBorderColor;
/** 选择按钮Cell，按钮默认背景颜色，默认whiteColor */
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnBgColor;
/** 选择按钮Cell，按钮选中背景颜色，默认whiteColor */
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnSelectBgColor;

/** 选择按钮Cell，选中图标 */
@property (nonatomic, strong) NSString *Jh_selectBtnCell_selectIcon;
/** 选择按钮Cell，未选中图标 */
@property (nonatomic, strong) NSString *Jh_selectBtnCell_unSelectIcon;
/** 选择按钮Cell，是否使用黑色选中图标 ，默认no */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isUseBlackSelectIcon;

/** 选择按钮Cell，未选中图标 颜色*/
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnUnSelectIconColor;
/** 选择按钮Cell，选中图标 颜色*/
@property (nonatomic, strong) UIColor *Jh_selectBtnCell_btnSelectIconColor;


#pragma mark - 备用字段

/** 添加一些备用字段 */
@property (nonatomic, strong) NSString  *Jh_temp1;
@property (nonatomic, strong) NSString  *Jh_temp2;
@property (nonatomic, strong) NSString  *Jh_temp3;
@property (nonatomic, strong) NSString  *Jh_temp4;
@property (nonatomic, assign) BOOL       Jh_temp5;
@property (nonatomic, assign) BOOL       Jh_temp6;
@property (nonatomic, assign) NSInteger  Jh_temp7;
@property (nonatomic, assign) NSInteger  Jh_temp8;
@property (nonatomic, strong) NSMutableArray *Jh_tempMArr;

@end


#pragma mark - 便捷方法

/**
 JhFormCellModel_Add 快捷构建新增表单条目
 
 @param title 标题
 @param info 详情
 @param cellType 条目类别
 @param editable 是否可编辑
 @param required 是否必填
 @param keyboardType 键盘类别
 */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_Add(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType, BOOL editable, BOOL required, UIKeyboardType keyboardType);

/** 快捷添加一个详情表单条目 (非必选,不可编辑) */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_Info(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType);

/** 快捷添加一个输入类型的 cell，默认样式：居左，可编辑*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddInputCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required, UIKeyboardType keyboardType);

/** 快捷添加一个选择类型的 cell，默认样式：居左 */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSelectCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required);

/** 快捷添加一个选择图片的 cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddImageCell(NSString * _Nonnull title, BOOL required);

/** 快捷添加一个文本居中的 cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title);

/** 快捷添加右侧自定义View cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumRightCell(NSString * _Nonnull title);

/** 快捷添加底部自定义View cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumBottomCell(NSString * _Nonnull title);

/** 快捷添加一个文本居中的 cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title);

/** 快捷添加一个密码输入类型的cell，默认样式：居左，可编辑 */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddPwdInputCell(NSString * _Nonnull title, NSString * _Nullable info, BOOL required);

/** 快捷添加一个完全自定义View的cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumALLViewCell(CGFloat cellHeight);

/** 快捷添加一个按钮单选或多选的cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSelectBtnCell(NSString * _Nonnull title, BOOL editable, BOOL required);

#pragma mark - 快速创建本文居右的 cell
// !!!: 以下方法快捷创建的 cell 不是必选的，如果需要设置为必选类型，请设置 Jh_required 属性值为 YES。

/// 添加一个左标题，右文字(居右)、不可编辑的 cell
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightTextCell(NSString * _Nonnull title, NSString * _Nullable info);

/// 添加一个左标题，右文字(居右)、带右箭头的可选择 cell
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightArrowCell(NSString * _Nonnull title, NSString * _Nullable info);

/// 添加一个左标题，右侧为 Switch 开关的 cell
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSwitchBtnCell(NSString * _Nonnull title, BOOL Jh_switchBtn_on);

NS_ASSUME_NONNULL_END
