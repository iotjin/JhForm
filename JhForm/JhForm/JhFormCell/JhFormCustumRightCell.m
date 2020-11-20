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

-(UIView *)CustumRightView{
    if (!_CustumRightView) {
        _CustumRightView = [[UIView alloc]init];
        _CustumRightView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_CustumRightView];
    }
    return _CustumRightView;
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
    if (data.Jh_titleMultiLineShow) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
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
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        self.CustumRightView.frame =CGRectMake(Jh_Margin_left+3, 0, Jh_SCRREN_WIDTH-Jh_Margin_left-Jh_EdgeMargin-3, self.bounds.size.height);
    }else{
        /********************************* 左侧标题换行 ********************************/
        CGFloat titleHeight = _data.Jh_titleHeight;
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, titleHeight);
        
        if (_data.Jh_titleMultiLineShow==YES) {
            if (titleHeight >(_data.Jh_defaultHeight-Jh_EdgeMargin*2)){
                _data.Jh_defaultHeight = titleHeight+Jh_EdgeMargin*2;
                [self.baseTableView reloadData];
            }
        }
        /********************************* 左侧标题换行 ********************************/
        
        self.CustumRightView.frame =CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 2*Jh_EdgeMargin) - Jh_CustumRightView_rightEdgeMargin, self.bounds.size.height);
    }
}

@end

@implementation UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)CustumRightCellWithId:(NSString *)cellId {
    JhFormCustumRightCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumRightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
