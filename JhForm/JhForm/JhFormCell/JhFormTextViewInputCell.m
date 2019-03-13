//
//  JhFormTextViewInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/7.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormTextViewInputCell.h"

#import "JhFormCellModel.h"
#import "JhFormConst.h"
#import "SelwynExpandableTextView.h"
#import "NSString+JhForm.h"
#import "UITextView+TextLimit.h"



@interface JhFormTextViewInputCell()<UITextViewDelegate>

@property (nonatomic, strong) UIView *line1;

@end

@implementation JhFormTextViewInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIView *)line1{
    if (!_line1) {
        _line1=[[UIView alloc]init];
        _line1.backgroundColor=BaselineColor;
        [self.contentView addSubview:_line1];
    }
    return _line1;
}


-(void)setData:(JhFormCellModel *)data{
    _data= data;
    
    self.titleLabel.attributedText = data.Jh_attributedTitle;
    self.rightTextView.text = [data.Jh_info addUnit:data.Jh_unit];
    self.rightTextView.attributedPlaceholder = data.Jh_attributedPlaceholder;
    self.rightTextView.editable = data.Jh_editable;
    self.rightTextView.keyboardType = data.Jh_keyboardType;
    self.rightTextView.currentLength = data.Jh_info.length;
    self.rightTextView.showLength = data.Jh_showLength;
    self.rightTextView.maxLength = data.Jh_maxInputLength;
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(Jh_Margin_left, Jh_EdgeMargin, Jh_SCRREN_WIDTH - 2*Jh_EdgeMargin, Jh_TitleHeight);
    
    //重置 rightTextView 内边距
    self.rightTextView.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
    self.rightTextView.backgroundColor = Jh_textView_BackgroundColor;
    
    CGFloat newHeight = [JhFormTextViewInputCell heightWithCellModelData:self.data];
    
    CGFloat width = self.bounds.size.width - 2*Jh_EdgeMargin;
    
    self.rightTextView.frame = CGRectMake(Jh_EdgeMargin, CGRectGetMaxY(self.titleLabel.frame) + Jh_EdgeMargin, width, newHeight - 3*Jh_EdgeMargin - Jh_TitleHeight);
    
    /********************************* 底部加线 ********************************/
    self.line1.frame= CGRectMake(Jh_LineEdgeMargin,CGRectGetMinY(self.rightTextView.frame)-2, Jh_SCRREN_WIDTH - Jh_LineEdgeMargin, 1);
    
    /********************************* 底部加线 ********************************/
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.rightTextView.text = self.data.Jh_info;
    self.rightTextView.currentLength = self.rightTextView.text.length;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.data.Jh_maxInputLength > 0) {
        [self.rightTextView textLimitWithMaxLength:self.data.Jh_maxInputLength];
    }
    self.rightTextView.currentLength = self.rightTextView.text.length;
    if (self.textViewInputCompletion) {
        self.textViewInputCompletion(self.rightTextView.text);
    }
    [UIView performWithoutAnimation:^{
        [self.baseTableView beginUpdates];
        [self.baseTableView endUpdates];
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    self.rightTextView.currentLength = self.rightTextView.text.length;
    self.rightTextView.text = [self.data.Jh_info addUnit:self.data.Jh_unit];
}

+ (CGFloat)heightWithCellModelData:(JhFormCellModel *)data{
    CGFloat infoHeight = [data.Jh_info sizeWithFontSize:Jh_InfoFont maxSize:CGSizeMake(Jh_SCRREN_WIDTH - 4*Jh_EdgeMargin, MAXFLOAT)].height;
    return MAX(data.Jh_defaultHeight, infoHeight + Jh_TitleHeight + 5*Jh_EdgeMargin);
}


@end

@implementation UITableView (JhFormTextViewInputCell)

- (JhFormTextViewInputCell *)textViewInputCellWithId:(NSString *)cellId
{
    JhFormTextViewInputCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JhFormTextViewInputCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.baseTableView = self;
    }
    return cell;
}

@end
