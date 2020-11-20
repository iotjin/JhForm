//
//  JhFormCustumALLViewCell.m
//  JhForm
//
//  Created by Jh on 2019/7/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumALLViewCell.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"

@implementation JhFormCustumALLViewCell

- (UIView *)custumALLView {
    if (!_custumALLView) {
        _custumALLView = [[UIView alloc] init];
        _custumALLView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_custumALLView];
    }
    return _custumALLView;
}

- (void)setData:(JhFormCellModel *)data {
    _data = data;
    if (data.Jh_cellBgColor) {
        self.backgroundColor = data.Jh_cellBgColor;
    }
    if (self.data.Jh_hiddenLine) {
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, MAXFLOAT);
    }
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.custumALLView.frame = CGRectMake(Jh_Margin_Left, 0, Jh_SCRREN_WIDTH-Jh_Margin_Left-Jh_Margin_Right, self.data.Jh_defaultHeight);
}

@end

@implementation UITableView (JhFormCustumALLViewCell)

- (JhFormCustumALLViewCell *)CustumALLCellWithId:(NSString *)cellId {
    JhFormCustumALLViewCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumALLViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
