//
//  JhFormSectionModel.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSectionModel.h"

@interface JhFormSectionModel()

+ (instancetype)Jh_sectionModelArr:(NSArray *)modelArr;

@end

inline JhFormSectionModel *JhSectionModel_Add(NSArray * _Nonnull Jh_sectionModelArr) {
    
    return [JhFormSectionModel Jh_sectionModelArr:Jh_sectionModelArr];
}

@implementation JhFormSectionModel


+ (instancetype)Jh_sectionModelArr:(NSArray *)modelArr{
    
    return [[self alloc]initWithModelArr:modelArr];
}

- (instancetype)initWithModelArr:(NSArray *)modelArr {
    self = [super init];
    if (self) {
        self.Jh_sectionModelArr = modelArr;
    }
    return self;
}



@end
