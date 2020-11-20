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

#define itemLineCount  4 //图片一行几个
#define itemH  (Jh_SCRREN_WIDTH - 15*2-3*3)/itemLineCount  //图片的高度

@interface JhFormSelectImageCell() <HXPhotoViewDelegate>

@property (nonatomic, strong) UIView *lineView;
@property (strong, nonatomic) HXPhotoView *photoView;
@property (strong, nonatomic) HXPhotoManager *photoManager;
@property (nonatomic, strong) NSArray *selectImgArr; // 选中的图片数组
@property (nonatomic, strong) UIView *bottomImageBgView; // 图片背景View
@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation JhFormSelectImageCell

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel =[[UILabel alloc] init];
        _tipsLabel.font = [UIFont systemFontOfSize:13];
        _tipsLabel.textColor = [UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1/1.0];
        _tipsLabel.numberOfLines = 0;
        [self.contentView addSubview:_tipsLabel];
    }
    return _tipsLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        
        if (@available(iOS 13.0, *)) {
            BOOL isDarkMode = (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
            _lineView.backgroundColor = (isDarkMode ? UIColor.separatorColor : BaselineColor);
        } else {
            _lineView.backgroundColor = BaselineColor;
        }
        
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}

- (UIView *)bottomImageBgView {
    if (!_bottomImageBgView) {
        _bottomImageBgView = [[UIView alloc] init];
        _bottomImageBgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_bottomImageBgView];
        [_bottomImageBgView addSubview:self.photoView];
    }
    return _bottomImageBgView;
}

- (HXPhotoManager *)photoManager {
    if (!_photoManager) {
        NSInteger maxNum = Jh_GlobalMaxImages;
        _photoManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _photoManager.configuration.photoMaxNum = maxNum;
        _photoManager.configuration.videoMaxNum = 0;
        _photoManager.configuration.selectTogether = NO;
        _photoManager.configuration.maxNum = maxNum;
        _photoManager.configuration.cameraCellShowPreview = NO;
        _photoManager.configuration.openCamera =NO;
        _photoManager.configuration.photoCanEdit =NO;
        _photoManager.configuration.showBottomPhotoDetail = NO;
        _photoManager.configuration.saveSystemAblum = YES;
        [HXPhotoCommon photoCommon].requestNetworkAfter= YES;
    }
    return _photoManager;
}

- (HXPhotoView *)photoView {
    if (!_photoView) {
        _photoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(15, 5, Jh_SCRREN_WIDTH - 15*2-3*3, ceil(itemH)) manager:self.photoManager];
        _photoView.outerCamera = YES; /// 是否把相机功能放在外面 默认NO
        _photoView.lineCount = itemLineCount;
        _photoView.delegate = self;
        _photoView.addImageName = Jh_AddIcon; /// 添加按钮的图片
    }
    return _photoView;
}

- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    self.photoView.frame = frame;
    [self layoutSubviews];
}

#pragma mark -  根据 photoView 来判断是哪一个选择器
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    self.data.Jh_imageAllList = allList;
    if (self.data.Jh_selectImageType == JhSelectImageTypeImage) {
        [self getOriginalImage:photos original:isOriginal];
    }else if (self.data.Jh_selectImageType == JhSelectImageTypeVideo) {
        [self getVideo:videos];
    }else {
        [self getOriginalImage:photos original:isOriginal];
        [self getVideo:videos];
    }
    [self Jh_reloadData];
}

// 获取原图
-(void)getOriginalImage:(NSArray<HXPhotoModel *> *)photos original:(BOOL)isOriginal{
    // 获取原图
    [photos hx_requestImageWithOriginal:isOriginal completion:^(NSArray<UIImage *> * _Nullable imageArray, NSArray<HXPhotoModel *> * _Nullable errorArray) {
        self.selectImgArr = imageArray;
        self.data.Jh_imageArr = self.selectImgArr;
    }];
}

// 获取视频
-(void)getVideo:(NSArray<HXPhotoModel *> *)videos{
    NSMutableArray *mArr = [NSMutableArray array];
    //导出视频地址
    for (int i=0; i< videos.count; i++) {
        HXPhotoModel *model = videos[i];
        // presetName 导出视频的质量，自己根据需求设置
        [model exportVideoWithPresetName:AVAssetExportPresetMediumQuality startRequestICloud:nil iCloudProgressHandler:nil exportProgressHandler:^(float progress, HXPhotoModel * _Nullable model) {
        } success:^(NSURL * _Nullable videoURL, HXPhotoModel * _Nullable model) {
            // 导出完成, videoURL
            [mArr addObject:videoURL];
            self.data.Jh_selectVideoArr = [mArr copy];
        } failed:nil];
    }
}

#pragma mark -- 刷新当前图片数据
- (void)Jh_reloadData {
    if (self.JhImageSelectBlock) {
        self.JhImageSelectBlock(self.selectImgArr);
    }
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    if (data.Jh_maxImageCount) {
        self.photoManager.configuration.maxNum = data.Jh_maxImageCount;
        self.photoManager.configuration.photoMaxNum = data.Jh_maxImageCount;
    }
    
    self.photoManager.configuration.selectTogether = (data.Jh_selectImageType == JhSelectImageTypeAll);
    
    if (data.Jh_selectImageType) {
        self.photoManager.type = data.Jh_selectImageType;
    }
    
    if (data.Jh_imageNoSaveAblum){
        self.photoManager.configuration.saveSystemAblum = !data.Jh_imageNoSaveAblum;
    }
    if (data.Jh_videoMinimumDuration) {
        self.photoManager.configuration.videoMinimumDuration = data.Jh_videoMinimumDuration;
    }
    
    // 是否隐藏添加图片按钮，默认显示
    if (data.Jh_noShowAddImgBtn) {
        self.photoView.showAddCell = NO;
        self.photoView.editEnabled = NO;
    }
    
    if (data.Jh_selectImageType == JhSelectImageTypeImage) {
        if(data.Jh_imageArr.count){
            [self.photoManager clearSelectedList];
            NSMutableArray *mUrlArr = [NSMutableArray array];
            for (id img in data.Jh_imageArr) {
                HXPhotoModel *model;
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
                    model = img;
                }
                if(model){
                    [mUrlArr addObject:model];
                }
            }
            [self.photoManager addLocalModels:mUrlArr];
            [self.photoView refreshView];
        }
    }
    if (data.Jh_selectImageType != JhSelectImageTypeImage) {
        if(data.Jh_initImageArr.count){
            [self.photoManager clearSelectedList];
            [self.photoManager addCustomAssetModel:data.Jh_initImageArr];
            [self.photoView refreshView];
        }
    }
    
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    if (data.Jh_tipsInfo.length) {
        self.tipsLabel.text = data.Jh_tipsInfo;
        if (data.Jh_tipsInfoColor) {
            self.tipsLabel.textColor = data.Jh_tipsInfoColor;
        }
    }
    self.photoView.hideDeleteButton = data.Jh_hideDeleteButton;
    
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_data.Jh_title.length) {
        //标题固定top
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_Left-Jh_redStarLeftOffset):Jh_Margin_Left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_Margin_Right, Jh_SCRREN_WIDTH - 2*Jh_Margin_Right, Jh_TitleHeight);
        self.lineView.frame= CGRectMake(Jh_LineEdgeMargin,CGRectGetMaxY(self.titleLabel.frame)+Jh_Margin_Right, Jh_SCRREN_WIDTH - Jh_LineEdgeMargin, 1);
        self.bottomImageBgView.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame)+10, Jh_SCRREN_WIDTH, CGRectGetHeight(self.photoView.frame)+10);
    } else {
        self.bottomImageBgView.frame = CGRectMake(0,10, Jh_SCRREN_WIDTH, CGRectGetHeight(self.photoView.frame)+10);
    }
    
    if (_data.Jh_tipsInfo.length) {
        self.tipsLabel.frame = CGRectMake(Jh_Margin_Left, CGRectGetMaxY(self.bottomImageBgView.frame)+5, Jh_SCRREN_WIDTH-Jh_Margin_Left*2, 15);
    }
}

// 高度自适应
+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data {
    NSInteger row = 1;
    if (data.Jh_noShowAddImgBtn) {
        row = ((data.Jh_imageAllList.count <= itemLineCount) ? 1 : 2);
    }else{
        row = ((data.Jh_maxImageCount>itemLineCount && data.Jh_imageAllList.count >= itemLineCount) ? 2 : 1);
    }
    row = ( row > 2 ? 2 : row); // !!!: 此处限制最多显示 2 行图片
    CGFloat titleHeight = data.Jh_title.length ? Jh_TitleHeight+1 +Jh_Margin_Right*2 : 0 ;
    CGFloat tipHeight = data.Jh_tipsInfo.length ? 25 : 0 ;
    CGFloat height = (titleHeight + 10 + itemH*row + 10 + tipHeight + 5);
    return height;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self configureIOS13Theme];
        }
    }
}

-(void)configureIOS13Theme {
    if (@available(iOS 13.0, *)) {
        BOOL isDarkMode = (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
        self.lineView.backgroundColor = (isDarkMode ? UIColor.separatorColor : BaselineColor);
    }
}

@end

@implementation UITableView (JhFormCustumBottomCell)

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId {
    JhFormSelectImageCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSelectImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
