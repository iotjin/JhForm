//
//  JhFormTableViewVC.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "JhFormConst.h"
#import "HXPhotoPicker.h"
#import "JhFormCellModel.h"
#import "JhFormSectionModel.h"
#import "JhFormHandler.h"

NS_ASSUME_NONNULL_BEGIN




typedef void(^JhFormSubmitBlock)(void);

@interface JhFormTableViewVC : UIViewController

/**
 表单tableView
 */
@property (strong , nonatomic) UITableView  *Jh_formTableView;

/** 标题 */
@property (strong, nonatomic) NSString  *Jh_navTitle;
/** 提交文字 */
@property (strong, nonatomic) NSString  *Jh_submitStr;

/**
 表单数据源，数据源格式应为 @[JhFormSection..]，否则断言会直接崩溃
 */
@property (strong, nonatomic) NSMutableArray *Jh_formModelArr;


/**
 提交操作事件block，包含提交操作表单页面提交按钮点击事件实现回调
 */
@property (copy, nonatomic) JhFormSubmitBlock Jh_formSubmitBlock;


/**
 隐藏默认的footerView
 */
@property (assign, nonatomic) BOOL Jh_defaultFooterViewHidden;




@end

NS_ASSUME_NONNULL_END
