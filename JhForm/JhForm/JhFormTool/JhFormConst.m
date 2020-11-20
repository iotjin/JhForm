//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormConst.h"

/// iOS 13 生效，主题样式
const JhThemeType Jh_ThemeType = JhThemeTypeAuto;

/// title 垂直方向对齐样式
const JhCellTextVerticalStyle Jh_CellTextVerticalStyle = JhCellTextVerticalStyleTop;

// 表单标题宽度
const CGFloat Jh_TitleWidth = 100.0f;
// 表单标题高度
const CGFloat Jh_TitleHeight = 24.0f;
// 表单标题字体大小
const CGFloat Jh_TitleFont = 15.0f;
// 表单详情字体大小
const CGFloat Jh_InfoFont = 15.0f;

/// 表单条目，左侧边缘距离
const CGFloat Jh_Margin_Left = 15.0f;
/// 表单条目，右侧边缘距离
const CGFloat Jh_Margin_Right= 10.0f;

/// 红星在前的样式中，tilte 往左侧的偏移量
const CGFloat Jh_redStarLeftOffset = 5.0f;

/// 表单底部线距离左侧边缘距离
const CGFloat Jh_LineEdgeMargin = 16.0f;

/// 表单条目，右侧自定义视图的右间距
const CGFloat Jh_CustumRightView_rightEdgeMargin = 5.0f;


// 表单条目初始高度
const CGFloat Jh_DefaultCellHeight = 44.0f;
const CGFloat Jh_DefaultTextViewCellHeight = 150.0f; //(默认输入50字的高度)
const CGFloat Jh_DefaultCustumBottomViewCellHeight = 264.0f;

/// 表单输入字数限制
const NSUInteger Jh_GlobalMaxInputLength = 50;
/// 表单 TextView 字数提示文字字体大小
const CGFloat Jh_LengHintFont = 12.0f;

/// 表单选择图片附件数
/// 如果值大于8，要修改 selectImageCell 此行代码 【row = row > 2 ? 2: row】
const NSUInteger Jh_GlobalMaxImages = 8;

/// 表单添加图标
NSString * const Jh_AddIcon = @"JhForm.bundle/compose_picture_add";
/// 表单选择cell 右侧箭头图标
NSString * const Jh_SelectCell_rightArrow = @"JhForm.bundle/Jh_SelectCell_rightArrow";

/// 表单选择 cell，左侧图片宽高
const CGFloat Jh_LeftImgWH = 24.0f;
/// 表单选择 cell，左侧图片右侧间距
const CGFloat Jh_LeftImgRightMargin = 10.0f;


#pragma mark - 提交按钮

/// 表单提交按钮，上下间距
const CGFloat Jh_SubmitBtn_TBSpace = 25.0f;
/// 表单提交按钮，左右间距
const CGFloat Jh_SubmitBtn_LRSpace = 15.0f;
/// 表单提交按钮，圆角
const CGFloat Jh_SubmitBtn_CornerRadius = 5.0f;
/// 表单提交按钮，高度
const CGFloat Jh_SubmitBtn_Height = 40.0f;
/// 表单提交按钮，字体大小
const CGFloat Jh_SubmitBtn_TextFontSize = 17.0f;
/// 表单提交按钮，标题文字
NSString * const Jh_SubmitBtn_Text = @"提 交";


#pragma mark - 选择按钮 Cell

/// 选择按钮Cell，未选中图片
NSString * const Jh_SelectBtnCell_UnSelectIcon = @"JhForm.bundle/ic_circle_unSelect";
/// 选择按钮Cell，选中图片1
NSString * const Jh_SelectBtnCell_SelectIcon = @"JhForm.bundle/ic_circle_select";
/// 选择按钮Cell，选中图片2
NSString * const Jh_SelectBtnCell_SelectIcon2 = @"JhForm.bundle/ic_circle_select2";

/// 选择按钮Cell，按钮左间距
const CGFloat Jh_SelectBtnCell_LeftMargin = 10.0f;
/// 选择按钮Cell，按钮水平间距
const CGFloat Jh_SelectBtnCell_BtnHorizontalMargin = 10.0f;
/// 选择按钮Cell，按钮垂直间距
const CGFloat Jh_SelectBtnCell_BtnVerticalMargin = 10.0f;
/// 选择按钮Cell，按钮高度
const CGFloat Jh_SelectBtnCell_BtnHeight = 24.0f;
/// 选择按钮Cell，按钮title左右空白大小
const CGFloat Jh_SelectBtnCell_BtnTitleBlank = 10.0f;
/// 选择按钮Cell，按钮图标和文字间距
const CGFloat Jh_SelectBtnCell_BtnIconSpace = 10.0f;
/// 选择按钮Cell，按钮圆角
const CGFloat Jh_SelectBtnCell_BtnCornerRadius = 0.0f;
/// 选择按钮Cell，按钮边框宽度
const CGFloat Jh_SelectBtnCell_BtnBorderWidth = 0.0f;
