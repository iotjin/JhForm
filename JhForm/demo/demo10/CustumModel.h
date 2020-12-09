//
//  CustumModel.h
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import "JhFormCellModel.h"
#import "JhFormSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustumModel : JhFormCellModel

@property (nonatomic,   copy) NSString *icon;
@property (nonatomic,   copy) NSString *name;
@property (nonatomic,   copy) NSString *content;
@property (nonatomic, assign) BOOL  hiddenSwitchBtn;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic,   copy) void(^clickBtnBlock)(CustumModel* cellModel);

+(JhFormSectionModel *)createSection0Data;
+(JhFormSectionModel *)createSection1Data;


@end

NS_ASSUME_NONNULL_END
