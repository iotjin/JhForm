//
//  JhFormInputCell.m
//  JhForm
//
//  Created by Jh on 2019/1/4.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhFormInputCell.h"
#import "JhFormCellModel.h"
#import "JhTextView.h"
#import "JhFormConst.h"

@implementation JhFormInputCell

#pragma mark - JhFormProtocol

- (void)Jh_configCellModel:(JhFormCellModel *)cellModel {
    self.cellModel = cellModel;
    if (cellModel.Jh_titleMultiLineShow) {
        self.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.titleLabel.numberOfLines = 0;
    }
    self.titleLabel.text = cellModel.Jh_title;
    self.titleLabel.font = JhFontsize(Jh_SetValueAndDefault(cellModel.Jh_titleFont, Jh_TitleFont));
    self.titleLabel.textColor = Jh_SetValueAndDefault(cellModel.Jh_titleTextColor, Jh_TitleColor);
    self.userInteractionEnabled = !cellModel.Jh_cellNotEdit;
    self.accessoryType =cellModel.Jh_isShowArrow ==YES? UITableViewCellAccessoryDisclosureIndicator: UITableViewCellAccessoryNone;
    if (cellModel.Jh_cellBgColor) {
        self.backgroundColor = cellModel.Jh_cellBgColor;
    }
    //下划线
    if (cellModel.Jh_lineLeftMargin) {
        self.separatorInset=UIEdgeInsetsMake(0,cellModel.Jh_lineLeftMargin, 0, 0);
    }
    if (cellModel.Jh_hiddenLine == YES) {
        self.separatorInset=UIEdgeInsetsMake(0,0,0,MAXFLOAT);
    }
    self.rightTextView.text = cellModel.Jh_info;
    self.rightTextView.textColor = Jh_SetValueAndDefault(cellModel.Jh_infoTextColor, Jh_InfoTextColor);
    self.rightTextView.font = JhFontsize(Jh_SetValueAndDefault(cellModel.Jh_infoFont, Jh_InfoFont));
    self.rightTextView.editable = cellModel.Jh_editable;
    self.rightTextView.keyboardType = cellModel.Jh_keyboardType;
    self.rightTextView.Jh_placeholder = cellModel.Jh_placeholder;
    self.rightTextView.Jh_textContainerInset = cellModel.Jh_textContainerInset;
    self.rightTextView.Jh_placeholderFont = Jh_SetValueAndDefault(cellModel.Jh_placeholderFont, Jh_InfoFont);
    self.rightTextView.Jh_placeholderColor = Jh_SetValueAndDefault(cellModel.Jh_placeholderColor, Jh_PlaceholderColor);
    self.rightTextView.Jh_maxLength = Jh_SetValueAndDefault(cellModel.Jh_maxInputLength, Jh_MaxInputLength);
    self.rightTextView.Jh_showLengthNumber = cellModel.Jh_showLength;
    JhWeakSelf
    self.rightTextView.Jh_cellInputBlock = ^(NSString * _Nonnull inputText, NSInteger inputState) {
        cellModel.Jh_info = inputText;
        [UIView performWithoutAnimation:^{
            [weakSelf.baseTableView beginUpdates];
            [weakSelf.baseTableView endUpdates];
        }];
        if (cellModel.Jh_cellInputBlock) {
            cellModel.Jh_cellInputBlock(inputText, inputState);
        }
    };
    //左侧图片
    if (self.cellModel.Jh_leftImgName.length) {
        self.leftImgView.image = [UIImage imageNamed:self.cellModel.Jh_leftImgName];
    }
    //设置右侧文本的对齐方式
    if (cellModel.Jh_InfoTextAlignment == JhFormCellInfoTextAlignmentRight) {
        self.rightTextView.Jh_textAlignment = NSTextAlignmentRight;
    }
    if (cellModel.Jh_rightViewWidth>0 && cellModel.Jh_rightViewBlock) {
        cellModel.Jh_rightViewBlock(self.rightView);
    }
    //右侧按钮
    if (self.cellModel.Jh_rightBtnWidth>0) {
        self.rightBtn.backgroundColor = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnBgColor, [UIColor clearColor]);
        self.rightBtn.layer.cornerRadius = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnCornerRadius, 0);
        //右侧按钮标题
        if (self.cellModel.Jh_rightBtnTitle.length) {
            //按钮的title右对齐
            if (self.cellModel.Jh_rightBtnTitleCenter) {
                self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            } else {
                self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            }
            [self.rightBtn setTitle:self.cellModel.Jh_rightBtnTitle forState:UIControlStateNormal];
            self.rightBtn.titleLabel.font = JhFontsize(Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnTitleFont, Jh_SuffixTextFont));
            UIColor *titleColor = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnTitleColor,Jh_SuffixTextColor);
            [self.rightBtn setTitleColor:titleColor forState:UIControlStateNormal];
        }
        //右侧按钮图片
        if (self.cellModel.Jh_rightBtnImgName.length) {
            UIImage *btnImage = [UIImage imageNamed:self.cellModel.Jh_rightBtnImgName];
            [self.rightBtn setImage:btnImage forState:UIControlStateNormal];
            UIImage *selectImg = btnImage;
            if (self.cellModel.Jh_rightBtnSelectImgName.length) {
                selectImg = [UIImage imageNamed:self.cellModel.Jh_rightBtnSelectImgName];
            }
            [self.rightBtn setImage:selectImg forState:UIControlStateSelected];
            if (cellModel.Jh_rightBtnCornerRadius) {
                self.rightBtn.layer.masksToBounds=YES;
            }
        }
    }
    //提示文字
    if (cellModel.Jh_tipInfo.length) {
        self.tipLabel.text = cellModel.Jh_tipInfo;
        self.tipLabel.textColor = Jh_SetValueAndDefault(cellModel.Jh_tipInfoColor, Jh_TipInfoColor);
        self.tipLabel.font = JhFontsize(Jh_SetValueAndDefault(cellModel.Jh_tipInfoFont, Jh_TipInfoFont));
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //获取高度
    CGFloat cellHeight = self.cellModel.Jh_cellHeight;
    CGFloat titleHeight = self.cellModel.Jh_titleHeight;
    CGFloat textViewHeight = self.cellModel.Jh_textViewHeight;
    //cell垂直居中
    BOOL isCenter = self.cellModel.Jh_cellTextVerticalCenter == true || Jh_CellTextVerticalStyle == JhCellTextVerticalStyleCenter;
    CGFloat titleY = isCenter ? (cellHeight-titleHeight)/2 : Jh_Margin;
    //红星
    JhTitleShowType titleShowType = Jh_SetValueAndDefault(self.cellModel.Jh_titleShowType, Jh_TitleShowType);
    BOOL isShowRedStar = titleShowType == JhTitleShowTypeRedStarFront && self.cellModel.Jh_required == YES;
    self.redStarLabel.hidden = !isShowRedStar;
    if (isShowRedStar) {
        self.redStarLabel.frame = CGRectMake(Jh_LeftMargin- Jh_RedStarWidth, isCenter ? titleY : Jh_Margin, isShowRedStar ? Jh_RedStarWidth : 0, titleHeight);
    }
    //标题
    CGFloat titleWidth = self.cellModel.Jh_title.length ? self.cellModel.Jh_titleWidth : 0;
    self.titleLabel.frame = CGRectMake(Jh_LeftMargin, titleY, titleWidth, titleHeight);
    //如设置左侧图片，则显示图片
    CGFloat imgAndMarginWidth = 0;
    if (self.cellModel.Jh_leftImgName.length) {
        CGFloat imgW = Jh_SetValueAndDefault(self.cellModel.Jh_leftImgWH, Jh_LeftImgWH);
        CGFloat marginW = Jh_SetValueAndDefault(self.cellModel.Jh_leftImgRightMargin, Jh_LeftImgRightMargin);
        imgAndMarginWidth = imgW + marginW;
        self.leftImgView.frame = CGRectMake(Jh_LeftMargin, isCenter ? (cellHeight-imgW)/2 : Jh_Margin,imgW, imgW);
        if (titleWidth) {
            self.titleLabel.Jh_x = Jh_LeftMargin+imgAndMarginWidth;
            self.titleLabel.Jh_width = titleWidth-imgAndMarginWidth;
        }
    }
    //rightTextView
    CGFloat textView_X = !self.cellModel.Jh_title.length ? (Jh_LeftMargin+imgAndMarginWidth+Jh_InfoLeftMargin) : (Jh_LeftMargin+titleWidth+Jh_InfoLeftMargin);
    CGFloat textView_Y = isCenter ? (cellHeight - textViewHeight)/2 : Jh_Margin;
    self.rightTextView.frame = CGRectMake(textView_X, textView_Y, self.cellModel.Jh_textViewWidth,textViewHeight);
    //右侧按钮
    if (self.cellModel.Jh_rightBtnWidth>0) {
        CGFloat rightBtnY = self.cellModel.Jh_rightBtnHeight ? (cellHeight - self.cellModel.Jh_rightBtnHeight)/2 : 0;
        CGFloat rightBtnWidth = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnWidth, 0);
        CGFloat rightBtnHeight = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnHeight, cellHeight);
        self.rightBtn.hidden = NO;
        self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.rightTextView.frame)+Jh_RightViewLeftMargin, rightBtnY, rightBtnWidth, rightBtnHeight);
        //右侧按钮图片
        if (self.cellModel.Jh_rightBtnImgName.length) {
            CGFloat width = self.cellModel.Jh_rightBtnWidth;
            CGFloat imgWH = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnImgWH, Jh_LeftImgWH);
            CGFloat imgTextMargin = Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnImgTextMargin, Jh_RightBtnImgTextMargin);
            //图片右对齐
            if (self.cellModel.Jh_rightBtnTitle.length) {
                CGFloat textWidth = [NSString Jh_autoWidthWithString:self.cellModel.Jh_rightBtnTitle font:Jh_SetValueAndDefault(self.cellModel.Jh_rightBtnTitleFont, Jh_SuffixTextFont)];
                CGFloat left = width-imgTextMargin-textWidth-imgWH;
                CGFloat right = textWidth+imgTextMargin;
                CGFloat top = (cellHeight-imgWH)/2;
                CGFloat bottom = top;
                self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
            }
        }
    }
    //右侧自定义view
    if (self.cellModel.Jh_rightViewWidth>0) {
        self.rightBtn.hidden = YES;
        self.rightView.frame =CGRectMake(CGRectGetMaxX(self.rightTextView.frame)+Jh_RightViewLeftMargin, 0, self.cellModel.Jh_rightViewWidth, cellHeight);
    }
}

//右侧按钮点击事件
- (void)Jh_clickRightButton:(UIButton *)button {
    button.selected = !button.isSelected;
    if (self.cellModel.Jh_rightBtnWidth>0 && self.cellModel.Jh_rightBtnClickBlock) {
        self.cellModel.Jh_rightBtnClickBlock(self.rightBtn);
    }
}

@end
