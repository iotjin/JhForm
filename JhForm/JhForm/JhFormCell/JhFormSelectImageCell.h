//
//  JhFormSelectImageCell.h
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//  表单图片选择Cell，上标题，下图片选择器。支持相机和图库选择。支持本地图片与网络图片，可设置默认选择图片，最大选择数，底部提示文字

#import "JhFormBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;

/**
 图片选择或删除block
 
 @param imageArr 当前已存在图片数组
 */
typedef void(^JhImageSelectBlock)(NSArray *imageArr);

@interface JhFormSelectImageCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

@property (nonatomic, copy) JhImageSelectBlock JhImageSelectBlock;

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end

@interface UITableView (JhFormSelectImageCell)

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId;

@end

NS_ASSUME_NONNULL_END
