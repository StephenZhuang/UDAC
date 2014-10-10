//
//  KcpdViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-9.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KcpdViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
{
    NSString *orginCode;
}
@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , assign) BOOL isUnusual;
@end
