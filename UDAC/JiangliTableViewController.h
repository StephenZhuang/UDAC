//
//  JiangliTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiangliTableViewController : UITableViewController
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) QueryJlJE *queryJlJE;
@property (nonatomic , weak) IBOutlet UITextField *numTextField;
@end
