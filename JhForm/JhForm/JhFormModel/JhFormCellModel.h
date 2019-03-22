//
//  JhFormCellModel.h
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//  主要对表单条目提供动态配置属性

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "HXPhotoPicker.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/** 主题色 */
#define BaseThemeColor JhColor(46, 150, 213)
/** 背景色 */
#define BaseBgWhiteColor JhColor(248, 248, 248)
/** line背景色 */
#define BaselineColor JhColor(230, 230, 230)

#define Kwidth  [UIScreen mainScreen].bounds.size.width
#define Kheight  [UIScreen mainScreen].bounds.size.height

/** X是44,其他是20 */
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kContentNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kNavHeight (kStatusBarHeight + kContentNavBarHeight)
#define kBottomSafeHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)


@class JhFormCellModel;

typedef NS_ENUM(NSInteger, JhFormCellType) {
    
    /** 表单条目可单行或多行输入（标题居左） */
    JhFormCellTypeInput = 0,
    
    /** 表单条目可选择（标题居左） */
    JhFormCellTypeSelect ,
    
    /**  表单条目可多行输入（标题居上）*/
    JhFormCellTypeTextViewInput ,
    
    /**  表单右侧自定义 */
    JhFormCellTypeCustumRight ,
    
    /**  表单右侧SwitchBtn  */
    JhFormCellTypeRightSwitchBtn,
    
    /**   表单文字在cell中间  */
    JhFormCellTypeCenterTextCell ,
    
    /**  表单底部自定义 */
    JhFormCellTypeCustumBottom ,
    
    /**  表单条目包含图片选择  */
    JhFormCellTypeSelectImage ,
};

typedef NS_ENUM(NSInteger, JhFormCellUnitType) {
    /** 无单位 */
    JhFormCellUnitTypeNone = 0,
    /** 元 */
    JhFormCellUnitTypeYuan,
    /** 年 */
    JhFormCellUnitTypeYear,
    /** 万元 */
    JhFormCellUnitTypeMillion,
    /** 自定义单位 */
    JhFormCellUnitTypeCustom,
};


typedef NS_ENUM(NSInteger, JhFormCellInfoTextAlignmentStyle)
{
    /** 居左 离初始位置默认10 */
    JhFormCellInfoTextAlignmentLeft = 0,
    /** 居右 离初始位置默认10 */
    JhFormCellInfoTextAlignmentRight,           
};


typedef void(^JhCellSelectCellBlock)(JhFormCellModel *cellModel);

typedef void(^JhCellCustumRightViewBlock)(UIView *RightView);

typedef void(^JhCellCustumBottomViewBlock)(UIView *BottomView);

typedef void (^JhCellSwitchBtnBlock)(BOOL switchBtn_on,UISwitch *switchBtn);


@interface JhFormCellModel : NSObject


/** 右侧自定义视图的Block (左默认120 ,右 5,高是cell的高) */
@property (nonatomic, copy, nullable) JhCellCustumRightViewBlock Jh_custumRightViewBlock;
/** 底部自定义视图的Block (左0 ,右0,高默认240)*/
@property (nonatomic, copy, nullable) JhCellCustumBottomViewBlock Jh_custumBottomViewBlock;

/** SwitchBtn Block  */
@property (copy, nonatomic) JhCellSwitchBtnBlock Jh_switchBtnBlock;

/** 点击居中文本的block */
@property (nonatomic, copy) void(^JhCellClickCenterTextBlock)(void);


/**
 表单条目点击选择事件block
 */
@property (nonatomic, copy, nullable) JhCellSelectCellBlock Jh_CellSelectCellBlock;


/**
 表单条目缺省高度，缺省值为44.0f, 可根据需求设置(如果设置底部自定义view 最好设置view的高度+60 )
 */
@property (nonatomic, assign) CGFloat Jh_defaultHeight;

/**
 表单条目类型
 */
@property (nonatomic, assign) JhFormCellType Jh_cellType;

/**
 表单条目标题，表单标题为单行显示，尽可能简短，若标题太长，会牺牲字体大小以达到显示完全的效果 (左侧标题)
 */
@property (nonatomic, copy, nonnull) NSString *Jh_title;
@property (nonatomic, strong, nonnull) NSAttributedString *Jh_attributedTitle;

/**
 表单条目详情 (右侧Text)
 */
@property (nonatomic, copy, nullable) NSString *Jh_info;

/**
 表单条目详情 (右侧Text对应的IdStr)
 */
@property (nonatomic, copy) NSString *Jh_info_idStr;

/**
 表单条目占位字符 (右侧占位字符)
 */
@property (nonatomic, copy, nullable) NSString *Jh_placeholder;
@property (nonatomic, strong, nullable) NSAttributedString *Jh_attributedPlaceholder;

/** 表单条目占位字符 字体大小(默认15) */
@property (assign, nonatomic) CGFloat  Jh_placeholderFont;

/**
  表单条目右侧文本 的排列方式, (居左,居右 ,默认居左,只在选择和输入样式下生效)
 */
@property (nonatomic, assign) JhFormCellInfoTextAlignmentStyle Jh_InfoTextAlignment;

/**
  表单条目右侧 SwitchBtn 开关状态
 */
@property (nonatomic, assign) BOOL Jh_switchBtn_on;
/**
 表单条目右侧 SwitchBtn 开关处于开启状态时的颜色
 */
@property (strong, nonatomic) UIColor  *Jh_switchOnTintColor;
/**
 表单条目右侧 SwitchBtn 开关处于关闭状态时边框的颜色(注意这边是边框的颜色)
 */
@property (strong, nonatomic) UIColor  *Jh_switchTintColor;




/**
 是否显示表单条目占位字符 YES:显示 NO:不显示 --- 新增 default is YES；详情 default is NO
 */
@property (nonatomic, assign) BOOL Jh_showPlaceholder;


/**
 图片附件条目图片数组，支持UIImage、NSURL、NSString(图片URLString)类型元素
 */
@property (nonatomic, strong, nullable) NSArray *Jh_imageArr;
/**
 images 图片数组中类型筛选出为UIImage的数组子集，以实现图片上传筛选
 */
@property (nonatomic, strong, readonly) NSArray *Jh_selectImageArr;

/**
 表单条目键盘类型
 */
@property (nonatomic, assign) UIKeyboardType Jh_keyboardType;

/**
 表单条目是否可编辑 YES:可编辑 NO:不可编辑
 */
@property (nonatomic, assign) BOOL Jh_editable;

/**
 表单条目是否必填(必选) YES:必填(必选) NO:可填(可选)
 */
@property (nonatomic, assign) BOOL Jh_required;



/**
 JhFormCellTypeInput 以及 JhFormCellTypeTextViewInput 类别中表示最大输入字数 (默认200)
 0 表示无限制
 */
@property (nonatomic, assign) NSUInteger Jh_maxInputLength;

/**
 JhFormCellTypeImage 类别中表示最大选择图片数
 */
@property (nonatomic, assign) NSUInteger Jh_maxImageCount;


/**
 条目附带单位
 */
@property (nonatomic, copy, nullable) NSString *Jh_unit;

/**
 表单条目单位类别
 */
@property (nonatomic, assign) JhFormCellUnitType Jh_cellUnitType;

/**
 是否显示当前字数 (默认不显示)
 只在 JhFormCellTypeTextViewInput 类型下有效，若无最大字数限制，则只显示字数； 若有字数限制，则显示 "当前字数/最大字数"
 */
@property (nonatomic, assign) BOOL Jh_showLength;

@end

/**
 JhFormCellModel_Add 快捷构建新增表单条目
 
 @param title 标题
 @param info 详情
 @param cellType 条目类别
 @param editable 是否可编辑
 @param required 是否必填
 @param keyboardType 键盘类别
 */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_Add(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType, BOOL editable, BOOL required, UIKeyboardType keyboardType);

/** 快捷构建详情表单条目 (非必选,不可编辑) */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_Info(NSString * _Nonnull title, NSString * _Nullable info, JhFormCellType cellType);


/** 快捷添加一个输入类型的cell(默认样式,居左,可编辑) */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddInputCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required, UIKeyboardType keyboardType);

/** 快捷添加一个选择类型的cell(默认样式,居左) */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSelectCell(NSString * _Nonnull title,NSString * _Nullable info, BOOL required);

/** 快捷添加一个选择图片的cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddImageCell(NSString * _Nonnull title, BOOL required);

/** 快捷添加一个文本居中的 cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title);

/** 快捷添加右侧自定义View cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumRightCell(NSString * _Nonnull title);

/** 快捷添加底部自定义View cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCustumBottomCell(NSString * _Nonnull title);

/** 快捷添加一个文本居中的 cell*/
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddCenterTextCell(NSString * _Nonnull title);



/********************************* 以下方法快捷创建的cell 不是必选 的,需要必须的话再设置 required 为YES ********************************/

/********************************* 快速创建本文居右的cell ********************************/

/** 右文本 快捷添加一个info(居右)的 不可编辑 的cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightTextCell(NSString * _Nonnull title, NSString * _Nullable info);

/** 右箭头 快捷添加一个info(居右)带箭头的 的cell */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddRightArrowCell(NSString * _Nonnull title, NSString * _Nullable info);

/** Switch 快捷添加一个右侧为 SwitchBtn 的cell  */
FOUNDATION_EXPORT JhFormCellModel *JhFormCellModel_AddSwitchBtnCell(NSString * _Nonnull title, BOOL Jh_switchBtn_on);


