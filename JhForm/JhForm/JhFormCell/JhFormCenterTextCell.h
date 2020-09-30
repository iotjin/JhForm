//
//  JhFormCenterTextCell.h
//  JhReader
//
//  Created by Jh on 2019/3/13.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormBaseCell.h"


@class JhFormCellModel;

@interface JhFormCenterTextCell : JhFormBaseCell

@property (nonatomic, strong) JhFormCellModel *data;

@end


@interface UITableView (JhFormCenterTextCell)

- (JhFormCenterTextCell *)CenterTextWithId:(NSString *)cellId;

@end
