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
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.rightTextView.text = [data.Jh_info addUnit:data.Jh_unit];
    self.rightTextView.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.rightTextView.editable = data.Jh_editable;
    //设置右侧显示一个箭头
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //设置右侧文本的对齐方式
    if (data.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.rightTextView.textAlignment = NSTextAlignmentRight;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_Margin_left, (self.data.Jh_defaultHeight - Jh_TitleHeight)/2, Jh_TitleWidth, Jh_TitleHeight);
    self.rightTextView.userInteractionEnabled = NO;
    
    CGFloat newHeight = [JhFormSelectCell heightWithCellModelData:self.data];
    self.rightTextView.frame = CGRectMake(Jh_TitleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (Jh_TitleWidth + 2*Jh_EdgeMargin + 30),  newHeight - 2*Jh_EdgeMargin);
}



+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data{
    
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - Jh_TitleWidth - 2*Jh_EdgeMargin - 30, MAXFLOAT)].height;
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
