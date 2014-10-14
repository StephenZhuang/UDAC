//
//  JiangliTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiangliTableViewController : UIViewController
@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) QueryJlJE *queryJlJE;
@property (nonatomic , weak) IBOutlet UITextField *numTextField;
@property (nonatomic , weak) IBOutlet UILabel *yueLabel;
@end
