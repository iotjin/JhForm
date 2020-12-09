//
//  FooterCell.h
//  JhForm
//
//  Created by Jh on 2020/12/3.
//  Copyright © 2020 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FooterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSString *title;
@end

NS_ASSUME_NONNULL_END
