//
//  JhFormCellModel.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  主要对表单Cell提供动态配置属性

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JhFormConst.h"

#define kHasHXPhotoPicker (__has_include(<HXPhotoPicker.h>) || __has_include("HXPhotoPicker.h"))

#if kHasHXPhotoPicker
#import "HXPhotoPicker.h"
#endif


NS_ASSUME_NONNULL_BEGIN

/// cell 类型
typedef NS_ENUM(NSInteger, JhFormCellType) {
    JhFormCellTypeInput = 0,      // 录入框样式，可单行或多行录入（标题居左）
    JhFormCellTypeSelect,         // 选择器样式（标题居左）
    JhFormCellTypeTextViewInput,  // 多行录入（标题居上）
    JhFormCellTypePwdInput,       // 密码录入框样式
    JhFormCellTypeSelectImage,    // 图片选择器
    JhFormCellTypeSelectBtn,      // 单选按钮、多选按钮
    JhFormCellTypeCustumRight,    // 右侧自定义
    JhFormCellTypeCustumBottom,   // 底部自定义
    JhFormCellTypeCustumALLView,  // 完全自定义
    JhFormCellTypeSwitchBtn,      // 右侧是 Switch 开关按钮
    JhFormCellTypeCenterTextCell, // 标题居中
};

/// info 文字在水平方向上的对齐方式
typedef NS_ENUM(NSInteger, JhFormCellInfoTextAlignmentStyle) {
    JhFormCellInfoTextAlignmentLeft = 0, // 水平左对齐，离初始位置默认10
    JhFormCellInfoTextAlignmentRight,    // 水平右对齐，离初始位置默认10
};

/// 选择图片类型
typedef NS_ENUM(NSInteger, JhSelectImageType) {
    JhSelectImageTypeImage = 0, // 图片
    JhSelectImageTypeVideo,     // 视频
    JhSelectImageTypeAll,       // 图片和视频
};



@interface JhFormCellModel : NSObject


/** 点击 Cell 的 Block */
@property (nonatomic,   copy) void(^Jh_cellSelectBlock)(JhFormCellModel *cellModel);

/** 获取当前录入文字 和 录入状态 （ 0、开始录入；1、发生改变；2、录入完成）  */
@property (nonatomic,   copy) void(^Jh_cellInputBlock)(NSString *inputText,NSInteger inputStates);

/**
 右侧设置自定义视图，需要先设置 Jh_rightViewWidth
 
 默认 左120，infoView宽度，+5+右10，高是cell的高
 custumRightViewCell (左默认120，右10，高是cell的高，无需先设置宽度，直接使用)
 */
@property (nonatomic,   copy) void(^Jh_rightViewBlock)(UIView *rightView);

/** 表单Cell，右侧按钮点击回调 */
@property (nonatomic,   copy) void(^Jh_rightBtnClickBlock)(UIButton *button);

/**
 完全自定义视图的 Block
 (左Jh_LeftMargin（15），右Jh_RightMargin（10），高是cell的高 )
 */
@property (nonatomic,   copy) void(^Jh_custumALLViewBlock)(UIView *allView);

/**
 底部自定义视图的 Block
 (左Jh_LeftMargin（15），右Jh_RightMargin（10），高是cell的高 )
 */
@property (nonatomic,   copy) void(^Jh_custumBottomViewBlock)(UIView *bottomView);

/** Switch 开关按钮的 Block  */
@property (nonatomic,   copy) void(^Jh_switchBtnBlock)(BOOL switchBtn_on, UISwitch *switchBtn);

@property (nonatomic,   copy) void(^Jh_imageSelectBlock)(NSArray *imageArr);


#pragma mark - Cell 创建相关

/// Cell 类型
@property (nonatomic, assign) JhFormCellType Jh_cellType;

/// Cell 类名，必需设置，不能为空，Cell 注册时使用
@property (nonatomic, strong, nonnull) NSString * Jh_cellClassName;

/// Cell ID，不能为空，Cell 注册时使用 （默认根据Jh_cellClassName、section、row拼接组成 ）
@property (nonatomic, strong, nonnull) NSString * Jh_cellIdentifier;

/// 是否是XIb创建的Cell ，默认NO
@property (nonatomic, assign) BOOL Jh_isXibCell;


#pragma mark - ******************************* Cell 数据相关 ********************************

/** 可以作为参数名  */
@property (nonatomic, strong) NSString *Jh_key;

/** 可以存储要跳转的类名  */
@property (nonatomic, assign) Class Jh_jumpClassName;

/**
 表单左侧标题，表单标题默认单行显示，尽可能简短，若标题太长，会牺牲字体大小以达到显示完全的效果
 默认居上，Jh_cellTextVerticalCenter可设置文字居中，Jh_titleMultiLineShow 可设置换行
 
 Jh_title为空时,只显示右侧控件
 */
@property (nonatomic, strong) NSString *__nullable Jh_title;

/** 表单Cell 详情 (右侧TextView) */
@property (nonatomic,   copy) NSString *__nullable Jh_info;

/** 表单Cell 详情 (右侧Text对应的IdStr) */
@property (nonatomic,   copy) NSString *Jh_info_idStr;

/** 表单Cell 详情 占位字符（右侧TextView占位字符） */
@property (nonatomic,   copy) NSString *Jh_placeholder;

/**
 表单Cell ，标题底部提示文字，默认不显示
 生效Cell：选择cell，选择图片cell， Switch 按钮cell
 */
@property (nonatomic, strong) NSString *Jh_tipInfo;

/** 表单Cell 右侧 SwitchBtn 开关状态 */
@property (nonatomic, assign) BOOL Jh_switchBtn_on;

/**
 图片选择 Cell 图片数组，初始化时使用，支持 UIImage、NSURL、NSString(图片 URLString) 类型元素
 
 Jh_selectImageType == JhSelectImageTypeImage 时使用此参数
 */
@property (nonatomic, strong) NSArray *__nullable Jh_imageArr;

/** images 图片数组中类型筛选出为 UIImage 的数组子集，以实现图片上传筛选 */
@property (nonatomic, strong) NSArray *Jh_selectImageArr;

/** 图片选择 Cell，选择的视频数组，NSURL格式（ Jh_selectImageType == JhSelectImageTypeVideo 时此参数生效） */
@property (nonatomic, strong) NSArray *Jh_selectVideoArr;

#if kHasHXPhotoPicker

/** 图片选择 Cell，所有类型资源的 model 数组 */
@property (nonatomic, strong) NSArray<HXPhotoModel *> *Jh_imageAllList;

/** 图片选择 Cell，混合资源数组，初始化时使用，可展示在线图片或视频资源（Jh_imageArr也可初始化网络图片，此参数优先级高于Jh_imageArr ） */
@property (nonatomic, strong) NSArray<HXCustomAssetModel*> *Jh_mixImageArr;
#endif


/** 选择按钮Cell，标题数组  */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_btnTitleArr;
/** 选择按钮Cell，选中title数组，如需初始化时设置选中，使用此参数 ，不设置默认选中第一个 */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_selectTitleArr;
/** 选择按钮Cell，选中index数组，如需初始化时设置选中，使用selectTitleArr数组  */
@property (nonatomic, strong) NSArray *Jh_selectBtnCell_selectIndexArr;


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


#pragma mark - ******************************* 以下为Cell的样式配置 ********************************

#pragma mark - Cell 通用配置

/** 表单Cell，高度，默认值为 44.0f, 可根据需求设置(如果设置底部自定义view 最好设置view的高度+60 ) */
@property (nonatomic, assign) CGFloat Jh_cellHeight;
/** 表单Cell，是否必填(必选)，必填(必选)/可填(可选) */
@property (nonatomic, assign) BOOL Jh_required;
/** 表单Cell，背景颜色 */
@property (nonatomic, strong) UIColor *Jh_cellBgColor;
/** 表单Cell，是否不可编辑，如果设置该属性为 YES，则整个 cell 不可编辑 */
@property (nonatomic, assign) BOOL Jh_cellNotEdit;
/** 表单Cell，默认下划线左间距  */
@property (nonatomic, assign) CGFloat Jh_lineLeftMargin;
/** 表单Cell，隐藏默认下划线） */
@property (nonatomic, assign) BOOL  Jh_hiddenLine;
/** 表单Cell，隐藏标题和底部视图之间的线（上标题下视图的cell生效） */
@property (nonatomic, assign) BOOL  Jh_hiddenCustomLine;

/**
 设置单个界面的 cell 文字垂直居中 ，录入和选择cell生效
 
 默认值为 false，JhFormConst 文件的 Jh_CellTextVerticalStyle 可全局设置居中或居上
 */
@property (nonatomic, assign) BOOL Jh_cellTextVerticalCenter;

/** 标题换行展示 (默认值为 NO，单行展示)，录入和选择cell生效 */
@property (nonatomic, assign) BOOL Jh_titleMultiLineShow;


#pragma mark - 标题相关

/** 必选标题呈现形式类别(默认标题前加红星,Jh_leftTitleHiddenRedStar 可隐藏整个页面的红星按只有标题显示，还是必填 ) */
@property (nonatomic, assign) JhTitleShowType Jh_titleShowType;

/** 表单Cell，标题宽度，默认值为 100，若标题太长，不想牺牲字体大小，可设置宽度 */
@property (nonatomic, assign) CGFloat Jh_titleWidth;
/** 表单Cell，标题高度（一般不用设置） */
@property (nonatomic, assign) CGFloat Jh_titleHeight;
/** 表单Cell，标题文字颜色 */
@property (nonatomic, strong) UIColor *Jh_titleTextColor;
/** 表单Cell，标题文字字体大小（默认15） */
@property (nonatomic, assign) CGFloat Jh_titleFont;

/** 表单Cell，左侧图片名称，设置名称图片才会显示  */
@property (nonatomic, strong) NSString *Jh_leftImgName;
/** 表单Cell，左侧图片宽高，默认Jh_LeftImgWH配置（24）  */
@property (nonatomic, assign) CGFloat  Jh_leftImgWH;
/** 表单Cell，左侧图片右侧间距 默认Jh_LeftImgRightMargin配置（10）  */
@property (nonatomic, assign) CGFloat  Jh_leftImgRightMargin;

/** 隐藏左侧小红星，还是必填，只显示标题（JhTitleShowType = JhTitleShowTypeOnlyTitle  ) */
@property (nonatomic, assign) BOOL Jh_titleHiddenRedStar;


#pragma mark - info 相关

/** 表单Cell，info是否可编辑 */
@property (nonatomic, assign) BOOL Jh_editable;
/** 表单Cell，info文字颜色  */
@property (nonatomic, strong) UIColor *Jh_infoTextColor;
/** 表单Cell，info文字字体大小（默认15） */
@property (nonatomic, assign) CGFloat Jh_infoFont;
/** 表单Cell，info键盘类型 */
@property (nonatomic, assign) UIKeyboardType Jh_keyboardType;
/** 表单Cell，右侧文本的排列方式, (居左,居右 ,默认居左,只在选择和录入样式下生效) */
@property (nonatomic, assign) JhFormCellInfoTextAlignmentStyle Jh_InfoTextAlignment;
/** 表单Cell，是否显示占位字符 YES:显示 NO:不显示 --- 新增 default is YES；详情 default is NO */
@property (nonatomic, assign) BOOL Jh_showPlaceholder;
/** 表单Cell，占位字符字体大小（默认15） */
@property (nonatomic, assign) CGFloat Jh_placeholderFont;
/** 表单Cell，占位字符文字颜色 */
@property (nonatomic, strong) UIColor *Jh_placeholderColor;
/** 表单Cell，文字内边距，默认 UIEdgeInsetsMake(2, 0, -2, 0)  */
@property (nonatomic, assign) UIEdgeInsets Jh_textContainerInset;

/**
 JhFormCellTypeInput 以及 JhFormCellTypeTextViewInput 类别中表示最大录入字数 (默认50)
 
 0 表示无限制
 */
@property (nonatomic, assign) NSUInteger Jh_maxInputLength;

/**
 是否显示当前录入字数，默认不显示
 若无最大字数限制，则只显示字数； 若有字数限制，则显示 "当前字数/最大字数"
 */
@property (nonatomic, assign) BOOL Jh_showLength;

/** 表单Cell，info宽度，一般不用设置  */
@property (nonatomic, assign) CGFloat Jh_textViewWidth;
/** 表单Cell，info高度，一般不用设置  */
@property (nonatomic, assign) CGFloat Jh_textViewHeight;


#pragma mark - 右侧自定义View相关

/** 表单Cell，是否显示右侧箭头，默认不显示 */
@property (nonatomic, assign) BOOL Jh_isShowArrow;

/**
 右侧自定义 view 的宽度，和 Jh_rightViewBlock 配合使用
 
 Jh_rightViewBlock 使用之前要先设置宽度，rightView优先级高于rightBtn
 JhFormInputCell，JhFormPwdCell，JhFormSelectCell，生效
 */
@property (nonatomic, assign) CGFloat Jh_rightViewWidth;

/** 右侧按钮的宽度，设置宽度按钮才会显示 */
@property (nonatomic, assign) CGFloat Jh_rightBtnWidth;
/** 右侧按钮的高度，默认高度等于cell高度，设置高度，根据高度垂直居中 */
@property (nonatomic, assign) CGFloat Jh_rightBtnHeight;

/** 表单Cell，右侧按钮标题（标题不为空，文字相关设置才生效 ）  */
@property (nonatomic, strong) NSString *Jh_rightBtnTitle;
/** 表单Cell，右侧按钮标题字体颜色 ，默认Jh_SuffixTextColor */
@property (nonatomic, strong) UIColor *Jh_rightBtnTitleColor;
/** 表单Cell，右侧按钮标题 字体大小，默认 Jh_SuffixTextFont (13) */
@property (nonatomic, assign) CGFloat  Jh_rightBtnTitleFont;
/** 表单Cell，右侧按钮标题 是否居中，默认居右  */
@property (nonatomic, assign) BOOL  Jh_rightBtnTitleCenter;

/** 表单Cell，右侧按钮图片名称（图片名称不为空，图片相关设置才生效 ）  */
@property (nonatomic, strong) NSString *Jh_rightBtnImgName;
/** 表单Cell，右侧按钮选中图片名称  */
@property (nonatomic, strong) NSString *Jh_rightBtnSelectImgName;
/** 表单Cell，右侧按钮图片宽高，默认Jh_LeftImgWH（24）  */
@property (nonatomic, assign) CGFloat  Jh_rightBtnImgWH;
/** 表单Cell，右侧按钮图片和文字间距，默认Jh_RightBtnImgTextMargin（6）*/
@property (nonatomic, assign) CGFloat Jh_rightBtnImgTextMargin;
/** 表单Cell，右侧按钮 背景颜色，默认无  */
@property (nonatomic, strong) UIColor *Jh_rightBtnBgColor;
/** 表单Cell，右侧按钮 CornerRadiu，默认0  */
@property (nonatomic, assign) CGFloat Jh_rightBtnCornerRadius;


#pragma mark - Select Cell

/** 是否隐藏右侧箭头(只对选择样式cell起作用) */
@property (nonatomic, assign) BOOL  Jh_hiddenArrow;

/** 表单Cell ，标题底部提示文字的颜色 */
@property (nonatomic, strong) UIColor *Jh_tipInfoColor;
/** 表单Cell ，标题底部提示文字，字体大小，默认 12 */
@property (nonatomic, assign) CGFloat Jh_tipInfoFont;
/** 表单Cell ，标题底部提示文字与标题的间距，默认 5 */
@property (nonatomic, assign) CGFloat Jh_tipInfoTopMargin;


#pragma mark - SwitchBtn Cell

/** 表单Cell 右侧 SwitchBtn 开关处于开启状态时的颜色 */
@property (nonatomic, strong) UIColor  *Jh_switchOnTintColor;
/** 表单Cell 右侧 SwitchBtn 开关处于关闭状态时边框的颜色(注意这边是边框的颜色) */
@property (nonatomic, strong) UIColor  *Jh_switchTintColor;


#pragma mark - SelectImage Cell

/** 是否隐藏添加图片按钮，默认显示 */
@property (nonatomic, assign) BOOL Jh_noShowAddImgBtn;

/** 是否隐藏图片右上角删除按钮，默认显示*/
@property (nonatomic, assign) BOOL Jh_hideDeleteButton;

/** JhFormCellTypeImage 类别中表示最大选择图片数，默认8 */
@property (nonatomic, assign) NSUInteger Jh_maxImageCount;

/**
 选择图片类型（默认仅选图片，可设置仅选视频，或都选 ）
 
 仅选图片，使用 Jh_imageArr 或J h_selectImageArr 可获取图片资源
 仅选视频，使用 Jh_selectVideoArr 获取视频 URL 链接
 选图片和视频，使用 Jh_imageArr 和 Jh_selectVideoArr 分别获取数据，或使用 Jh_imageAllList 自定义获取所有资源
 */
@property (nonatomic, assign) JhSelectImageType Jh_selectImageType;

/** 拍摄的 照片/视频 是否不保存到系统相册，默认保存*/
@property (nonatomic, assign) BOOL Jh_imageNoSaveAblum;

/** 相机视频录制最小秒数  -  默认3s  */
@property (nonatomic, assign) NSTimeInterval Jh_videoMinimumDuration;


#pragma mark - 选择按钮 Cell

/** 选择按钮Cell，是否多选，默认单选*/
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isMultiSelect;
/** 选择按钮Cell，是否单行展示（一个选项一行），默认自适应 */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isSingleLineDisplay;
/** 选择按钮Cell，是否按上标题下选项排列展示，默认左右 */
@property (nonatomic, assign) BOOL  Jh_selectBtnCell_isTopTitleBottomOption;

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



@end



#pragma mark - ******************************* 快捷构建新增表单Cell ********************************

/**
 默认 - 快捷构建新增表单Cell
 
 @param title 标题
 @param info 详情
 @param cellType Cell类别
 @param editable 是否可编辑
 @param required 是否必填
 @param keyboardType 键盘类别
 */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCell(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType, BOOL editable, BOOL required, UIKeyboardType keyboardType);

/** 快捷构建展示Cell（ 非必填，不可编辑 ） */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddInfoCell(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType);

/** 快捷构建录入Cell（ 左标题，右录入框 (文字居左)，可编辑 ） */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required, UIKeyboardType keyboardType);

/** 快捷构建选择Cell（ 左标题，右文字(居左)，带箭头，可选择 ） */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSelectCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required);

/** 快捷构建一个TextView录入类型的Cell（上标题，下TextView，可编辑，显示字数统计 ）*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddTextViewInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required);

/** 快捷构建密码录入Cell（ 左标题，右录入框 (居左)，可编辑 ） */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddPwdInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required);

/** 快捷构建选择图片Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddImageCell(NSString * _Nonnull title, BOOL required);

/** 快捷构建按钮单选或多选Cell （ 左标题，右文字按钮组，可选择 ）*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSelectBtnCell(NSString * _Nonnull title,BOOL editable, BOOL required);

/** 快捷构建右侧自定义View Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumRightCell(NSString * _Nonnull title);

/** 快捷构建底部自定义View Cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumBottomCell(NSString * _Nonnull title);

/** 快捷构建完全自定义View Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumALLViewCell(CGFloat cellHeight);

/** 快捷构建 标题居中Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title);


/********************************* 以下方法快捷创建的cell 不是必选 的,需要必须的话再设置 required 为YES ********************************/

#pragma mark - 快速创建本文居右的Cell

/** 右文本 - 快捷添加一个info(居右)的 不可编辑 Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightTextCell(NSString * _Nonnull title, NSString * _Nullable info);

/** 右箭头 - 快捷添加一个info(居右)带箭头 Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightArrowCell(NSString * _Nonnull title, NSString * _Nullable info);

/** 右Switch - 快捷添加一个右侧为 SwitchBtn Cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSwitchBtnCell(NSString * _Nonnull title, BOOL Jh_switchBtn_on);

NS_ASSUME_NONNULL_END
