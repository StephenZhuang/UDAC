//
//  GoodsCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCell : UITableViewCell
@property (nonatomic , strong) IBOutlet UILabel *nameLabel;
@property (nonatomic , strong) IBOutlet UILabel *codeLabel;
@property (nonatomic , strong) IBOutlet UILabel *countLabel;
@property (nonatomic , strong) IBOutlet UIButton *sellButton;
@end
