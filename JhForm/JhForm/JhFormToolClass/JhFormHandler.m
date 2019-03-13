//
//  JhFormHandler.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormHandler.h"

#import <UIKit/UIKit.h>
#import "JhFormCellModel.h"

#import "JhFormSectionModel.h"

@implementation JhFormHandler

+ (void)Jh_checkFormNullDataWithWithDatas:(NSArray *)datas success:(void(^)(void))success failure:(void(^)(NSString *error))failure {
    for (int sec = 0; sec < datas.count; sec++) {
        
        JhFormSectionModel *sectionModel = datas[sec];
        for (int row = 0; row < sectionModel.Jh_sectionModelArr.count; row++) {
            JhFormCellModel *rowItem = sectionModel.Jh_sectionModelArr[row];
            
            if (rowItem.Jh_required) {
                
                //我设置的标题都带:所以通过去掉: 拼接提示信息
                NSString *title = [NSString stringWithFormat:@"%@",rowItem.Jh_title];
                NSString *NewTitle = [title substringToIndex:title.length-1];
                
                if (rowItem.Jh_cellType == JhFormCellTypeInput || rowItem.Jh_cellType == JhFormCellTypeTextViewInput) {
                    if (!rowItem.Jh_info || [rowItem.Jh_info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请输入%@", NewTitle]);
                        return;
                    }
                }
                else if (rowItem.Jh_cellType == JhFormCellTypeSelect) {
                    if (!rowItem.Jh_info || [rowItem.Jh_info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请选择%@", NewTitle]);
                        return;
                    }
                }
                else if (rowItem.Jh_cellType == JhFormCellTypeSelectImage) {
                    if (!rowItem.Jh_imageArr || rowItem.Jh_imageArr.count == 0) {
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
