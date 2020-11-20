//
//  JhFormCenterTextCell.m
//  JhReader
//
//  Created by Jh on 2019/3/13.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCenterTextCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"

@implementation JhFormCenterTextCell

- (void)setData:(JhFormCellModel *)data {
    _data= data;
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    if (data.Jh_cellBgColor) {
        self.backgroundColor = data.Jh_cellBgColor;
    }
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 标题居中
    self.titleLabel.frame = CGRectMake((Jh_SCRREN_WIDTH-self.data.Jh_titleWidth)/2, (self.data.Jh_defaultHeight - Jh_TitleHeight)/2, self.data.Jh_titleWidth, Jh_TitleHeight);
    
    if (@available(iOS 13.0, *)) {
        self.titleLabel.textColor = UIColor.labelColor;
    }
}

@end

@implementation UITableView (JhFormCenterTextCell)

- (JhFormCenterTextCell *)CenterTextWithId:(NSString *)cellId {
    JhFormCenterTextCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCenterTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
