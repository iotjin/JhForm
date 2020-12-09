//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormConst.h"


/**
 主题样式，默认跟随系统切换（iOS 13 生效）,
 
 若不适配暗黑模式，按如下配置：
 在info.plist文件中添加User Interface Style配置, 并设置为Light
 <key>UIUserInterfaceStyle</key>
 <string>Light</string>
 */
JhThemeType const Jh_ThemeType = JhThemeTypeAuto;

//cell文字垂直方向对齐样式（title和info），默认居上
JhCellTextVerticalStyle const Jh_CellTextVerticalStyle = JhCellTextVerticalStyleTop;

/// 必选Cell，标题呈现样式，默认标题前加红星
JhTitleShowType const Jh_TitleShowType = JhTitleShowTypeRedStarFront;


#pragma mark - 标题相关

/// 表单通用间距 10
CGFloat   const Jh_Margin = 10;
/// 表单Cell，左侧边缘距离，默认15
CGFloat   const Jh_LeftMargin = 15;
/// 红星宽，默认10
CGFloat   const Jh_RedStarWidth = 10;
/// 表单Cell，左侧图片宽高，默认24
CGFloat   const Jh_LeftImgWH = 24;
/// 表单Cell，左侧图片右侧间距，默认10
CGFloat   const Jh_LeftImgRightMargin = 10;

/// 表单标题宽度，默认100
CGFloat   const Jh_TitleWidth = 100;
/// 表单标题高度，默认24
CGFloat   const Jh_TitleHeight = 24;
/// 表单标题字体大小，默认15
CGFloat   const Jh_TitleFont = 15;


#pragma mark - info相关

/// 表单Cell，右侧TextView和左侧Label距离，默认5
CGFloat   const Jh_InfoLeftMargin = 5;
/// 表单Cell，右侧自定义视图的左间距，默认5，隐藏时为0
CGFloat   const Jh_RightViewLeftMargin = 5;
/// 表单Cell，右侧边缘距离，默认10
CGFloat   const Jh_RightMargin = 10;
/// 表单详情字体大小，默认15
CGFloat   const Jh_InfoFont = 15;
/// 表单Cell，后缀文字字体大小(右侧按钮)，默认13
CGFloat   const Jh_SuffixTextFont = 13;
/// 表单Cell，右侧按钮图片文字间距，默认6
CGFloat   const Jh_RightBtnImgTextMargin = 6;

/// 表单录入字数限制，默认50（ 0 表示无限制）
const NSUInteger Jh_MaxInputLength = 50;


/// 表单 Cell 默认高度，大部分默认44，为确保显示正常，设置值 >= 44
CGFloat   const Jh_DefaultCellHeight = 44;
/// 表单 Cell，底部自定义viewCell高度，默认264
CGFloat   const Jh_DefaultCustumBottomViewCellHeight = 264;

/// 表单底部线距离左侧边缘距离，默认15
CGFloat   const Jh_LineLeftMargin = 15;
/// 表单分隔线高度（上标题和下view之间的线），默认1
CGFloat   const Jh_LineHeight = 1;


#pragma mark - 选择Cell

/// 表单选择cell 右侧箭头图标，没使用
NSString *const Jh_SelectCell_rightArrow = @"JhForm.bundle/Jh_SelectCell_rightArrow";
/// 表单显示箭头时箭头图标占的宽度，默认25
CGFloat   const Jh_rightArrowWidth = 25;

/// 表单Cell，标题底部提示文字，字体大小，默认12
CGFloat   const Jh_TipInfoFont = 12;
/// 表单Cell，标题底部提示文字高度，默认12
CGFloat   const Jh_TipInfoHeight = 12;
/// 表单Cell ，标题底部提示文字与标题的间距，默认5
CGFloat   const Jh_TipInfoTopMargin = 5;


#pragma mark - 选择图片Cell

/// 表单Cell，选择图片，左间距，默认15
NSUInteger const Jh_ImageLeftMargin = 15;
/// 表单Cell，选择图片，右间距，默认15
NSUInteger const Jh_ImageRightMargin = 15;
/// 表单Cell，选择图片，图片间距，默认3
NSUInteger const Jh_ImageMargin = 3;
/// 表单Cell，选择图片，一行几张图片，默认4张
NSUInteger const Jh_ImageOneLineCount = 4;
/// 表单Cell，选择图片，photo顶部底部间距，默认10
NSUInteger const Jh_OnePhotoViewTopMargin = 10;

/// 表单选择图片附件数，默认8
NSUInteger const Jh_GlobalMaxImages = 8;
/// 选择图片Cell，添加图标
NSString *const Jh_AddIcon = @"JhForm.bundle/compose_picture_add";


///// 表单Cell，选择图片，加载失败占位图，没使用
//NSString *const Jh_PlaceholderImage = @"JhForm.bundle/compose_picture_add";
///// 表单Cell，选择图片，删除图标，没使用
//NSString *const Jh_DeleteIcon = @"JhForm.bundle/compose_picture_add";


#pragma mark - 选择按钮 Cell

/// 选择按钮Cell，未选中图片，默认空心灰色圆，
NSString *const Jh_SelectBtnCell_UnSelectIcon = @"JhForm.bundle/ic_circle_unSelect";
/// 选择按钮Cell，选中图片1，默认圆形蓝色对勾
NSString *const Jh_SelectBtnCell_SelectIcon = @"JhForm.bundle/ic_circle_select";
/// 选择按钮Cell，选中图片2，圆形黑色小圆点
NSString *const Jh_SelectBtnCell_SelectIcon2 = @"JhForm.bundle/ic_circle_select2";

/// 选择按钮Cell，按钮左间距，默认10
CGFloat   const Jh_SelectBtnCell_LeftMargin = 10;
/// 选择按钮Cell，按钮水平间距，默认10
CGFloat   const Jh_SelectBtnCell_BtnHorizontalMargin = 10;
/// 选择按钮Cell，按钮垂直间距，默认10
CGFloat   const Jh_SelectBtnCell_BtnVerticalMargin = 10;
/// 选择按钮Cell，按钮高度，默认24
CGFloat   const Jh_SelectBtnCell_BtnHeight = 24;
/// 选择按钮Cell，按钮title左右空白大小，默认10
CGFloat   const Jh_SelectBtnCell_BtnTitleBlank = 10;
/// 选择按钮Cell，按钮图标和文字间距，默认10
CGFloat   const Jh_SelectBtnCell_BtnIconSpace = 10;
/// 选择按钮Cell，按钮圆角，默认0
CGFloat   const Jh_SelectBtnCell_BtnCornerRadius = 0;
/// 选择按钮Cell，按钮边框宽度，默认0
CGFloat   const Jh_SelectBtnCell_BtnBorderWidth = 0;


#pragma mark - TextViewCell

/// TextViewCell，TextView高度，默认100 ，顶部标题高度为Jh_DefaultCellHeight，
CGFloat   const Jh_DefaultInputTextViewHeight = 100;
/// TextViewCell，字数提示文字字体大小，默认12
CGFloat   const Jh_LengthTipFont = 12;


#pragma mark - 提交按钮

/// 表单提交按钮，上下间距，默认25（上25，下25）
CGFloat   const Jh_SubmitBtn_TBSpace = 25;
/// 表单提交按钮，左右间距，默认15（左15，右15）
CGFloat   const Jh_SubmitBtn_LRSpace = 15;
/// 表单提交按钮，圆角，默认5
CGFloat   const Jh_SubmitBtn_CornerRadius = 5;
/// 表单提交按钮，高度，默认40
CGFloat   const Jh_SubmitBtn_Height = 40;
/// 表单提交按钮，字体大小，默认17
CGFloat   const Jh_SubmitBtn_TextFontSize = 17;
/// 表单提交按钮，标题文字，默认：提 交
NSString *const Jh_SubmitBtn_Text = @"提 交";


#pragma mark - header和footer

/// 头部标题字体大小，默认15
CGFloat   const Jh_HeaderTitleFont = 15;
/// 尾部标题字体大小，默认15
CGFloat   const Jh_FooterTitleFont = 15;
