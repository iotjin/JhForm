//
//  JhFormCustumRightCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumRightCell.h"

#import "JhFormItem.h"
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


- (void)setItem:(JhFormItem *)item {
    
    _item = item;
    self.titleLabel.attributedText = item.attributedTitle;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //标题居中
    self.titleLabel.frame = CGRectMake(Jh_EdgeMargin, (self.item.defaultHeight - Jh_TitleHeight)/2, Jh_TitleWidth, Jh_TitleHeight);
    
    self.CustumRightView.frame =CGRectMake(Jh_TitleWidth + 2*Jh_EdgeMargin, 0, Jh_SCRREN_WIDTH - (Jh_TitleWidth + 2*Jh_EdgeMargin) -5, self.bounds.size.height);
    
    
}




@end

@implementation UITableView (JhFormCustumRightCell)

- (JhFormCustumRightCell *)custumRightCellWithId:(NSString *)cellId
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
