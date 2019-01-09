//
//  JhFormSelectCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormSelectCell.h"

#import "JhFormItem.h"
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

- (void)setItem:(JhFormItem *)item {
    
    _item = item;
    self.titleLabel.attributedText = item.attributedTitle;
    self.rightTextView.text = [item.info addUnit:item.unit];
    self.rightTextView.attributedPlaceholder = item.attributedPlaceholder;
    self.rightTextView.editable = item.editable;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_EdgeMargin, (self.item.defaultHeight - Jh_TitleHeight)/2, Jh_TitleWidth, Jh_TitleHeight);
    self.rightTextView.userInteractionEnabled = NO;
    
    CGFloat newHeight = [JhFormSelectCell heightWithItem:self.item];
    self.rightTextView.frame = CGRectMake(Jh_TitleWidth + 2*Jh_EdgeMargin, Jh_EdgeMargin+2, Jh_SCRREN_WIDTH - (Jh_TitleWidth + 2*Jh_EdgeMargin + 30),  newHeight - 2*Jh_EdgeMargin);
}

+ (CGFloat)heightWithItem:(JhFormItem *)item {
    CGFloat infoHeight = [item.info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - Jh_TitleWidth - 2*Jh_EdgeMargin - 30, MAXFLOAT)].height;
    return MAX(item.defaultHeight, infoHeight + 2*Jh_EdgeMargin);
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
