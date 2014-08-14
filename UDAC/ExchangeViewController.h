//
//  ExchangeViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExchangeViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
{
    float oringx1;
    float oringx2;
    float total;
}
@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , weak) IBOutlet UITableView *addTableView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *addArray;
@property (nonatomic , weak) IBOutlet UIView *sideView;
@property (nonatomic , weak) IBOutlet UIButton *exchangeButton;
@end
