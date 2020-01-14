//
//  JhFormConst.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormConst.h"

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
CGFloat const Jh_DefaultSelectImageCellHeight = 264;
CGFloat const Jh_DefaultSelectImageCellHeight_oneRow = 164; //选择图片只有一行的高度


// 表单输入字数限制
NSUInteger const Jh_GlobalMaxInputLength = 50;

// 表单选择图片附件数
NSUInteger const Jh_GlobalMaxImages = 8;

// 表单TextView字数提示文字大小
CGFloat const Jh_LengHintFont = 12;

//// 表单图片条目图片加载失败占位图
//NSString *const Jh_PlaceholderImage = @"JhForm.bundle/JhPlaceholderIcon";
//
//// 表单附件删除图标
//NSString *const Jh_DeleteIcon = @"JhForm.bundle/JhDeleteIcon";

// 表单添加图标
NSString *const Jh_AddIcon = @"JhForm.bundle/compose_picture_add";

// 表单选择cell右侧箭头
NSString *const Jh_SelectCell_rightArrow = @"JhForm.bundle/Jh_SelectCell_rightArrow";




JhThemeType const Jh_ThemeType = JhThemeTypeLight;

