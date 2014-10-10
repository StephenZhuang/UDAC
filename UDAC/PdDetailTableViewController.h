//
//  PdDetailTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdDetailTableViewController : UITableViewController
{
    NSString *originCode;
}
@property (nonatomic , strong) KcpdSp *kcpd;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , assign) BOOL isUnusual;
@end
