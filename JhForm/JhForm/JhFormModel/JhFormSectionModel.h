//
//  JhFormSectionModel.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 JhFormSectionModel 主要对表单section条目提供动态配置属性
 */
@interface JhFormSectionModel : NSObject

/**
 表单section包含的条目集合
 */
@property (nonatomic, strong, nonnull) NSArray *Jh_sectionModelArr;

/**
 表单section头部高度
 */
@property (nonatomic, assign) CGFloat Jh_headerHeight;

/**
 表单section尾部高度
 */
@property (nonatomic, assign) CGFloat Jh_footerHeight;

/**
 表单section头部视图
 */
@property (nonatomic, strong, nullable) UIView *Jh_headerView;

/**
 表单section尾部视图
 */
@property (nonatomic, strong, nullable) UIView *Jh_footerView;

@end


/**
 快捷构建表单section条目

 @param Jh_sectionModelArr 表单section包含的条目集合
 */
FOUNDATION_EXPORT JhFormSectionModel *JhSectionModel_Add(NSArray * _Nonnull Jh_sectionModelArr);
