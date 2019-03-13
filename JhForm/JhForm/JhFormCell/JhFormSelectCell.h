//
//  JhFormSelectCell.h
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"

@class JhFormCellModel;

/**
 JhFormSelectCell 表单选择条目
 */
@interface JhFormSelectCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data;

@end


@interface UITableView (JhFormSelectCell)

- (JhFormSelectCell *)selectCellWithId:(NSString *)cellId;


@end
