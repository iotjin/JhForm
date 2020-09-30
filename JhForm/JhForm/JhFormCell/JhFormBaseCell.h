//
//  JhFormBaseCell.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelwynExpandableTextView;

@interface JhFormBaseCell : UITableViewCell

@property (nonatomic, strong) SelwynExpandableTextView *rightTextView;

/** 表单标题 */
@property (nonatomic, strong) UILabel *titleLabel;

/** 表单条目所在的tableView */
@property (nonatomic, weak) UITableView *baseTableView;

@end

