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

/// 对表单 section 条目提供动态配置
@interface JhFormSectionModel : NSObject

/// 表单 section 包含的条目数组
@property (nonatomic, strong, nonnull) NSArray *Jh_sectionModelArr;

/// section header 高度
@property (nonatomic, assign) CGFloat Jh_headerHeight;
/// section footer 高度
@property (nonatomic, assign) CGFloat Jh_footerHeight;

/// section header 视图
@property (nonatomic, strong, nullable) UIView *Jh_headerView;
/// section footer 视图
@property (nonatomic, strong, nullable) UIView *Jh_footerView;

@end

/// 快捷添加表单 section
/// @param Jh_sectionModelArr 表单 section 包含的条目数组
FOUNDATION_EXPORT JhFormSectionModel *JhSectionModel_Add(NSArray * _Nonnull Jh_sectionModelArr);

NS_ASSUME_NONNULL_END
