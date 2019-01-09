//
//  JhFormHandler.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//





#import <Foundation/Foundation.h>

/**
 JhFormHandler 数据校验文件，包含相机权限、相册权限以及表单空数据校验
 */
@interface JhFormHandler : NSObject

/**
 必选(必填)数据空数据校验，可根据需求定制

 @param datas 表单数据源
 @param success 必选(必填)数据全部校验成功
 @param failure 必选(必填)数据某一项校验失败
 */
+ (void)Jh_checkFormNullDataWithWithDatas:(NSArray *)datas success:(void(^)(void))success failure:(void(^)(NSString *error))failure;



@end
