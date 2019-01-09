//
//  JhFormSelectImageCell.m
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSelectImageCell.h"

#import "JhFormItem.h"
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
        
        NSInteger maxNum = 8;
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
        _item.images = self.selectImgArr;
        
        
    } failed:^{
        
    }];
    
    
   [self Jh_reloadData];
    
}

#pragma mark -- 刷新当前图片数据
- (void)Jh_reloadData {
    if (self.imageSelectCompletion) {
        self.imageSelectCompletion(self.selectImgArr);
    }
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}


- (void)setItem:(JhFormItem *)item {
    
    _item = item;
    self.titleLabel.attributedText = item.attributedTitle;
    
    item.defaultHeight = 200 +44;
    
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    //标题固定top
    self.titleLabel.frame = CGRectMake(Jh_EdgeMargin, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
    
    /********************************* 底部加线 ********************************/
    _line1=[[UIView alloc]init];
    _line1.backgroundColor=BaselineColor;
    [self addSubview:_line1];
    _line1.frame= CGRectMake(Jh_EdgeMargin+5,CGRectGetMaxY(self.titleLabel.frame)+10, Jh_SCRREN_WIDTH - Jh_EdgeMargin-5, 1);
    
    /********************************* 底部加线 ********************************/
    
    self.BottomImageBgView.frame = CGRectMake(0, CGRectGetMaxY(_line1.frame)+10, Jh_SCRREN_WIDTH, self.bounds.size.height - CGRectGetMaxY(_line1.frame)-20);
    
    
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


