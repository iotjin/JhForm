//
//  JhFormSelectCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSelectCell.h"

#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"
#import "NSString+JhForm.h"


@implementation JhFormSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
    if (data.Jh_titleMultiLineShow==YES) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
    }
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.rightTextView.text = [data.Jh_info addUnit:data.Jh_unit];
    self.rightTextView.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.rightTextView.editable = data.Jh_editable;
    self.rightTextView.userInteractionEnabled = NO;
    //设置右侧显示一个箭头
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //设置右侧文本的对齐方式
    if (data.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.rightTextView.textAlignment = NSTextAlignmentRight;
    }
    if(data.Jh_cellBgColor){
        self.backgroundColor = data.Jh_cellBgColor;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_data.Jh_title.length) {
        
        self.titleLabel.frame = CGRectMake(Jh_Margin_left-Jh_redStarLeftOffset, Jh_EdgeMargin, Jh_redStarLeftOffset+5, Jh_TitleHeight);
        CGFloat newHeight = [JhFormSelectCell heightWithCellModelData:self.data];
        self.rightTextView.frame = CGRectMake(Jh_Margin_left+3, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - 2*Jh_Margin_left-3, newHeight - 2*Jh_EdgeMargin);
        
    }else{
        
        /********************************* 左侧标题换行 ********************************/
        
        CGFloat titleHeight = _data.Jh_titleHeight;
        CGFloat titleLabel_X = (_data.Jh_titleShowType==JhTitleShowTypeRedStarFront && _data.Jh_required ==YES) ?(Jh_Margin_left-Jh_redStarLeftOffset):Jh_Margin_left;
        
        if (_data.Jh_titleMultiLineShow==YES) {
            if (titleHeight >(_data.Jh_defaultHeight-Jh_EdgeMargin*2)){
                _data.Jh_defaultHeight = titleHeight+Jh_EdgeMargin*2;
                [self.baseTableView reloadData];
            }
        }
        self.titleLabel.frame = CGRectMake(titleLabel_X, Jh_EdgeMargin, self.data.Jh_titleWidth, titleHeight);
        
        CGFloat newHeight = [JhFormSelectCell heightWithCellModelData:self.data];
        self.rightTextView.frame = CGRectMake(self.data.Jh_titleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (self.data.Jh_titleWidth + 2*Jh_EdgeMargin + 30),  newHeight - 2*Jh_EdgeMargin);
        
 
    }
        
    
    
}



+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data{
    
    CGFloat width = data.Jh_title.length ? (data.Jh_titleWidth + 2*Jh_EdgeMargin + 30+3) : (2*Jh_Margin_left+3);
    
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - width, MAXFLOAT)].height;
    
    return MAX(data.Jh_defaultHeight, infoHeight + 2*Jh_EdgeMargin);

}


@end

@implementation UITableView (JhFormSelectCell)

- (JhFormSelectCell *)selectCellWithId:(NSString *)cellId
{
    JhFormSelectCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
