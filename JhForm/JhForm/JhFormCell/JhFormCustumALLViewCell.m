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

-(UIView *)CustumALLView{
    if (!_CustumALLView) {
        _CustumALLView = [[UIView alloc]init];
        _CustumALLView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_CustumALLView];
    }
    return _CustumALLView;
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    self.userInteractionEnabled = !data.Jh_Cell_NoEdit;
    if (self.data.Jh_hiddenLine) {
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, MAXFLOAT);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.CustumALLView.frame =CGRectMake(Jh_Margin_left,0, Jh_SCRREN_WIDTH -Jh_Margin_left-Jh_EdgeMargin, self.data.Jh_defaultHeight);
}

@end

@implementation UITableView (JhFormCustumALLViewCell)

- (JhFormCustumALLViewCell *)CustumALLCellWithId:(NSString *)cellId {
    JhFormCustumALLViewCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormCustumALLViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
