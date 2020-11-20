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
    for (int section = 0; section < datas.count; section++) {
        JhFormSectionModel *sectionModel = datas[section];
        
        for (int row = 0; row < sectionModel.Jh_sectionModelArr.count; row++) {
            JhFormCellModel *cellModel = sectionModel.Jh_sectionModelArr[row];
            
            if (cellModel.Jh_required) {
                
                NSString *title = cellModel.Jh_title;
                // 删除标题末尾的:之前进行判断
                if ([title hasSuffix:@":"] || [title hasSuffix:@"："]) {
                    title = [title substringToIndex:title.length - 1];
                }
                
                if (cellModel.Jh_cellType == JhFormCellTypeInput ||
                    cellModel.Jh_cellType == JhFormCellTypeTextViewInput ||
                    cellModel.Jh_cellType == JhFormCellTypePwdInput) {
                    if (!cellModel.Jh_info || [cellModel.Jh_info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请输入%@", title]);
                        return;
                    }
                } else if (cellModel.Jh_cellType == JhFormCellTypeSelect) {
                    if (!cellModel.Jh_info || [cellModel.Jh_info isEqualToString:@""]) {
                        failure([NSString stringWithFormat:@"请选择%@", title]);
                        return;
                    }
                } else if (cellModel.Jh_cellType == JhFormCellTypeSelectImage) {
                    if (!cellModel.Jh_imageArr || cellModel.Jh_imageArr.count == 0) {
                        failure([NSString stringWithFormat:@"请选择%@", title]);
                        return;
                    }
                }
            }
        }
    }
    success();
}

@end
