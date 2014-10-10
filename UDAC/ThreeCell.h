//
//  ThreeCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeCell : UITableViewCell
@property (nonatomic , weak) IBOutlet UILabel *codeLabel;
@property (nonatomic , weak) IBOutlet UILabel *nameLabel;
@property (nonatomic , weak) IBOutlet UILabel *countLabel;
@property (nonatomic , weak) IBOutlet UILabel *priceLabel;
@property (nonatomic , weak) IBOutlet UILabel *totalPriceLabel;
@property (nonatomic , weak) IBOutlet UIStepper *step;
@property (nonatomic , copy) void (^stepBlcok)(double num);
@end
