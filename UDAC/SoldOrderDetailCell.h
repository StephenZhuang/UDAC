//
//  SoldOrderDetailCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoldOrderDetailCell : UITableViewCell
@property (nonatomic , weak) IBOutlet UILabel *orderCodeLabel;
@property (nonatomic , weak) IBOutlet UILabel *orderTimeLabel;
@property (nonatomic , weak) IBOutlet UILabel *guestLabel;
@property (nonatomic , weak) IBOutlet UILabel *solderLabel;
@property (nonatomic , weak) IBOutlet UILabel *addressLabel;
@end
