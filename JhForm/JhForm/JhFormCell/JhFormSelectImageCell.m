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
#define itemH  (kWidth - 15*2-3*3)/itemLineCount  //图片的高度


@interface JhFormSelectImageCell()<HXPhotoViewDelegate>

@property (nonatomic, strong) UIView *line1;
@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;
/** 选中的图片数组 */
@property (nonatomic, strong) NSArray *selectImgArr;
/** 图片背景View */
@property (nonatomic, strong) UIView *BottomImageBgView;

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation JhFormSelectImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(UILabel *)tipsLabel{
    if (!_tipsLabel) {
        _tipsLabel =[[UILabel alloc]init];
        _tipsLabel.font = [UIFont systemFontOfSize:13];
        _tipsLabel.textColor = [UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1/1.0];
        _tipsLabel.numberOfLines = 0;
        [self.contentView addSubview:_tipsLabel];
    }
    return _tipsLabel;
}

-(UIView *)line1{
    if (!_line1) {
        _line1=[[UIView alloc]init];
        _line1.backgroundColor=BaselineColor;
        [self.contentView addSubview:_line1];
        [self configureIOS13Theme];
    }
    return _line1;
}

-(UIView *)BottomImageBgView{
    if (!_BottomImageBgView) {
        _BottomImageBgView = [[UIView alloc]init];
        _BottomImageBgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_BottomImageBgView];
        [_BottomImageBgView addSubview:self.onePhotoView];
    }
    return _BottomImageBgView;
}

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
        _oneManager.configuration.photoCanEdit =NO;
        _oneManager.configuration.showBottomPhotoDetail = NO;
        _oneManager.configuration.saveSystemAblum = YES;
        [HXPhotoCommon photoCommon].requestNetworkAfter= YES;
    }
    return _oneManager;
}

-(HXPhotoView *)onePhotoView{
    if (!_onePhotoView) {
        _onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(15, 5, kWidth - 15*2-3*3, itemH) manager:self.oneManager];
        _onePhotoView.outerCamera = YES;
        _onePhotoView.lineCount =itemLineCount;
        _onePhotoView.spacing =3;
        _onePhotoView.delegate = self;
        _onePhotoView.addImageName = Jh_AddIcon;
    }
    return _onePhotoView;
}

- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    self.onePhotoView.frame = frame;
    [self layoutSubviews];
}

#pragma mark -  根据photoView来判断是哪一个选择器
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {    
//    NSSLog(@" 选择图片cell - allList %@",allList);
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

//获取原图
-(void)getOriginalImage:(NSArray<HXPhotoModel *> *)photos original:(BOOL)isOriginal{
    //获取原图
    [photos hx_requestImageWithOriginal:isOriginal completion:^(NSArray<UIImage *> * _Nullable imageArray, NSArray<HXPhotoModel *> * _Nullable errorArray) {
        self.selectImgArr = imageArray;
//      NSSLog(@" 选择图片cell - selectImgArr %@",self.selectImgArr);
        self.data.Jh_imageArr = self.selectImgArr;
    }];
}

//获取视频
-(void)getVideo:(NSArray<HXPhotoModel *> *)videos{
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
    if(data.Jh_maxImageCount){
        self.oneManager.configuration.maxNum = data.Jh_maxImageCount;
        self.oneManager.configuration.photoMaxNum = data.Jh_maxImageCount;
    }
    
    if (data.Jh_selectImageType == JhSelectImageTypeAll) {
        self.oneManager.configuration.selectTogether = YES;
    }else{
        self.oneManager.configuration.selectTogether = NO;
    }
    
    if (data.Jh_selectImageType) {
        self.oneManager.type = data.Jh_selectImageType;
    }
    
    if (data.Jh_imageNoSaveAblum){
        self.oneManager.configuration.saveSystemAblum = !data.Jh_imageNoSaveAblum;
    }
    if (data.Jh_videoMinimumDuration) {
        self.oneManager.configuration.videoMinimumDuration = data.Jh_videoMinimumDuration;
    }
    
    if (data.Jh_noShowAddImgBtn==YES) {
        self.onePhotoView.showAddCell = NO;
        self.onePhotoView.editEnabled = NO;
    }
    
    if (data.Jh_selectImageType == JhSelectImageTypeImage) {
        if(data.Jh_imageArr.count){
            [self.oneManager clearSelectedList];
            NSMutableArray *mUrlArr = @[].mutableCopy;
            for (id img in data.Jh_imageArr) {
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
        }
    }
    if (data.Jh_selectImageType != JhSelectImageTypeImage) {
        if(data.Jh_initImageArr.count){
            [self.oneManager clearSelectedList];
            [self.oneManager addCustomAssetModel:data.Jh_initImageArr];
            [self.onePhotoView refreshView];
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
    self.onePhotoView.hideDeleteButton = data.Jh_hideDeleteButton;
    
    if (data.Jh_Cell_NoEdit == YES) {
        self.userInteractionEnabled = NO;
    }else{
        self.userInteractionEnabled = YES;
    }
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_data.Jh_title.length) {
        //标题固定top
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
        self.line1.frame= CGRectMake(Jh_LineEdgeMargin,CGRectGetMaxY(self.titleLabel.frame)+Jh_EdgeMargin, Jh_SCRREN_WIDTH - Jh_LineEdgeMargin, 1);
        self.BottomImageBgView.frame = CGRectMake(0, CGRectGetMaxY(_line1.frame)+10, Jh_SCRREN_WIDTH, CGRectGetHeight(self.onePhotoView.frame)+10);
    }else{
        self.BottomImageBgView.frame = CGRectMake(0,10, Jh_SCRREN_WIDTH, CGRectGetHeight(self.onePhotoView.frame)+10);
    }
    
    if (_data.Jh_tipsInfo.length) {
        self.tipsLabel.frame = CGRectMake(Jh_Margin_left, CGRectGetMaxY(self.BottomImageBgView.frame)+5, Jh_SCRREN_WIDTH-Jh_Margin_left*2, 15);
    }
    
}

//高度自适应
+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data {
    NSInteger row = 1;
    if (data.Jh_noShowAddImgBtn == YES) {
        row = data.Jh_imageAllList.count <= itemLineCount ? 1 : 2;
    }else{
        row = data.Jh_maxImageCount>itemLineCount && data.Jh_imageAllList.count >= itemLineCount ?2:1;
    }
    row = row > 2?2: row ; //此处限制最多2行
    CGFloat titleHeight = data.Jh_title.length ? Jh_TitleHeight+1 +Jh_EdgeMargin*2 : 0 ;
    CGFloat tipHeight = data.Jh_tipsInfo.length ? 25 : 0 ;
    CGFloat height = titleHeight+10+itemH*row +10+tipHeight+5;
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
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            self.line1.backgroundColor = [UIColor separatorColor];
        }else {
            self.line1.backgroundColor = BaselineColor;
        }
    }
}


@end


@implementation UITableView (JhFormCustumBottomCell)

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId {
    JhFormSelectImageCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSelectImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end


