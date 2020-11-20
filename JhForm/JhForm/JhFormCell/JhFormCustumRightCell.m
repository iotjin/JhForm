//
//  JhFormCustumRightCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumRightCell.h"
#import "NSString+JhForm.h"
#import "JhFormCellModel.h"
#import "JhFormConst.h"

@implementation JhFormCustumRightCell

-(UIView *)custumRightView{
    if (!_custumRightView) {
        _custumRightView = [[UIView alloc] init];
        _custumRightView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_custumRightView];
    }
    return _custumRightView;
}

-(void)setData:(JhFormCellModel *)data{
    _data = data;
    
    if (data.Jh_titleMultiLineShow) {
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
    }
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    if (data.Jh_custumRightCellShowArrow) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (data.Jh_cellBgColor) {
        self.backgroundColor = data.Jh_cellBgColor;
    }
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        self.titleLabel.frame = CGRectMake(Jh_Margin_Left-Jh_redStarLeftOffset, Jh_Margin_Right, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        self.custumRightView.frame = CGRectMake(Jh_Margin_Left+3, 0, Jh_SCRREN_WIDTH-Jh_Margin_Left-Jh_Margin_Right-3, self.bounds.size.height);
    } else {
        /********************************* 左侧标题换行 ********************************/
        CGFloat titleHeight = _data.Jh_titleHeight;
        CGFloat titleLabel_X = (_data.Jh_titleShowType == JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_Left-Jh_redStarLeftOffset):Jh_Margin_Left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_Margin_Right, self.data.Jh_titleWidth, titleHeight);
        
        if (_data.Jh_titleMultiLineShow) {
            if (titleHeight > (_data.Jh_defaultHeight-Jh_Margin_Right*2)) {
                _data.Jh_defaultHeight = titleHeight+Jh_Margin_Right*2;
                [self.baseTableView reloadData];
            }
        }
        
        /********************************* 左侧标题换行 ********************************/
        self.custumRightView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_Margin_Right, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 2*Jh_Margin_Right) - Jh_CustumRightView_rightEdgeMargin, self.bounds.size.height);
    }
}

@end

@implementation UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)CustumRightCellWithId:(NSString *)cellId {
    JhFormCustumRightCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
