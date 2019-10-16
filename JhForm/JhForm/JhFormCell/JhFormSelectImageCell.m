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


@interface JhFormSelectImageCell()<HXPhotoViewDelegate>

@property (nonatomic, strong) UIView *line1;

@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;
@property (strong, nonatomic) HXDatePhotoToolManager *toolManager;
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
        _oneManager.configuration.selectTogether = NO;
        _oneManager.configuration.maxNum = maxNum;
        _oneManager.configuration.cameraCellShowPreview = NO;
        _oneManager.configuration.openCamera =NO;
        _oneManager.configuration.photoCanEdit =NO;
        _oneManager.configuration.showBottomPhotoDetail = NO;
    }
    return _oneManager;
}

- (HXDatePhotoToolManager *)toolManager {
    if (!_toolManager) {
        _toolManager = [[HXDatePhotoToolManager alloc] init];
    }
    return _toolManager;
}

-(HXPhotoView *)onePhotoView{
    if (!_onePhotoView) {
        
        _onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(15,5, Kwidth - 15*2-3*3, 180) WithManager:self.oneManager];
        _onePhotoView.outerCamera = YES;
        _onePhotoView.lineCount =4;
        _onePhotoView.spacing =3;
        _onePhotoView.delegate = self;
        _onePhotoView.addImageName = Jh_AddIcon;
    }
    return _onePhotoView;
}

#pragma mark -  根据photoView来判断是哪一个选择器
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    
    self.selectImgArr = allList;
    NSSLog(@" 选择图片cell - allList %@",allList);
   
    //获取原图
    [self.toolManager getSelectedImageList:self.selectImgArr requestType:HXDatePhotoToolManagerRequestTypeOriginal success:^(NSArray<UIImage *> *imageList) {
        self.selectImgArr = imageList;
        NSSLog(@" 选择图片cell - selectImgArr %@",self.selectImgArr);
        self.data.Jh_imageArr = self.selectImgArr;
        
        
    } failed:^{
        
    }];
    
    
   [self Jh_reloadData];
    
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
    
    if(data.Jh_imageArr.count){
        
        if(data.Jh_isUseUrlShowPicture ==YES){
            NSMutableArray *mUrlArr = @[].mutableCopy;
            for (NSString *url in data.Jh_imageArr) {
                HXCustomAssetModel *model =[HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:url] selected:YES];
                [mUrlArr addObject:model];
            }
            [self.oneManager addCustomAssetModel:mUrlArr];
        }
        if(data.Jh_isUseImgShowPicture ==YES){
            NSMutableArray *mUrlArr = @[].mutableCopy;
            for (UIImage *img in data.Jh_imageArr) {
                HXCustomAssetModel *model = [HXCustomAssetModel assetWithLocalImage:img selected:YES];
                [mUrlArr addObject:model];
            }
            [self.oneManager addCustomAssetModel:mUrlArr];
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
    if (data.Jh_Cell_NoEdit == YES) {
        self.userInteractionEnabled = NO;
    }else{
        self.userInteractionEnabled = YES;
    }

    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    //标题固定top
    CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
    self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
    
    /********************************* 底部加线 ********************************/
    
    self.line1.frame= CGRectMake(Jh_LineEdgeMargin,CGRectGetMaxY(self.titleLabel.frame)+10, Jh_SCRREN_WIDTH - Jh_LineEdgeMargin, 1);
    
    /********************************* 底部加线 ********************************/
    
    self.BottomImageBgView.frame = CGRectMake(0, CGRectGetMaxY(_line1.frame)+10, Jh_SCRREN_WIDTH, self.bounds.size.height - CGRectGetMaxY(_line1.frame)-20);

    if (_data.Jh_tipsInfo.length) {
        self.tipsLabel.frame = CGRectMake(Jh_Margin_left, self.bounds.size.height-25, Jh_SCRREN_WIDTH-Jh_Margin_left*2, 15);
    }
    
    
}




- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (@available(iOS 13.0, *)) {
        
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self configureIOS13Theme];
        }
    }

}



-(void)configureIOS13Theme{
    
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

- (JhFormSelectImageCell *)SelectImageCellWithId:(NSString *)cellId
{
    JhFormSelectImageCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSelectImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end


