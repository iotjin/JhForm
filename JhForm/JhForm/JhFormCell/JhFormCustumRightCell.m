//
//  JhFormCustumRightCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumRightCell.h"

#import "JhFormCellModel.h"
#import "JhFormConst.h"


@implementation JhFormCustumRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



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
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    
    if(data.Jh_custumRightCellShowArrow == YES){
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //标题垂直居中
    self.titleLabel.frame = CGRectMake(Jh_Margin_left, (self.data.Jh_defaultHeight - Jh_TitleHeight)/2, self.data.Jh_titleWidth, Jh_TitleHeight);
    self.CustumRightView.frame =CGRectMake(Jh_CustumRightView_leftEdgeMargin, 0, Jh_SCRREN_WIDTH - Jh_CustumRightView_leftEdgeMargin - Jh_CustumRightView_rightEdgeMargin, self.bounds.size.height);
}



@end

@implementation UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)CustumRightCellWithId:(NSString *)cellId
{
    JhFormCustumRightCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumRightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
