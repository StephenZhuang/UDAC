//
//  OrderCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (nonatomic , strong) IBOutlet UILabel *orderLabel;
@property (nonatomic , strong) IBOutlet UILabel *statusLabel;
@property (nonatomic , strong) IBOutlet UILabel *sendDateLabel;
@property (nonatomic , strong) IBOutlet UILabel *sendCompanyLabel;
@property (nonatomic , strong) IBOutlet UILabel *sendOrderLabel;
@property (nonatomic , strong) IBOutlet UILabel *nameLabel;
@property (nonatomic , strong) IBOutlet UILabel *phoneLabel;
@property (nonatomic , strong) IBOutlet UILabel *addressLabel;
@property (nonatomic , strong) IBOutlet UILabel *corpDateLabel;
@property (nonatomic , strong) IBOutlet UILabel *reviewLabel;
@property (nonatomic , strong) IBOutlet UILabel *countLabel;
@property (nonatomic , strong) IBOutlet UILabel *priceLabel;
@property (nonatomic , strong) IBOutlet UIButton *deleteButton;
@property (nonatomic , strong) IBOutlet UIButton *sureButton;
@end
