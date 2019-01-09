//
//  JhFormData.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  主要对表单条目提供动态配置属性,添加数据

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JhFormData;

typedef NS_ENUM(NSInteger, JhFormItemType) {
    /**
     表单条目可单行或多行输入（标题居左）
     */
    JhFormItemTypeInput = 0,
    /**
     表单条目可选择（标题居左）
     */
    JhFormItemTypeSelect = 1,
    /**
     表单条目可多行输入（标题居上）
     */
    JhFormItemTypeTextViewInput = 2,
    /**
     表单条目包含图片选择
     */
    JhFormItemTypeImage = 3,
};

typedef NS_ENUM(NSInteger, JhFormItemUnitType) {
    JhFormItemUnitTypeNone = 0, // 无单位
    JhFormItemUnitTypeYuan, // 元
    JhFormItemUnitTypeYear, // 年
    JhFormItemUnitTypeMillion, // 万元
    JhFormItemUnitTypeCustom, // 自定义单位
};

typedef void(^JhFormDataSelectCompletion)(JhFormData *data);

@interface JhFormData : NSObject





@end

