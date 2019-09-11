//
//  FormDemo5VC.m
//  JhForm
//
//  Created by Jh on 2019/9/10.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "FormDemo5VC.h"
#import "Masonry.h"

#define JhColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JhRandomColor JhColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface FormDemo5VC ()

@property (nonatomic, strong)  UIButton *countDownBtn;

@end

@implementation FormDemo5VC


-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        self.countDownBtn = [[UIButton alloc]init];
        [self.countDownBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.countDownBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.countDownBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [self.countDownBtn addTarget:self action:@selector(ClickCountDownBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countDownBtn;
}


-(void)ClickCountDownBtn{
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configFormModel];
    
    
}

#pragma mark - configFormModel
-(void)configFormModel{
    
    self.Jh_navTitle = @"inputCell最右侧添加自定义View";
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *cellModelArr = [NSMutableArray array];
    
    JhFormCellModel *cell0 = JhFormCellModel_AddInputCell(@"cell0", @"", NO, 0);
    cell0.Jh_placeholder =@"不设置右侧自定义view";
    cell0.Jh_maxInputLength=50;
    cell0.Jh_intputCellRightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    
    JhFormCellModel *cell1 = JhFormCellModel_AddInputCell(@"cell1", @"", YES, UIKeyboardTypeNumberPad);
    cell1.Jh_placeholder =@"请输入验证码";
    cell1.Jh_maxInputLength = 6;
    cell1.Jh_intputCellRightViewWidth = 120; //右侧自定义view 可添加倒计时按钮
    cell1.Jh_intputCellRightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    JhFormCellModel *cell2 = JhFormCellModel_AddInputCell(@"cell2", @"", NO, 0);
    cell2.Jh_placeholder =@"可换行";
    cell2.Jh_maxInputLength = 500;
    cell2.Jh_intputCellRightViewWidth = 80; //右侧自定义view 可添加倒计时按钮
    cell2.Jh_intputCellRightViewBlock = ^(UIView * _Nonnull RightView) {
        RightView.backgroundColor =JhRandomColor;
    };
    
    
    JhFormCellModel *verifyCode = JhFormCellModel_AddInputCell(@"验证码", @"", YES, UIKeyboardTypeNumberPad);
    verifyCode.Jh_placeholder = @"请输入验证码";
    verifyCode.Jh_maxInputLength = 6;
    verifyCode.Jh_intputCellRightViewWidth = 120; //右侧自定义view 可添加倒计时按钮
    verifyCode.Jh_intputCellRightViewBlock = ^(UIView * _Nonnull RightView) {
        [RightView addSubview:weakSelf.countDownBtn];
        [weakSelf.countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(RightView);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
        
    };
    
    
    JhFormCellModel *cell5 = JhFormCellModel_AddInputCell(@"左侧统一社会信用代码", @"", NO, 0);
    cell5.Jh_placeholder = @"可换行";
    cell5.Jh_titleMultiLineShow =YES;
    cell5.Jh_maxInputLength=500;
    
    
    NSString *title= @"统一社会\n 信用代码";
    JhFormCellModel *cell6 = JhFormCellModel_AddInputCell(title, @"", YES, 0);
    cell6.Jh_placeholder = @"请输入18位统一社会信用代码";
    cell6.Jh_titleMultiLineShow =YES;
    cell6.Jh_maxInputLength = 18;
    
    
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = JhRandomColor;
    JhFormCellModel *cell7 = JhFormCellModel_AddCustumRightCell(@"这是一个右侧自定义view类型的cell");
    cell7.Jh_titleMultiLineShow =YES;
    cell7.Jh_custumRightViewBlock = ^(UIView *RightView) {
        [RightView  addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    };
    
    JhFormCellModel *cell8 = JhFormCellModel_AddSelectCell(@"这是一个选择样式的cell", @"", NO);
    cell8.Jh_placeholder = @"请选择性别";
    cell8.Jh_titleMultiLineShow =YES;
    

    
    [cellModelArr addObjectsFromArray: @[cell0,cell1,cell2,verifyCode,cell6,cell5,cell7,cell8]];
    
    JhFormSectionModel *section0 = JhSectionModel_Add(cellModelArr);
    
    [self.Jh_formModelArr addObject:section0];
    
    
    
    
    
};


#pragma mark - SubmitRequest
-(void)SubmitRequest{
    
    
    
}


@end
