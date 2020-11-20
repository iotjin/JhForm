//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//
//  JhFormConst 主要配置表单涉及的相关常量参数，可根据需求修改配置
//

#import <UIKit/UIKit.h>

/// 版本号（20201113）
#define kVersion @"1.5.0"

/// 获取屏幕宽度、高度
#define Jh_SCRREN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define Jh_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/// 异型屏尺寸，X是44,其他是20
#define Jh_STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define Jh_CONTENT_NAV_BAR_HEIGHT 44.0
#define Jh_TAB_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define Jh_NAV_HEIGHT (Jh_STATUS_BAR_HEIGHT + Jh_CONTENT_NAV_BAR_HEIGHT)
#define Jh_BOTTOM_SAFE_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

#define JhColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhGrayColor(v)   JhColor((v), (v), (v))

/// 主题色
#define BaseThemeColor JhColor(46, 150, 213)

/// 背景色
#define BaseBgWhiteColor JhColor(248, 248, 248)
#define BaseBgWhiteColor_dark JhColor(10, 10, 10)

/// line背景色
#define BaselineColor JhColor(230, 230, 230)

/// 表单条目，标题颜色
#define Jh_titleColor JhGrayColor(51)
/// 表单条目，右侧文本颜色
#define Jh_rightTextViewTextColor JhGrayColor(51)
/// 表单条目，输入框占位符字体颜色
#define Jh_PlaceholderColor JhGrayColor(187)
/// JhFormCellModelTypeTextViewInput 类别 TextView 背景颜色
#define Jh_textView_BackgroundColor JhGrayColor(250)

/// iOS 13 生效，主题样式
typedef NS_ENUM(NSInteger, JhThemeType) {
    JhThemeTypeLight = 0, // 浅色模式，默认值
    JhThemeTypeAuto,   // 跟随系统设置自动切换
};

UIKIT_EXTERN const JhThemeType Jh_ThemeType;

/// title 垂直方向对齐样式
typedef NS_ENUM(NSInteger, JhCellTextVerticalStyle) {
    JhCellTextVerticalStyleTop = 0, // 居上显示，默认值
    JhCellTextVerticalStyleCenter,  // 居中显示
};

UIKIT_EXTERN const JhCellTextVerticalStyle Jh_CellTextVerticalStyle;

/// 表单标题宽度，默认100.0f
UIKIT_EXTERN const CGFloat Jh_TitleWidth;
/// 表单标题高度，默认24.0f
UIKIT_EXTERN const CGFloat Jh_TitleHeight;
/// 表单标题字体大小，默认15.0f
UIKIT_EXTERN const CGFloat Jh_TitleFont;
/// 表单详情字体大小，默认15.0f
UIKIT_EXTERN const CGFloat Jh_InfoFont;

/// 表单条目，左侧边缘距离，默认15.0f
UIKIT_EXTERN const CGFloat Jh_Margin_Left;
/// 表单条目，右侧边缘距离，默认10.0f
UIKIT_EXTERN const CGFloat Jh_Margin_Right;

/// 红星在前的样式中，tilte 往左侧的偏移量，默认5.0f
UIKIT_EXTERN const CGFloat Jh_redStarLeftOffset;

/// 表单底部线距离左侧边缘距离，默认16.0f (尽量不要动，只在几个cell中使用了)
UIKIT_EXTERN const CGFloat Jh_LineEdgeMargin;

/// 表单条目，右侧自定义视图的右间距，默认5.0f
UIKIT_EXTERN const CGFloat Jh_CustumRightView_rightEdgeMargin;

/**
 表单 Cell 高度
 JhFormCellModelTypeTextViewInput 类型缺省高度为150，选择图片和自定义底部 264, 其余默认44.0f，为确保显示正常，设置值 >= 44
 */
UIKIT_EXTERN const CGFloat Jh_DefaultCellHeight; //44
UIKIT_EXTERN const CGFloat Jh_DefaultTextViewCellHeight;  //150
UIKIT_EXTERN const CGFloat Jh_DefaultCustumBottomViewCellHeight; //264

/// 表单输入字数限制，默认50（ 0 表示无限制）
UIKIT_EXTERN const NSUInteger Jh_GlobalMaxInputLength;
/// 表单 TextView 字数提示文字字体大小，默认12.0f
UIKIT_EXTERN const CGFloat Jh_LengHintFont;

/// 表单选择图片附件数，默认8
UIKIT_EXTERN const NSUInteger Jh_GlobalMaxImages;

/// 表单添加图标
UIKIT_EXTERN NSString * const Jh_AddIcon;
/// 表单选择cell 右侧箭头图标
UIKIT_EXTERN NSString * const Jh_SelectCell_rightArrow;

/// 表单选择 cell，左侧图片宽高，默认24
UIKIT_EXTERN const CGFloat Jh_LeftImgWH;
/// 表单选择 cell，左侧图片右侧间距，默认10
UIKIT_EXTERN const CGFloat Jh_LeftImgRightMargin;


#pragma mark - 提交按钮

/// 提交按钮的文字颜色，默认白色
#define Jh_SubmitBtn_TextColor [UIColor whiteColor]

/// 表单提交按钮，上下间距，默认25（上25，下25）
UIKIT_EXTERN const CGFloat Jh_SubmitBtn_TBSpace;
/// 表单提交按钮，左右间距，默认15（左15，右15）
UIKIT_EXTERN const CGFloat Jh_SubmitBtn_LRSpace;
/// 表单提交按钮，圆角，默认5
UIKIT_EXTERN const CGFloat Jh_SubmitBtn_CornerRadius;
/// 表单提交按钮，高度，默认40
UIKIT_EXTERN const CGFloat Jh_SubmitBtn_Height;
/// 表单提交按钮，字体大小，默认17
UIKIT_EXTERN const CGFloat Jh_SubmitBtn_TextFontSize;
/// 表单提交按钮，标题文字，默认：提 交
UIKIT_EXTERN NSString * const Jh_SubmitBtn_Text;


#pragma mark - 选择按钮 Cell

/// 选择按钮Cell，标题默认颜色，默认 Jh_rightTextViewTextColor
#define Jh_SelectBtnCell_BtnTitleColor Jh_rightTextViewTextColor
/// 选择按钮Cell，标题选中颜色，默认 Jh_rightTextViewTextColor
#define Jh_SelectBtnCell_BtnTitleSelectColor Jh_rightTextViewTextColor
/// 选择按钮Cell，边框颜色，默认 grayColor
#define Jh_SelectBtnCell_BtnBorderColor [UIColor grayColor]
/// 选择按钮Cell，默认背景颜色，默认 whiteColor
#define Jh_SelectBtnCell_BtnBgColor [UIColor whiteColor]
/// 选择按钮Cell，选中背景颜色，默认 whiteColor
#define Jh_SelectBtnCell_BtnSelectBgColor [UIColor whiteColor]

/// 选择按钮Cell，未选中图片，默认空心灰色圆，
UIKIT_EXTERN NSString * const Jh_SelectBtnCell_UnSelectIcon;
/// 选择按钮Cell，选中图片1，默认圆形蓝色对勾
UIKIT_EXTERN NSString * const Jh_SelectBtnCell_SelectIcon;
/// 选择按钮Cell，选中图片2，圆形黑色小圆点
UIKIT_EXTERN NSString * const Jh_SelectBtnCell_SelectIcon2;

/// 选择按钮Cell，按钮左间距，默认10
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_LeftMargin;
/// 选择按钮Cell，按钮水平间距，默认10
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnHorizontalMargin;
/// 选择按钮Cell，按钮垂直间距，默认10
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnVerticalMargin;
/// 选择按钮Cell，按钮高度，默认24
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnHeight;
/// 选择按钮Cell，按钮title左右空白大小，默认10
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnTitleBlank;
/// 选择按钮Cell，按钮图标和文字间距，默认10
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnIconSpace;
/// 选择按钮Cell，按钮圆角，默认0
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnCornerRadius;
/// 选择按钮Cell，按钮边框宽度，默认0
UIKIT_EXTERN const CGFloat Jh_SelectBtnCell_BtnBorderWidth;
