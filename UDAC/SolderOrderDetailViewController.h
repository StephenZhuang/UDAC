//
//  SolderOrderDetailViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SolderOrderDetailViewController : UIViewController<UITableViewDataSource ,UITableViewDelegate>
{
    NSString *originCode;
}
@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *codeArray;
@property (nonatomic , strong) XsddQueryAllOrder *order;
@end
