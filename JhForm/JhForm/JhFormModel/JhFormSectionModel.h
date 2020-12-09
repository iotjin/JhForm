//
//  JhFormSectionModel.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 对表单 section Cell提供动态配置
@interface JhFormSectionModel : NSObject

/// 表单 section 包含的Cell数组
@property (nonatomic, strong, nonnull) NSArray *Jh_sectionModelArr;
/// section header 高度
@property (nonatomic, assign) CGFloat Jh_headerHeight;
/// section footer 高度
@property (nonatomic, assign) CGFloat Jh_footerHeight;
/// section header 视图，优先级高于下面单个属性设置
@property (nonatomic, strong) UIView *Jh_headerView;
/// section footer 视图，优先级高于下面单个属性设置
@property (nonatomic, strong) UIView *Jh_footerView;

/// 头部标题
@property (nonatomic, strong) NSString *Jh_headerTitle;
/// 头部标题字体大小，默认15
@property (nonatomic, assign) CGFloat Jh_headerTitleFont;
/// 头部标题字体颜色，默认JhBaseLabelColor
@property (nonatomic, strong) UIColor *Jh_headerTitleColor;
/// 头部背景颜色，默认 JhBaseBgColor
@property (nonatomic, strong) UIColor *Jh_headerBgColor;

/// 尾部标题
@property (nonatomic, strong) NSString *Jh_footerTitle;
/// 尾部标题字体大小，默认15
@property (nonatomic, assign) CGFloat Jh_footerTitleFont;
/// 尾部标题字体颜色，默认JhBaseLabelColor
@property (nonatomic, strong) UIColor *Jh_footerTitleColor;
/// 尾部标题字体颜色，默认 JhBaseBgColor
@property (nonatomic, strong) UIColor *Jh_footerBgColor;


@end

/// 快捷添加表单 section
/// @param Jh_sectionModelArr 表单 section 包含的Cell数组
FOUNDATION_EXPORT JhFormSectionModel *JhSectionModel_Add(NSArray * _Nonnull Jh_sectionModelArr);

NS_ASSUME_NONNULL_END
