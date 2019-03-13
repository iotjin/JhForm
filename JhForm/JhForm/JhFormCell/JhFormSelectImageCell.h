//
//  JhFormSelectImageCell.h
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormCellModel;


/**
 图片选择或删除block
 
 @param imageArr 当前已存在图片数组
 */
typedef void(^JhImageSelectBlock)(NSArray *imageArr);


@interface JhFormSelectImageCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

@property (nonatomic, copy) JhImageSelectBlock JhImageSelectBlock;

@end


@interface UITableView (JhFormSelectImageCell)

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId;

@end
