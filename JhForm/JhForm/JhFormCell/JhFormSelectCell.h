//
//  JhFormSelectCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormItem;

/**
 JhFormSelectCell 表单选择条目
 */
@interface JhFormSelectCell : JhFormBaseCell

@property (nonatomic, strong) JhFormItem *item;

+ (CGFloat)heightWithItem:(JhFormItem *)item;

@end


@interface UITableView (JhFormSelectCell)

- (JhFormSelectCell *)selectCellWithId:(NSString *)cellId;


@end
