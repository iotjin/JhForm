//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormConst.h"



//主题设置为light
//JhThemeType const Jh_ThemeType = JhThemeTypeLight;
JhThemeType const Jh_ThemeType = JhThemeTypeAuto;

//cell文字垂直样式设置为居上
JhCellTextVerticalStyle const Jh_CellTextVerticalStyle = JhCellTextVerticalStyleTop;


// 表单提交按钮 上下间距   默认25（上25，下25）
CGFloat const Jh_SubmitBtn_TBSpace = 25.0f;

// 表单提交按钮 左右间距   默认15（左15，右15）
CGFloat const Jh_SubmitBtn_LRSpace = 15.0f;

// 表单提交按钮 圆角   默认5
CGFloat const Jh_SubmitBtn_CornerRadius = 5.0f;

//表单提交按钮 高度   默认40
CGFloat const Jh_SubmitBtn_Height = 40.0f;

//表单提交按钮 文字大小 默认17
CGFloat const Jh_SubmitBtn_TextFontSize = 17.0f;

//表单提交按钮 文字  默认 ：提 交
NSString *const Jh_SubmitBtn_Text = @"提 交";




// 表单标题字体大小
CGFloat const Jh_TitleFont = 15.0f;

// 表单详情字体大小
CGFloat const Jh_InfoFont = 15.0f;

/**
 表单条目左侧边缘距离，缺省为15.0f
 */
CGFloat const Jh_Margin_left = 15.0f;

/**
 表单条目右侧边缘距离，缺省为10.0f
 */
CGFloat const Jh_EdgeMargin= 10.0f;

/** 红星在前样式,tilte往左侧偏移量 */
CGFloat const Jh_redStarLeftOffset = 5.0f;

/**
 表单底部线距离左侧边缘距离，缺省为16.0f (尽量不要动,只在几个cell中使用了)
 */
CGFloat const Jh_LineEdgeMargin = 16.0f;


// 表单标题宽度
CGFloat const Jh_TitleWidth = 100.0f;

// 表单标题高度
CGFloat const Jh_TitleHeight = 24.0f;

// 表单条目初始高度
CGFloat const Jh_DefaultCellHeight = 44.0f;
CGFloat const Jh_DefaultTextViewCellHeight = 150.0f; //(默认输入50字的高度)
CGFloat const Jh_DefaultCustumBottomViewCellHeight = 264.0f;
//CGFloat const Jh_DefaultSelectImageCellHeight = 264;
//CGFloat const Jh_DefaultSelectImageCellHeight_oneRow = 164; //选择图片只有一行的高度


// 表单输入字数限制
NSUInteger const Jh_GlobalMaxInputLength = 50;

// 表单TextView字数提示文字大小
CGFloat const Jh_LengHintFont = 12;

// 表单选择图片附件数
NSUInteger const Jh_GlobalMaxImages = 8;  //大于8 要修改selectImageCell 此行代码 【row = row > 2?2: row】

//// 表单图片条目图片加载失败占位图
//NSString *const Jh_PlaceholderImage = @"JhForm.bundle/JhPlaceholderIcon";
//
//// 表单附件删除图标
//NSString *const Jh_DeleteIcon = @"JhForm.bundle/JhDeleteIcon";

// 表单添加图标
NSString *const Jh_AddIcon = @"JhForm.bundle/compose_picture_add";

// 表单选择cell右侧箭头
NSString *const Jh_SelectCell_rightArrow = @"JhForm.bundle/Jh_SelectCell_rightArrow";

// 表单选择cell左侧图片宽高，默认24
CGFloat const Jh_LeftImgWH = 24;

// 表单选择cell左侧图片右侧间距， 默认10
CGFloat const Jh_LeftImgRightMargin = 10;


#pragma mark - 选择按钮Cell

// 表单选择按钮cell 未选中图片
NSString *const Jh_SelectBtnCell_UnSelectIcon = @"JhForm.bundle/ic_circle_unSelect";
// 表单选择按钮cell 选中图片
NSString *const Jh_SelectBtnCell_SelectIcon = @"JhForm.bundle/ic_circle_select";
/** 表单 选择按钮Cell    选中图标2，圆形黑色小圆点 ，未使用*/
NSString *const Jh_SelectBtnCell_SelectIcon2 = @"JhForm.bundle/ic_circle_select2";


/** 选择按钮Cell    按钮左间距，默认10 */
CGFloat const Jh_SelectBtnCell_LeftMargin = 10;
/** 选择按钮Cell    按钮水平间距，默认10 */
CGFloat const Jh_SelectBtnCell_BtnHorizontalMargin = 10;
/** 选择按钮Cell    按钮垂直间距，默认10 */
CGFloat const Jh_SelectBtnCell_BtnVerticalMargin = 10;
/** 选择按钮Cell    按钮高度，默认24 */
CGFloat const Jh_SelectBtnCell_BtnHeight = 24;
/** 选择按钮Cell    按钮title左右空白大小 ，默认10*/
CGFloat const Jh_SelectBtnCell_BtnTitleBlank = 10;
/** 选择按钮Cell    按钮图标和文字间距，默认10 */
CGFloat const Jh_SelectBtnCell_BtnIconSpace = 10;
/** 选择按钮Cell    按钮圆角，默认0 */
CGFloat const Jh_SelectBtnCell_BtnCornerRadius = 0;
/** 选择按钮Cell    按钮边框宽度，默认0 */
CGFloat const Jh_SelectBtnCell_BtnBorderWidth = 0;
