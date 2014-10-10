//
//  BankTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankTableViewController : UITableViewController<UITextFieldDelegate>
@property (nonatomic , strong) NSArray *placeholderArray;
@property (nonatomic , strong) NSMutableArray *textArray;
@end
