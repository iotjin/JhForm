//
//  JhFormItem.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormItem.h"
#import "JhFormConst.h"


static NSString *const SWUnitYuan = @"元";
static NSString *const SWUnitYear = @"年";
static NSString *const SWUnitMillion = @"万元";

@interface JhFormItem()

+ (instancetype)sw_itemWithTitle:(NSString *)title info:(NSString *)info itemType:(JhFormItemType)itemType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType;

+ (instancetype)sw_itemWithTitle:(NSString *)title info:(NSString *)info itemType:(JhFormItemType)itemType;

@end

inline JhFormItem *JhFormItem_Add(NSString * _Nonnull title, NSString * _Nullable info, JhFormItemType itemType, BOOL editable, BOOL required, UIKeyboardType keyboardType) {
    return [JhFormItem sw_itemWithTitle:title info:info itemType:itemType editable:editable required:required keyboardType:keyboardType];
}

inline JhFormItem *JhFormItem_Info(NSString * _Nonnull title, NSString * _Nullable info, JhFormItemType itemType) {
    return [JhFormItem sw_itemWithTitle:title info:info itemType:itemType];
}

@implementation JhFormItem

+ (instancetype)sw_itemWithTitle:(NSString *)title info:(NSString *)info itemType:(JhFormItemType)itemType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType {
    return [[self alloc]initWithTitle:title info:info itemType:itemType editable:editable required:required keyboardType:keyboardType images:nil showPlaceholder:YES];
}

+ (instancetype)sw_itemWithTitle:(NSString *)title info:(NSString *)info itemType:(JhFormItemType)itemType {
    return [[self alloc]initWithTitle:title info:info itemType:itemType editable:NO required:NO keyboardType:UIKeyboardTypeDefault images:nil showPlaceholder:NO];
}

- (instancetype)initWithTitle:(NSString *)title info:(NSString *)info itemType:(JhFormItemType)itemType editable:(BOOL)editable required:(BOOL)required keyboardType:(UIKeyboardType)keyboardType images:(NSArray *)images showPlaceholder:(BOOL)showPlaceholder{
    self = [super init];
    if (self) {
        self.itemUnitType = JhFormItemUnitTypeNone;
        self.maxInputLength = Jh_GlobalMaxInputLength;
        self.maxImageCount = Jh_GlobalMaxImages;
        self.title = title;
        self.info = info;
        self.itemType = itemType;
        self.editable = editable;
        self.required = required;
        self.keyboardType = keyboardType;
        self.images = images;
        self.showPlaceholder = showPlaceholder;
        [self jh_setDefaultHeight:itemType];
        [self jh_setPlaceholderWithShow:showPlaceholder itemType:itemType];
        [self jh_setAttributedTitleWithRequired:required title:title itemType:itemType];
    }
    return self;
}

#pragma mark -- 根据表单条目类型设置条目缺省高度
- (void)jh_setDefaultHeight:(JhFormItemType)itemType {
    self.defaultHeight = itemType == JhFormItemTypeTextViewInput ? Jh_DefaultTextViewItemHeight:Jh_DefaultItemHeight;
}

#pragma mark -- 设置是否显示输入框占位字符
- (void)jh_setPlaceholderWithShow:(BOOL)show itemType:(JhFormItemType)itemType {
    if (!show) {
        self.placeholder = @"";
        return;
    }
    switch (itemType) {
        case JhFormItemTypeInput:
        case JhFormItemTypeTextViewInput:
        {
            self.placeholder = @"请输入";
        }
            break;
        case JhFormItemTypeSelect:
        {
            self.placeholder = @"请选择";
        }
            break;
        default:
            self.placeholder = @"";
            break;
    }
}

#pragma mark -- 设置标题显示
- (void)jh_setAttributedTitleWithRequired:(BOOL)required title:(NSString *)title itemType:(JhFormItemType)itemType{
    if (required) {
        if (Jh_TitleShowType == JhTitleShowTypeDefault) {
            switch (self.itemType) {
                case JhFormItemTypeInput:
                case JhFormItemTypeTextViewInput:
                {
                    title = [NSString stringWithFormat:@"%@(必填)", title];
                }
                    break;
                case JhFormItemTypeSelect:
                case JhFormItemTypeSelectImage:
                {
                    title = [NSString stringWithFormat:@"%@(必选)", title];
                }
                    break;
                default:
                    break;
            }
        }
        else if (Jh_TitleShowType == JhTitleShowTypeRedStarFront) {
            title = [NSString stringWithFormat:@"*%@", title];
        }
        else if (Jh_TitleShowType == JhTitleShowTypeRedStarBack) {
            title = [NSString stringWithFormat:@"%@*", title];
        }
    }
    
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Jh_TitleFont], NSForegroundColorAttributeName:Jh_TITLECOLOR}];
    
    if (required) {
        if (Jh_TitleShowType == JhTitleShowTypeRedStarFront) {
            [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
        }
        else if (Jh_TitleShowType == JhTitleShowTypeRedStarBack) {
            [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(title.length - 1, 1)];
        }
    }
    _attributedTitle = attributedTitle;
}

#pragma mark -- 重写get方法
- (NSArray *)selectImages {
    NSMutableArray *tempImages = [NSMutableArray array];
    for (id temp in self.images) {
        if ([temp isKindOfClass:[UIImage class]]) {
            [tempImages addObject:temp];
        }
    }
    return tempImages;
}

#pragma mark -- 重写属性set方法，防止单独改变属性无响应效果
/**
 设置表单条目附带单位
 */
- (void)setItemUnitType:(JhFormItemUnitType)itemUnitType {
    NSString *tempUnit = self.unit ?: @"";
    switch (itemUnitType) {
        case JhFormItemUnitTypeNone:
        {
            tempUnit = @"";
        }
            break;
        case JhFormItemUnitTypeYuan:
        {
            tempUnit = SWUnitYuan;
        }
            break;
        case JhFormItemUnitTypeYear:
        {
            tempUnit = SWUnitYear;
        }
            break;
        case JhFormItemUnitTypeMillion:
        {
            tempUnit = SWUnitMillion;
        }
        default:
            break;
    }
    _unit = tempUnit;
}

/**
 根据单位设置单元格单位类别，防止单位与单元格式不一致
 */
- (void)setUnit:(NSString *)unit {
    _unit = unit;
    if ([unit isEqualToString:@""]) {
        _itemUnitType = JhFormItemUnitTypeNone;
    }
    else if (unit == SWUnitYuan) {
        _itemUnitType = JhFormItemUnitTypeYuan;
    }
    else if (unit == SWUnitYear) {
        _itemUnitType = JhFormItemUnitTypeYear;
    }
    else if (unit == SWUnitMillion) {
        _itemUnitType = JhFormItemUnitTypeMillion;
    }
    else {
        _itemUnitType = JhFormItemUnitTypeCustom;
    }
}

- (void)setImages:(NSArray *)images {
    _images = images;
    [self selectImages];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self jh_setAttributedTitleWithRequired:self.required title:title itemType:self.itemType];
}

- (void)setRequired:(BOOL)required {
    _required = required;
    [self jh_setAttributedTitleWithRequired:required title:self.title itemType:self.itemType];
}

- (void)setItemType:(JhFormItemType)itemType {
    _itemType = itemType;
    [self jh_setDefaultHeight:itemType];
    [self jh_setAttributedTitleWithRequired:self.required title:self.title itemType:itemType];
    [self jh_setPlaceholderWithShow:self.showPlaceholder itemType:itemType];
}

- (void)setShowPlaceholder:(BOOL)showPlaceholder {
    _showPlaceholder = showPlaceholder;
    [self jh_setPlaceholderWithShow:showPlaceholder itemType:self.itemType];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder ?: @"" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Jh_InfoFont],NSForegroundColorAttributeName:Jh_PLACEHOLDERCOLOR}];
    _attributedPlaceholder = attributedPlaceholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    _attributedPlaceholder = attributedPlaceholder ?: [[NSAttributedString alloc]initWithString:@""];
}

@end
