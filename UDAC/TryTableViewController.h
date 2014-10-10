//
//  TryTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TryTableViewController : UIViewController
{
    float total;
}
@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *addArray;
@property (nonatomic , weak) IBOutlet UIButton *exchangeButton;
@end
