//
//  JhFormHandler.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormHandler.h"

#import <UIKit/UIKit.h>
#import "JhFormItem.h"

#import "JhFormSectionItem.h"

@implementation JhFormHandler

+ (void)Jh_checkFormNullDataWithWithDatas:(NSArray *)datas success:(void(^)(void))success failure:(void(^)(NSString *error))failure {
    for (int sec = 0; sec < datas.count; sec++) {
        
        JhFormSectionItem *sectionItem = datas[sec];
        for (int row = 0; row < sectionItem.items.count; row++) {
            JhFormItem *rowItem = sectionItem.items[row];
            
            if (rowItem.required) {
                
                NSString *title = [NSString stringWithFormat:@"%@",rowItem.title];
                NSString *NewTitle = [title substringToIndex:title.length-1];
                
                if (rowItem.itemType == JhFormItemTypeInput || rowItem.itemType == JhFormItemTypeTextViewInput) {
                    if (!rowItem.info || [rowItem.info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请输入%@", NewTitle]);
                        return;
                    }
                }
                else if (rowItem.itemType == JhFormItemTypeSelect) {
                    if (!rowItem.info || [rowItem.info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请选择%@", NewTitle]);
                        return;
                    }
                }
                else if (rowItem.itemType == JhFormItemTypeSelectImage) {
                    if (!rowItem.images || rowItem.images.count == 0) {
                        failure([NSString stringWithFormat:@"请选择%@", NewTitle]);
                        return;
                    }
                }
                
                
                
            }
        }
    }
    success();
}





@end
