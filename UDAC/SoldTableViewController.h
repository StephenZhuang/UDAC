//
//  SoldTableViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoldTableViewController : UITableViewController<UITextFieldDelegate>
{
    NSString *originCode;
}
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) NSMutableArray *mDataArray;
@property (nonatomic , strong) NSString *scanCode;
@property (nonatomic , assign) BOOL isSell;
@property (nonatomic , weak) IBOutlet UITextField *codeTextField;
@end
