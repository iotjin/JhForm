//
//  FormDemo5VC.m
//  JhForm
//
//  Created by Jh on 2019/9/10.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo5VC.h"

@interface FormDemo5VC ()

@end

@implementation FormDemo5VC

-(void)dealloc{
    NSLog(@" FormDemo5VC - dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Jh_navTitle = @"Demo5 - 选择图片与视频";
    [self initModel];
}

#pragma mark - initModel
-(void)initModel {
    
    JhWeakSelf
    NSMutableArray *cellArr0 = [NSMutableArray array];
    
    //默认选择图片与相机拍照
    JhFormCellModel *picture = JhFormCellModel_AddImageCell(@"选择图片:", NO);
    picture.Jh_tipInfo =@"这是一条默认颜色的提示信息(不设置不显示)";
    picture.Jh_leftImgName = @"ic_album";
    picture.Jh_leftImgRightMargin = 5;
    
    //选择视频
    JhFormCellModel *video = JhFormCellModel_AddImageCell(@"选择视频:", YES);
    video.Jh_maxImageCount = 2;
    video.Jh_tipInfo =@"这是一条可设置颜色的提示信息";
    video.Jh_tipInfoColor = [UIColor redColor];
    video.Jh_selectImageType = JhSelectImageTypeVideo;
    video.Jh_videoMinimumDuration = 1;
    video.Jh_rightBtnImgName = @"ic_album";
    video.Jh_rightBtnWidth = 30;
    video.Jh_rightBtnHeight = 30;
    video.Jh_rightBtnClickBlock = ^(UIButton * _Nonnull button) {
        [weakSelf.view hx_showImageHUDText:@"点击图片"];
    };
    
    //默认加载网络图片
    JhFormCellModel *urlPicture = JhFormCellModel_AddImageCell(@"加载网络图片:", NO);
    //    urlPicture.Jh_noShowAddImgBtn=YES;
    //    urlPicture.Jh_hideDeleteButton = YES;
    urlPicture.Jh_imageArr =@[@"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_00.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_05.png",
                              @"https://gitee.com/iotjh/Picture/raw/master/FormDemo/form_demo_06.png"];
    
    //网络视频下载需要导入 AFNetworking
    JhFormCellModel *urlVideo = JhFormCellModel_AddImageCell(@"加载混合资源:", NO);
    urlVideo.Jh_maxImageCount = 15;
    //    urlVideo.Jh_noShowAddImgBtn=YES;
    //    urlVideo.Jh_hideDeleteButton = YES;
    
    HXCustomAssetModel *assetModel1 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539156872167&di=93cd047350dfc7a60fa9e89e30079b25&imgtype=0&src=http%3A%2F%2Fpic.9ht.com%2Fup%2F2018-5%2F15252310743961744.gif"] networkThumbURL:[NSURL URLWithString:@"https://goss.veer.com/creative/vcg/veer/1600water/veer-129342703.jpg"] selected:YES];
    
    HXCustomAssetModel *assetModel2 = [HXCustomAssetModel livePhotoAssetWithNetworkImageURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/5ed15ef7-3411-4f5e-839b-10664d796919.jpg"] networkVideoURL:[NSURL URLWithString:@"http://tsnrhapp.oss-cn-hangzhou.aliyuncs.com/chartle/fufeiduanpian.mp4"] selected:YES];
    
    HXCustomAssetModel *assetModel3 = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3935625616,3616422245&fm=27&gp=0.jpg"] selected:YES];
    
    HXCustomAssetModel *assetModel4 = [HXCustomAssetModel assetWithNetworkVideoURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/fff42798-8025-4170-a36d-3257be267f29.mp4"] videoCoverURL:[NSURL URLWithString:@"http://oss-cn-hangzhou.aliyuncs.com/tsnrhapp/d3c3bbe6-02ce-4f17-a75b-3387d52b0a4a.jpg"] videoDuration:13 selected:YES];
    
    urlVideo.Jh_mixImageArr =@[assetModel1,assetModel2,assetModel3,assetModel4];
    urlVideo.Jh_selectImageType = JhSelectImageTypeAll;
    
    //隐藏标题
    JhFormCellModel *picture_noTitle = JhFormCellModel_AddImageCell(@"", NO);
    picture_noTitle.Jh_maxImageCount = 2;
    
    [cellArr0 addObjectsFromArray: @[picture,video,urlPicture,urlVideo,picture_noTitle]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellArr0);
    
    [self Jh_addSectionModel:section0];
    
    //如需要单页面统一配置，放在添加数据源后面
    self.Jh_leftTitleWidth = 120;   //统一设置左侧title的宽度
    
    self.Jh_submitStr = @"提 交";
    self.Jh_formSubmitBlock = ^{
        NSLog(@" 点击提交按钮 ");
        
        NSLog(@" 选择图片类 - picture : %@ ",picture.Jh_selectImageArr);
        NSLog(@" 选择图片类 - video : %@ ",video.Jh_selectVideoArr);
        NSLog(@" 选择图片类 - urlPicture : %@ ",urlPicture.Jh_selectImageArr);
        NSLog(@" 选择图片类 - urlVideo : 视频:\n%@\n 图片:\n%@",urlVideo.Jh_selectVideoArr,urlVideo.Jh_selectImageArr);
        NSLog(@" 选择图片类 - urlVideo - allList  : %@",urlVideo.Jh_imageAllList);
        
        // 这里只是简单描述校验逻辑，可根据自身需求封装数据校验逻辑
        [JhFormHandler Jh_checkEmptyWithFormData:weakSelf.Jh_formModelArr success:^{
            [weakSelf SubmitRequest];
        } failure:^(NSString *error) {
            NSLog(@"error====%@",error);
            //使用自己熟悉的弹框组件
            [weakSelf.view hx_showImageHUDText:error];
        }];
    };
}

#pragma mark - 提交请求
-(void)SubmitRequest{
    
}

@end
