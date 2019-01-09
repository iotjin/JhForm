//
//  JhFormCustumBottomCell.m
//  JhForm
//
//  Created by Jh on 2019/1/8.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormCustumBottomCell.h"

#import "JhFormItem.h"
#import "JhFormConst.h"


@interface JhFormCustumBottomCell()

@property (nonatomic, strong) UIView *line1;

@end

@implementation JhFormCustumBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(UIView *)CustumBottomView{
    if (!_CustumBottomView) {
        
        _CustumBottomView = [[UIView alloc]init];
        _CustumBottomView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_CustumBottomView];
        
    }
    return _CustumBottomView;
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
    
    self.CustumBottomView.frame = CGRectMake(0, CGRectGetMaxY(_line1.frame)+10, Jh_SCRREN_WIDTH, self.bounds.size.height - CGRectGetMaxY(_line1.frame)-20);
   
    
}


@end




@implementation UITableView (JhFormCustumBottomCell)

- (JhFormCustumBottomCell *)CustumBottomCellWithId:(NSString *)cellId
{
    JhFormCustumBottomCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
