//
//  JhBaseHeaderView.m
//  JhForm
//
//  Created by Jh on 2019/1/25.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "JhBaseHeaderView.h"

@implementation JhBaseHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[NSBundle mainBundle] loadNibNamed:@"JhBaseHeaderView" owner:self options:nil].firstObject;
        view.frame = self.bounds;
        [self addSubview:view];
    }
    return self;
}

-(void)setJh_leftTitle:(NSString *)Jh_leftTitle{
    _Jh_leftTitle = Jh_leftTitle;
    if (Jh_leftTitle) {
        self.Jh_leftTitleLabel.hidden = NO;
        self.Jh_leftTitleLabel.text = Jh_leftTitle;
    } else {
        self.Jh_leftTitleLabel.hidden = YES;
    }
}

-(void)setJh_rightBtnTitle:(NSString *)Jh_rightBtnTitle{
    _Jh_rightBtnTitle = Jh_rightBtnTitle;
    if (Jh_rightBtnTitle) {
        self.Jh_rightBtn.hidden = NO;
        [self.Jh_rightBtn setTitle:Jh_rightBtnTitle forState:UIControlStateNormal];
    } else {
        self.Jh_rightBtn.hidden = YES;
    }
}

-(void)setJh_rightBtnImage:(UIImage *)Jh_rightBtnImage{
    _Jh_rightBtnImage = Jh_rightBtnImage;
    [self.Jh_rightBtn setImage:Jh_rightBtnImage forState:UIControlStateNormal];
}

- (IBAction)handleButton:(id)sender {
    //调用
    if (self.JhHeaderClickRightBtnBlock) {
        self.JhHeaderClickRightBtnBlock();
    }
}

@end
