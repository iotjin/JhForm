//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  JhFormConst 全局配置表单涉及的相关常量参数，可根据需求修改


#import <UIKit/UIKit.h>
#import "UIColor+JhDarkColor.h"
#import "NSString+JhForm.h"
#import "UIView+JhView.h"

/// 版本号（20211209）
#define kVersion @"2.3.1"


/// 屏幕宽度、高度
#define Jh_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define Jh_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define Jh_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define Jh_ContentNavBarHeight 44.0
#define Jh_TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define Jh_NavHeight (Jh_StatusBarHeight + Jh_ContentNavBarHeight)
#define Jh_BottomSafeHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

#define JhColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhGrayColor(v) JhColor((v), (v), (v))
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define JhFontsize(x)  [UIFont systemFontOfSize:x]

// 弱引用
#define JhWeakSelf __weak typeof(self) weakSelf = self;
// 强引用
#define JhStrongSelf __strong typeof(self) strongSelf = weakSelf;

/// iOS13之后
#define Jh_IOS13_Later @available(iOS 13.0, *)

/// 设置动态配置的属性和默认属性
#define Jh_SetValueAndDefault(value,defaultValue) (value ?: defaultValue)

/// 设置lightColor 和 darkColor
#define Jh_SetLightAndDark(light,dark) Jh_ThemeType == JhThemeTypeAuto?[UIColor Jh_colorWithLightColor:light darkColor:dark]:(Jh_ThemeType == JhThemeTypeLight?[UIColor Jh_colorWithLightColor:light darkColor:light]:[UIColor Jh_colorWithLightColor:dark darkColor:dark])

#define Jh_IsDark if(Jh_IOS13_Later)return UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark; return false;

/// 主题色，选择图片中的导航条使用了主题色
#define JhBaseThemeColor JhColor(46, 150, 213)
///  背景色
#define JhBaseBgColor Jh_SetLightAndDark(JhGrayColor(248),JhBaseBgColor_dark)
#define JhBaseBgColor_dark JhGrayColor(10)
///  Cell背景色
#define JhBaseCellBgColor Jh_SetLightAndDark(JhGrayColor(255),JhBaseCellBgColor_dark)
#define JhBaseCellBgColor_dark JhGrayColor(25)
/// line背景色
#define JhBaseLineColor Jh_SetLightAndDark(JhGrayColor(230),JhGrayColor(35))
/// Label 颜色
#define JhBaseLabelColor JhGrayColor(51)
#define JhBaseLabelColor_Dark JhGrayColor(198)

/// 页面设置lightColor 和 darkColor
#define Jh_PageSetLightAndDark(light,dark) self.Jh_themeType ? (self.Jh_themeType== JhThemeTypeAuto?[UIColor Jh_colorWithLightColor:light darkColor:dark]:(self.Jh_themeType == JhThemeTypeLight?[UIColor Jh_colorWithLightColor:light darkColor:light]:[UIColor Jh_colorWithLightColor:dark darkColor:dark])): (Jh_ThemeType== JhThemeTypeAuto?[UIColor Jh_colorWithLightColor:light darkColor:dark]:(Jh_ThemeType == JhThemeTypeLight?[UIColor Jh_colorWithLightColor:light darkColor:light]:[UIColor Jh_colorWithLightColor:dark darkColor:dark]))

/// 导航条背景色
#define JhBaseNavBgColor Jh_PageSetLightAndDark(JhBaseThemeColor, JhGrayColor(20))
/// 导航条标题颜色
#define JhBaseNavTitleColor Jh_PageSetLightAndDark(UIColor.whiteColor, JhBaseLabelColor_Dark)
/// 导航条文字颜色
#define JhBaseNavTextColor JhBaseNavTitleColor

/// 主题样式
typedef NS_ENUM(NSInteger, JhThemeType) {
    JhThemeTypeAuto = 0,   // 跟随系统设置自动切换，默认值
    JhThemeTypeLight,      // 浅色模式
    JhThemeTypeDark,       // 深色模式
};

/// cell文字垂直方向对齐样式（title和info）
typedef NS_ENUM(NSInteger, JhCellTextVerticalStyle) {
    JhCellTextVerticalStyleTop = 0, // 居上显示，默认值
    JhCellTextVerticalStyleCenter,  // 居中显示
};

/// 必选Cell，标题呈现样式
typedef NS_ENUM(NSInteger, JhTitleShowType) {
    JhTitleShowTypeRedStarFront = 0, // 标题前部加红色*，如: *标题
    JhTitleShowTypeOnlyTitle,        // 仅显示标题
    JhTitleShowTypeAddText,          // 标题后加必填文字，如: 标题(必填)
};

/// 主题样式，默认跟随系统切换（iOS 13 生效）
UIKIT_EXTERN JhThemeType const Jh_ThemeType;
/// cell文字垂直方向对齐样式（title和info），默认居上
UIKIT_EXTERN JhCellTextVerticalStyle const Jh_CellTextVerticalStyle;
/// 必选Cell，标题呈现样式，默认标题前加红星
UIKIT_EXTERN JhTitleShowType const Jh_TitleShowType;


#pragma mark - 标题相关

/// 表单Cell，标题颜色
#define Jh_TitleColor Jh_SetLightAndDark(JhBaseLabelColor,JhBaseLabelColor_Dark)

/// 表单通用间距 10
UIKIT_EXTERN CGFloat   const Jh_Margin;

/// 表单Cell，左侧边缘距离，默认15
UIKIT_EXTERN CGFloat   const Jh_LeftMargin;
/// 红星宽，默认10
UIKIT_EXTERN CGFloat   const Jh_RedStarWidth;
/// 表单Cell，左侧图片宽高，默认24
UIKIT_EXTERN CGFloat   const Jh_LeftImgWH;
/// 表单Cell，左侧图片右侧间距，默认10
UIKIT_EXTERN CGFloat   const Jh_LeftImgRightMargin;

/// 表单标题宽度，默认100
UIKIT_EXTERN CGFloat   const Jh_TitleWidth;
/// 表单标题高度，默认24
UIKIT_EXTERN CGFloat   const Jh_TitleHeight;
/// 表单标题字体大小，默认15
UIKIT_EXTERN CGFloat   const Jh_TitleFont;


#pragma mark - info相关

/// 表单Cell，右侧文本颜色
#define Jh_InfoTextColor Jh_SetLightAndDark(JhBaseLabelColor,JhBaseLabelColor_Dark)
/// 表单Cell，录入框占位符字体颜色
#define Jh_PlaceholderColor Jh_SetLightAndDark(JhGrayColor(187),JhGrayColor(87))
/// 表单Cell，后缀文字字体颜色
#define Jh_SuffixTextColor Jh_SetLightAndDark(JhGrayColor(150),JhGrayColor(150))

/// 表单Cell，右侧TextView和左侧Label距离，默认5
UIKIT_EXTERN CGFloat   const Jh_InfoLeftMargin;
/// 表单Cell，右侧自定义视图的左间距，默认5，隐藏时为0
UIKIT_EXTERN CGFloat   const Jh_RightViewLeftMargin;
/// 表单Cell，右侧边缘距离，默认10
UIKIT_EXTERN CGFloat   const Jh_RightMargin;
/// 表单详情字体大小，默认15
UIKIT_EXTERN CGFloat   const Jh_InfoFont;
/// 表单Cell，后缀文字字体大小(右侧按钮)，默认13
UIKIT_EXTERN CGFloat   const Jh_SuffixTextFont;
/// 表单Cell，右侧按钮图片文字间距，默认6
UIKIT_EXTERN CGFloat   const Jh_RightBtnImgTextMargin;

/// 表单录入字数限制，默认50（ 0 表示无限制）
UIKIT_EXTERN const NSUInteger Jh_MaxInputLength;

/// 表单 Cell 默认高度，大部分默认44，为确保显示正常，设置值 >= 44
UIKIT_EXTERN CGFloat   const Jh_DefaultCellHeight;
/// 表单 Cell，底部自定义viewCell高度，默认264
UIKIT_EXTERN CGFloat   const Jh_DefaultCustumBottomViewCellHeight;

/// 表单底部线距离左侧边缘距离，默认15
UIKIT_EXTERN CGFloat   const Jh_LineLeftMargin;
/// 表单分隔线高度（上标题和下view之间的线），默认1
UIKIT_EXTERN CGFloat   const Jh_LineHeight;


#pragma mark - 选择Cell

/// 表单Cell，标题底部提示文字，字体颜色
#define Jh_TipInfoColor Jh_SetLightAndDark(JhGrayColor(119),JhGrayColor(119))

/// 表单选择cell 右侧箭头图标，没使用
UIKIT_EXTERN NSString *const Jh_SelectCell_rightArrow;
/// 表单显示箭头时箭头图标占的宽度，默认25
UIKIT_EXTERN CGFloat   const Jh_rightArrowWidth;

/// 表单Cell，标题底部提示文字，字体大小，默认12
UIKIT_EXTERN CGFloat   const Jh_TipInfoFont;
/// 表单Cell，标题底部提示文字高度，默认12
UIKIT_EXTERN CGFloat   const Jh_TipInfoHeight;
/// 表单Cell ，标题底部提示文字与标题的间距，默认5
UIKIT_EXTERN CGFloat   const Jh_TipInfoTopMargin;


#pragma mark - 选择图片Cell

/// 表单Cell，图片的高度
#define Jh_OnePhotoViewWidth (Jh_ScreenWidth-Jh_ImageLeftMargin-Jh_ImageRightMargin-(Jh_ImageOneLineCount-1)*Jh_ImageMargin)
/// 表单Cell，图片的高度
#define Jh_ImageHeight  (Jh_OnePhotoViewWidth)/Jh_ImageOneLineCount

/// 表单Cell，选择图片，左间距，默认15
UIKIT_EXTERN NSUInteger const Jh_ImageLeftMargin;
/// 表单Cell，选择图片，右间距，默认15
UIKIT_EXTERN NSUInteger const Jh_ImageRightMargin;
/// 表单Cell，选择图片，图片间距，默认3
UIKIT_EXTERN NSUInteger const Jh_ImageMargin;
/// 表单Cell，选择图片，一行几张图片，默认4张
UIKIT_EXTERN NSUInteger const Jh_ImageOneLineCount;
/// 表单Cell，选择图片，photo顶部底部间距，默认10
UIKIT_EXTERN NSUInteger const Jh_OnePhotoViewTopMargin;

/// 表单Cell，选择图片附件数，默认8
UIKIT_EXTERN NSUInteger const Jh_GlobalMaxImages;
/// 表单Cell，选择图片 添加图标
UIKIT_EXTERN NSString *const Jh_AddIcon;

///// 表单Cell，选择图片，加载失败占位图，没使用
//UIKIT_EXTERN NSString *const Jh_PlaceholderImage;
///// 表单Cell，选择图片，删除图标，没使用
//UIKIT_EXTERN NSString *const Jh_DeleteIcon;


#pragma mark - 选择按钮 Cell

/// 选择按钮Cell，按钮标题颜色，默认 Jh_InfoTextColor
#define Jh_SelectBtnCell_BtnTitleColor Jh_SetLightAndDark(Jh_InfoTextColor,JhBaseLabelColor_Dark)
/// 选择按钮Cell，按钮标题选中颜色，默认 Jh_InfoTextColor
#define Jh_SelectBtnCell_BtnTitleSelectColor Jh_SetLightAndDark(Jh_InfoTextColor,JhBaseLabelColor_Dark)
/// 选择按钮Cell，按钮边框颜色，默认 grayColor
#define Jh_SelectBtnCell_BtnBorderColor [UIColor grayColor]
/// 选择按钮Cell，按钮默认背景颜色，默认 whiteColor
#define Jh_SelectBtnCell_BtnBgColor Jh_SetLightAndDark([UIColor whiteColor],JhBaseCellBgColor_dark)
/// 选择按钮Cell，按钮选中背景颜色，默认 whiteColor
#define Jh_SelectBtnCell_BtnSelectBgColor Jh_SetLightAndDark([UIColor whiteColor],JhBaseCellBgColor_dark)

/// 图标  CheckBox   未选中  ，外部直接使用
#define Jh_Icon_CheckBoxNormal @"JhForm.bundle/ic_checkbox_normal"
/// 图标  CheckBox   选中      ， 外部直接使用
#define Jh_Icon_CheckBoxSelect @"JhForm.bundle/ic_checkbox_select"
/// 图标  CheckBox   选中2     ，外部直接使用
#define Jh_Icon_CheckBoxSelect2 @"JhForm.bundle/ic_checkbox_select2"

/// 选择按钮Cell，未选中图片，默认空心灰色圆，
UIKIT_EXTERN NSString *const Jh_SelectBtnCell_UnSelectIcon;
/// 选择按钮Cell，选中图片1，默认圆形蓝色对勾
UIKIT_EXTERN NSString *const Jh_SelectBtnCell_SelectIcon;
/// 选择按钮Cell，选中图片2，圆形黑色小圆点
UIKIT_EXTERN NSString *const Jh_SelectBtnCell_SelectIcon2;

/// 选择按钮Cell，按钮左间距，默认10
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_LeftMargin;
/// 选择按钮Cell，按钮水平间距，默认10
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnHorizontalMargin;
/// 选择按钮Cell，按钮垂直间距，默认10
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnVerticalMargin;
/// 选择按钮Cell，按钮高度，默认24
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnHeight;
/// 选择按钮Cell，按钮title左右空白大小，默认10
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnTitleBlank;
/// 选择按钮Cell，按钮图标和文字间距，默认10
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnIconSpace;
/// 选择按钮Cell，按钮圆角，默认0
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnCornerRadius;
/// 选择按钮Cell，按钮边框宽度，默认0
UIKIT_EXTERN CGFloat   const Jh_SelectBtnCell_BtnBorderWidth;


#pragma mark - TextViewCell

/// TextViewCell，TextView 背景颜色
#define Jh_TextViewBgColor Jh_SetLightAndDark(JhGrayColor(250),JhGrayColor(50))
/// TextViewCell，字数提示文字颜色
#define Jh_LengthTipTextColor Jh_SetLightAndDark(JhGrayColor(100),JhGrayColor(100))

/// TextViewCell，TextView高度，默认100 ，顶部标题高度为Jh_DefaultCellHeight，
UIKIT_EXTERN CGFloat   const Jh_DefaultInputTextViewHeight;
/// TextViewCell，字数提示文字字体大小，默认12
UIKIT_EXTERN CGFloat   const Jh_LengthTipFont;


#pragma mark - 提交按钮

/// 提交按钮的文字颜色，默认白色
#define Jh_SubmitBtn_TextColor [UIColor whiteColor]

/// 表单提交按钮，上下间距，默认25（上25，下25）
UIKIT_EXTERN CGFloat   const Jh_SubmitBtn_TBSpace;
/// 表单提交按钮，左右间距，默认15（左15，右15）
UIKIT_EXTERN CGFloat   const Jh_SubmitBtn_LRSpace;
/// 表单提交按钮，圆角，默认5
UIKIT_EXTERN CGFloat   const Jh_SubmitBtn_CornerRadius;
/// 表单提交按钮，高度，默认40
UIKIT_EXTERN CGFloat   const Jh_SubmitBtn_Height;
/// 表单提交按钮，字体大小，默认17
UIKIT_EXTERN CGFloat   const Jh_SubmitBtn_TextFontSize;
/// 表单提交按钮，标题文字，默认：提 交
UIKIT_EXTERN NSString *const Jh_SubmitBtn_Text;


#pragma mark - header和footer

/// 头部标题字体颜色，默认JhBaseLabelColor
#define Jh_HeaderTitleColor Jh_SetLightAndDark(JhBaseLabelColor,JhBaseLabelColor_Dark)
/// 头部背景颜色，默认 JhBaseBgColor
#define Jh_HeaderBgColor    JhBaseBgColor
/// 尾部标题字体颜色，默认JhBaseLabelColor
#define Jh_FooterTitleColor Jh_SetLightAndDark(JhBaseLabelColor,JhBaseLabelColor_Dark)
/// 尾部标题字体颜色，默认 JhBaseBgColor
#define Jh_FooterBgColor    JhBaseBgColor

/// 头部标题字体大小，默认15
UIKIT_EXTERN CGFloat   const Jh_HeaderTitleFont;
/// 尾部标题字体大小，默认15
UIKIT_EXTERN CGFloat   const Jh_FooterTitleFont;
