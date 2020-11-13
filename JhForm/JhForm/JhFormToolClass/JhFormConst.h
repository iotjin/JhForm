//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

/**
 JhFormConst 主要配置表单涉及的相关常量参数，可根据需求修改配置
 */
#import <UIKit/UIKit.h>


/**
 版本号（20201113）
 */
#define kVersion @"1.5.0"


/** 获取屏幕宽度  */
#define Jh_SCRREN_WIDTH [UIScreen mainScreen].bounds.size.width

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhGrayColor(v) JhColor((v), (v), (v))


/** 主题色  */
#define BaseThemeColor JhColor(46, 150, 213)

/** 背景色  */
#define BaseBgWhiteColor JhColor(248, 248, 248)
#define BaseBgWhiteColor_dark JhColor(10, 10, 10)

/** line背景色  */
#define BaselineColor JhColor(230, 230, 230)

/** 表单条目    标题颜色  */
#define Jh_titleColor JhGrayColor(51)

/** 表单条目    右侧文本颜色  */
#define Jh_rightTextViewTextColor JhGrayColor(51)

/** 表单条目    输入框占位符字体颜色  */
#define Jh_PlaceholderColor JhGrayColor(187)

/** JhFormCellModelTypeTextViewInput 类别 TextView 背景颜色  */
#define Jh_textView_BackgroundColor JhGrayColor(250)

// 表单右侧自定义view的左间距 (默认120)  如果设置 self.Jh_leftTitleWidth ,会变小

// 表单右侧自定义view的右间距
#define  Jh_CustumRightView_rightEdgeMargin   5.0f



/** 表单提交按钮 文字颜色，默认白色  */
#define Jh_SubmitBtn_TextColor [UIColor whiteColor]



/**
iOS13 生效  主题默认light
*/
typedef NS_ENUM(NSInteger, JhThemeType) {
    JhThemeTypeLight = 0,
    /** 跟随系统设置自动切换 */
    JhThemeTypeAuto ,
};

/**
iOS13 生效  主题默认light
*/
extern JhThemeType const Jh_ThemeType;


/**
 title 垂直展示样式，居中或居上
*/
typedef NS_ENUM(NSInteger, JhCellTextVerticalStyle) {
    JhCellTextVerticalStyleTop = 0,
    JhCellTextVerticalStyleCenter ,
};

/**
 cell中文字 垂直展示样式，默认居上
*/
extern JhCellTextVerticalStyle const Jh_CellTextVerticalStyle;




/** 表单提交按钮 上下间距   默认25（上25，下25） */
extern CGFloat const Jh_SubmitBtn_TBSpace;

/** 表单提交按钮 左右间距   默认15（左15，右15） */
extern CGFloat const Jh_SubmitBtn_LRSpace;

/** 表单提交按钮 圆角   默认5  */
extern CGFloat const Jh_SubmitBtn_CornerRadius;

/** 表单提交按钮 高度   默认40  */
extern CGFloat const Jh_SubmitBtn_Height;

/** 表单提交按钮 文字大小 默认17  */
extern CGFloat const Jh_SubmitBtn_TextFontSize;

/** 表单提交按钮 文字  默认 ：提 交 */
extern NSString *const Jh_SubmitBtn_Text;


/** 表单标题字体大小，缺省为15 */
extern CGFloat const Jh_TitleFont;

/** 表单详情字体大小，缺省为15 */
extern CGFloat const Jh_InfoFont;

/** 表单条目左侧边缘距离，缺省为15.0f */
extern CGFloat const Jh_Margin_left;

/** 表单条目右侧边缘距离，缺省为10.0f */
extern CGFloat const Jh_EdgeMargin;

/** 红星在前样式,tilte往左侧偏移量 */
extern CGFloat const Jh_redStarLeftOffset;

/** 表单底部线距离左侧边缘距离，缺省为16.0f (尽量不要动,只在几个cell中使用了)  */
extern CGFloat const Jh_LineEdgeMargin;

/** 表单标题宽度，缺省为100.0f  */
extern CGFloat const Jh_TitleWidth;

/** 表单标题高度，缺省为24.0f  */
extern CGFloat const Jh_TitleHeight;

/**
 表单Cell高度，
 JhFormCellModelTypeTextViewInput 类型缺省高度为150 ，选择图片和自定义底部 264,  其余 缺省为44.0f， 为确保显示正常，设置值>= 44
 
 */
extern CGFloat const Jh_DefaultCellHeight; //44
extern CGFloat const Jh_DefaultTextViewCellHeight;  //150
extern CGFloat const Jh_DefaultCustumBottomViewCellHeight; //264
//extern CGFloat const Jh_DefaultSelectImageCellHeight; //264
//extern CGFloat const Jh_DefaultSelectImageCellHeight_oneRow; //164


/** 表单输入字数限制，缺省为50（ 0 表示无限制） */
extern NSUInteger const Jh_GlobalMaxInputLength;

/** 表单TextView字数提示文字大小 */
extern CGFloat const Jh_LengHintFont;


/** 表单选择图片附件数，缺省为8 */
extern NSUInteger const Jh_GlobalMaxImages;

///** 表单图片条目图片加载失败占位图 */
//extern NSString *const Jh_PlaceholderImage;
//
///** 表单附件删除图标 */
//extern NSString *const Jh_DeleteIcon;


/** 表单添加图标 */
extern NSString *const Jh_AddIcon;

/** 表单选择cell 右侧箭头图标 */
extern NSString *const Jh_SelectCell_rightArrow;

/** 表单选择cell左侧图片宽高，默认24  */
extern CGFloat const Jh_LeftImgWH;

/** 表单选择cell左侧图片右侧间距， 默认10    */
extern CGFloat const Jh_LeftImgRightMargin;


#pragma mark - 选择按钮Cell

/** 表单 选择按钮Cell    未选中图标，空心灰色圆，默认 */
extern NSString *const Jh_SelectBtnCell_UnSelectIcon;
/** 表单 选择按钮Cell    选中图标1，圆形蓝色对勾，默认 */
extern NSString *const Jh_SelectBtnCell_SelectIcon;
/** 表单 选择按钮Cell    选中图标2，圆形黑色小圆点 ，*/
extern NSString *const Jh_SelectBtnCell_SelectIcon2;


/** 选择按钮Cell    按钮左间距，默认10 */
extern CGFloat const Jh_SelectBtnCell_LeftMargin;
/** 选择按钮Cell    按钮水平间距，默认10 */
extern CGFloat const Jh_SelectBtnCell_BtnHorizontalMargin;
/** 选择按钮Cell    按钮垂直间距，默认10 */
extern CGFloat const Jh_SelectBtnCell_BtnVerticalMargin;
/** 选择按钮Cell    按钮高度，默认24 */
extern CGFloat const Jh_SelectBtnCell_BtnHeight;
/** 选择按钮Cell    按钮title左右空白大小 ，默认10*/
extern CGFloat const Jh_SelectBtnCell_BtnTitleBlank;
/** 选择按钮Cell    按钮图标和文字间距，默认10 */
extern CGFloat const Jh_SelectBtnCell_BtnIconSpace;
/** 选择按钮Cell    按钮圆角，默认0 */
extern CGFloat const Jh_SelectBtnCell_BtnCornerRadius;
/** 选择按钮Cell    按钮边框宽度，默认0 */
extern CGFloat const Jh_SelectBtnCell_BtnBorderWidth;

/** 选择按钮Cell    按钮标题颜色，默认Jh_rightTextViewTextColor */
#define Jh_SelectBtnCell_BtnTitleColor Jh_rightTextViewTextColor
/** 选择按钮Cell    按钮标题选中颜色 ，默认Jh_rightTextViewTextColor  */
#define Jh_SelectBtnCell_BtnTitleSelectColor Jh_rightTextViewTextColor
/** 选择按钮Cell    按钮边框颜色，默认grayColor */
#define Jh_SelectBtnCell_BtnBorderColor [UIColor grayColor]
/** 选择按钮Cell    按钮默认背景颜色，默认whiteColor */
#define Jh_SelectBtnCell_BtnBgColor [UIColor whiteColor]
/** 选择按钮Cell    按钮选中背景颜色，默认whiteColor */
#define Jh_SelectBtnCell_BtnSelectBgColor [UIColor whiteColor]


