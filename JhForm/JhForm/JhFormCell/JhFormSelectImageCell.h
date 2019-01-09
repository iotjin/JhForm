//
//  JhFormSelectImageCell.h
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormItem;


/**
 图片选择或删除block
 
 @param images 当前已存在图片数组
 */
typedef void(^JhImageSelectCompletion)(NSArray *images);


@interface JhFormSelectImageCell : JhFormBaseCell

@property (nonatomic, strong) JhFormItem *item;

@property (nonatomic, copy) JhImageSelectCompletion imageSelectCompletion;

@end


@interface UITableView (JhFormSelectImageCell)

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId;

@end
