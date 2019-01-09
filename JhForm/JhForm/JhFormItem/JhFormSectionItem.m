//
//  JhFormSectionItem.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSectionItem.h"

@interface JhFormSectionItem()

+ (instancetype)sw_sectionItem:(NSArray *)items;

@end

inline JhFormSectionItem *JhSectionItem_Add(NSArray * _Nonnull items) {
    return [JhFormSectionItem sw_sectionItem:items];
}

@implementation JhFormSectionItem

+ (instancetype)sw_sectionItem:(NSArray *)items {
    return [[self alloc]initWithItems:items];
}

- (instancetype)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

@end
