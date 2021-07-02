//
//  JhFormSelectImageCell.m
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSelectImageCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "JhTextView.h"

@interface JhFormSelectImageCell()

#if kHasHXPhotoPicker
<HXPhotoViewDelegate>

@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;
#endif

/** 选中的图片数组 */
@property (nonatomic, strong) NSArray *selectImgArr;
/** 图片背景View */
@property (nonatomic, strong) UIView *bottomImageBgView;

@property (nonatomic, assign) BOOL  isInit;

@end

@implementation JhFormSelectImageCell

- (void)Jh_initUI {
    self.isInit = YES;
}

- (UIView *)bottomImageBgView {
    if (!_bottomImageBgView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:view];
        _bottomImageBgView = view;
#if kHasHXPhotoPicker
        [_bottomImageBgView addSubview:self.onePhotoView];
#endif
    }
    return _bottomImageBgView;
}

#if kHasHXPhotoPicker
- (HXPhotoManager *)oneManager {
    if (!_oneManager) {
        NSInteger maxNum = Jh_GlobalMaxImages;
        _oneManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _oneManager.configuration.photoMaxNum = maxNum;
        _oneManager.configuration.videoMaxNum = 0;
        _oneManager.configuration.selectTogether = NO;
        _oneManager.configuration.maxNum = maxNum;
        _oneManager.configuration.cameraCellShowPreview = NO;
        _oneManager.configuration.openCamera =NO;
        //        _oneManager.configuration.photoCanEdit =NO;
        _oneManager.configuration.showBottomPhotoDetail = NO;
        _oneManager.configuration.saveSystemAblum = YES;
        _oneManager.configuration.photoStyle = Jh_ThemeType == JhThemeTypeAuto ? HXPhotoStyleDefault :(Jh_ThemeType == JhThemeTypeLight? HXPhotoStyleInvariant : HXPhotoStyleDark);
        [HXPhotoCommon photoCommon].requestNetworkAfter= YES;
    }
    return _oneManager;
}

- (HXPhotoView *)onePhotoView {
    if (!_onePhotoView) {
        _onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(Jh_ImageLeftMargin, Jh_OnePhotoViewTopMargin, Jh_OnePhotoViewWidth, Jh_ImageHeight) manager:self.oneManager];
        _onePhotoView.outerCamera = YES;
        _onePhotoView.lineCount = Jh_ImageOneLineCount;
        _onePhotoView.spacing = Jh_ImageMargin;
        _onePhotoView.delegate = self;
        _onePhotoView.addImageName = Jh_AddIcon;
    }
    return _onePhotoView;
}

- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    self.onePhotoView.frame = frame;
    [self layoutSubviews];
}

#pragma mark -  根据 photoView 来判断是哪一个选择器
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    self.cellModel.Jh_imageAllList = allList;
    if (self.cellModel.Jh_selectImageType == JhSelectImageTypeImage) {
        [self getOriginalImage:photos original:isOriginal];
    } else if (self.cellModel.Jh_selectImageType == JhSelectImageTypeVideo) {
        [self getVideo:videos];
    } else {
        [self getOriginalImage:photos original:isOriginal];
        [self getVideo:videos];
    }
    [self Jh_reloadData];
}

// 获取原图
-(void)getOriginalImage:(NSArray<HXPhotoModel *> *)photos original:(BOOL)isOriginal {
    // 获取原图
    JhWeakSelf
    [photos hx_requestImageWithOriginal:isOriginal completion:^(NSArray<UIImage *> * _Nullable imageArray, NSArray<HXPhotoModel *> * _Nullable errorArray) {
        weakSelf.selectImgArr = imageArray;
        weakSelf.cellModel.Jh_imageArr = self.selectImgArr;
        [weakSelf Jh_reloadData];
    }];
}

// 获取视频
-(void)getVideo:(NSArray<HXPhotoModel *> *)videos {
    JhWeakSelf
    NSMutableArray *mArr = [NSMutableArray array];
    //导出视频地址
    for (int i=0; i< videos.count; i++) {
        HXPhotoModel *model = videos[i];
        // presetName 导出视频的质量，自己根据需求设置
        [model exportVideoWithPresetName:AVAssetExportPresetMediumQuality startRequestICloud:nil iCloudProgressHandler:nil exportProgressHandler:^(float progress, HXPhotoModel * _Nullable model) {
        } success:^(NSURL * _Nullable videoURL, HXPhotoModel * _Nullable model) {
            // 导出完成, videoURL
            //NSLog(@" videoURL %@ ",videoURL);
            [mArr addObject:videoURL];
            weakSelf.cellModel.Jh_selectVideoArr = [mArr copy];
            [weakSelf Jh_reloadData];
        } failed:nil];
    }
}

#endif

#pragma mark -- 刷新当前图片数据
- (void)Jh_reloadData {
    if (self.cellModel.Jh_imageSelectBlock) {
        self.cellModel.Jh_imageSelectBlock(self.selectImgArr);
    }
    JhWeakSelf
    [UIView performWithoutAnimation:^{
        [weakSelf.baseTableView beginUpdates];
        [weakSelf.baseTableView endUpdates];
    }];
}

#pragma mark -- 清空所有图片、视频数据
- (void)Jh_clearImage {
    [self.oneManager clearSelectedList];
    self.cellModel.Jh_imageArr = @[];
    self.cellModel.Jh_selectImageArr = @[];
    self.cellModel.Jh_selectVideoArr = @[];
    self.cellModel.Jh_imageAllList = @[];
    self.cellModel.Jh_mixImageArr = @[];
    [self.onePhotoView refreshView];
    [self Jh_reloadData];
}

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    [super Jh_configCellModel:cellModel];
    
#if kHasHXPhotoPicker
    self.oneManager.configuration.photoStyle = cellModel.Jh_cellThemeType == JhThemeTypeAuto ? HXPhotoStyleDefault :(cellModel.Jh_cellThemeType == JhThemeTypeLight? HXPhotoStyleInvariant : HXPhotoStyleDark);
    if (cellModel.Jh_maxImageCount) {
        self.oneManager.configuration.maxNum = cellModel.Jh_maxImageCount;
        self.oneManager.configuration.photoMaxNum = cellModel.Jh_maxImageCount;
    }
    self.oneManager.configuration.selectTogether = (cellModel.Jh_selectImageType == JhSelectImageTypeAll);
    if (cellModel.Jh_selectImageType) {
        self.oneManager.type = cellModel.Jh_selectImageType;
    }
    if (cellModel.Jh_imageNoSaveAblum){
        self.oneManager.configuration.saveSystemAblum = !cellModel.Jh_imageNoSaveAblum;
    }
    if (cellModel.Jh_videoMinimumDuration) {
        self.oneManager.configuration.videoMinimumDuration = cellModel.Jh_videoMinimumDuration;
    }
    if (cellModel.Jh_noShowAddImgBtn) {
        self.onePhotoView.showAddCell = NO;
        self.onePhotoView.editEnabled = NO;
    }
    if (cellModel.Jh_selectImageType == JhSelectImageTypeImage && self.isInit) {
        if (cellModel.Jh_imageArr.count) {
            [self.oneManager clearSelectedList];
            NSMutableArray *mUrlArr = @[].mutableCopy;
            for (id img in cellModel.Jh_imageArr) {
                HXPhotoModel *model ;
                if([img isKindOfClass:[UIImage class]]){
                    model = [HXPhotoModel photoModelWithImage:img];
                }
                if([img isKindOfClass:[NSString class]]){
                    model = [HXPhotoModel photoModelWithImageURL:[NSURL URLWithString:img]];
                }
                if([img isKindOfClass:[NSURL class]]){
                    model = [HXPhotoModel photoModelWithImageURL:img];
                }
                if ([img isKindOfClass:[HXPhotoModel class]]) {
                    model =img;
                }
                if(model){
                    [mUrlArr addObject:model];
                }
            }
            [self.oneManager addLocalModels:mUrlArr];
            [self.onePhotoView refreshView];
            self.isInit = NO;
        }
    }
    if (cellModel.Jh_selectImageType != JhSelectImageTypeImage && self.isInit) {
        if(cellModel.Jh_mixImageArr.count){
            [self.oneManager clearSelectedList];
            [self.oneManager addCustomAssetModel:cellModel.Jh_mixImageArr];
            [self.onePhotoView refreshView];
            self.isInit = NO;
        }
    }
    if (cellModel.Jh_isClearImage) {
        [self Jh_clearImage];
    }
    self.onePhotoView.hideDeleteButton = cellModel.Jh_hideDeleteButton;
    //弹出的相册界面的设置
    UIColor *themeColor = JhBaseThemeColor;
    UIColor *navColor = [UIColor whiteColor];
    UIColor *navTitleColor = [UIColor blackColor];
    self.oneManager.configuration.navBarBackgroudColor = navColor;
    self.oneManager.configuration.navigationTitleColor= navTitleColor;
    self.oneManager.configuration.bottomViewBgColor = navColor;
    self.oneManager.configuration.themeColor = themeColor;
    self.oneManager.configuration.previewSelectedBtnBgColor = themeColor;
    self.oneManager.configuration.cameraFocusBoxColor = themeColor;
    self.oneManager.configuration.albumListViewCellSelectBgColor = JhBaseCellBgColor;
    //    self.oneManager.configuration.bottomDoneBtnTitleColor = [UIColor purpleColor];
    //    self.oneManager.configuration.cellSelectedBgColor = [UIColor redColor];
    JhWeakSelf
    self.oneManager.viewWillAppear = ^(UIViewController *viewController) {
        [weakSelf updateStatusBar:cellModel];
    };
    self.oneManager.viewWillDisappear = ^(UIViewController *viewController) {
        [weakSelf updateStatusBar:cellModel];
    };
    //    self.onePhotoView.didCancelBlock = ^{
    //    };
    //    self.onePhotoView.didAddCellBlock = ^(HXPhotoView * _Nonnull myPhotoView) {
    //    };
    
#endif
    
}

#if kHasHXPhotoPicker
- (void)updateStatusBar:(JhFormCellModel *)cellModel {
    if (Jh_IOS13_Later) {
        if (cellModel.Jh_cellThemeType == JhThemeTypeAuto) {
            self.oneManager.configuration.statusBarStyle = UIStatusBarStyleDefault;
        }
        if (cellModel.Jh_cellThemeType == JhThemeTypeLight) {
            self.oneManager.configuration.statusBarStyle = UIStatusBarStyleDarkContent;
        }
        if (cellModel.Jh_cellThemeType == JhThemeTypeDark) {
            self.oneManager.configuration.statusBarStyle = UIStatusBarStyleLightContent;
        }
    }
}
#endif

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.rightTextView.hidden = YES;
    if (!self.cellModel.Jh_title.length) {
        self.line.hidden = YES;
#if kHasHXPhotoPicker
        self.bottomImageBgView.frame = CGRectMake(0, 0, Jh_ScreenWidth, CGRectGetHeight(self.onePhotoView.frame)+Jh_OnePhotoViewTopMargin*2);
#endif
    } else {
#if kHasHXPhotoPicker
        self.line.hidden = NO;
        self.line.frame = CGRectMake(Jh_LineLeftMargin, CGRectGetMaxY(self.titleLabel.frame)+Jh_Margin+Jh_LineHeight, Jh_ScreenWidth - Jh_LineLeftMargin, Jh_LineHeight);
        self.bottomImageBgView.frame = CGRectMake(0, CGRectGetMaxY(self.line.frame), Jh_ScreenWidth, CGRectGetHeight(self.onePhotoView.frame)+Jh_OnePhotoViewTopMargin*2);
#endif
    }
    //右侧按钮
    if (self.cellModel.Jh_rightBtnWidth>0) {
        CGFloat topHeight = self.cellModel.Jh_titleHeight + Jh_Margin*2;
        CGFloat rightBtnWidth = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnWidth, 0);
        CGFloat rightBtnHeight = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnHeight, topHeight);
        CGFloat rightBtnX = Jh_ScreenWidth-Jh_RightViewLeftMargin-rightBtnWidth-Jh_RightMargin;
        CGFloat rightBtnY = self.cellModel.Jh_rightBtnHeight ? (topHeight - self.cellModel.Jh_rightBtnHeight)/2 : 0;
        self.rightBtn.Jh_x = rightBtnX;
        self.rightBtn.Jh_y = rightBtnY;
        self.rightBtn.Jh_height = rightBtnHeight;
    }
    //提示文字
    if (self.cellModel.Jh_tipInfo.length) {
        self.tipLabel.frame = CGRectMake(Jh_LeftMargin, self.cellModel.Jh_cellHeight - Jh_TipInfoTopMargin*2 - Jh_TipInfoHeight, Jh_ScreenWidth-Jh_LeftMargin*2, Jh_TipInfoHeight);
    }
    if (self.cellModel.Jh_hiddenCustomLine == YES) {
        self.line.hidden = YES;
    }
}

@end
