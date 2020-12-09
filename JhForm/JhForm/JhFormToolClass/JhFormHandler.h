//
//  JhFormHandler.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 数据校验
@interface JhFormHandler : NSObject

/**
 对必选(必填)数据是否为空进行校验，可根据需求定制

 @param datas 表单数据源
 @param success 必选(必填)数据全部校验成功
 @param failure 必选(必填)数据某一项校验失败 ,返回拼接的提示信息
 */
+ (void)Jh_checkEmptyWithFormData:(NSArray *)datas success:(void(^)(void))success failure:(void(^)(NSString *error))failure;

@end
