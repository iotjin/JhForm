//
//  JhFormTableView.h
//  JhForm
//
//  Created by Jh on 2020/11/23.
//  Copyright © 2020 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JhFormCellModel;
@interface JhFormTableView : UITableView

/** 数据源  */
@property (nonatomic, strong) NSMutableArray *Jh_formModelArr;

/** 点击 cell 时执行的 Block */
@property (nonatomic,   copy) void(^Jh_cellSelectBlock)(JhFormCellModel *cellModel,NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
