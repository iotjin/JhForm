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

/** 导航栏右侧标题 */
@property(nonatomic,strong) NSString * Jh_navRightTitle;
/** 导航栏右侧img */
@property(nonatomic,strong) NSString * Jh_navRightImage;
/** 点击导航栏右侧item Block */
@property (nonatomic, copy) void(^JhClickNavRightItemBlock)(void);


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
@property (assign, nonatomic) BOOL Jh_hiddenDefaultFooterView;

/** 统一配置cell左侧title的宽度(默认100) */
@property (assign, nonatomic) CGFloat  Jh_leftTitleWidth;


/** 可隐藏整个页面的红星按只有标题显示 */
@property (assign, nonatomic) CGFloat  Jh_leftTitleHiddenRedStar;


/** 设置主题为light(不跟随系统设置切换 ,iOS13生效) */
@property (assign, nonatomic) BOOL Jh_useLightTheme;


@end

NS_ASSUME_NONNULL_END
