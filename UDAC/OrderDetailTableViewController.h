//
//  OrderDetailTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailTableViewController : UITableViewController
@property (nonatomic , strong) QueryAllMyOrder *order;
@property (nonatomic , strong) NSMutableArray *dataArray;
@end
