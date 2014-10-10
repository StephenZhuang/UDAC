//
//  TextFieldCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldCell : UITableViewCell
@property (nonatomic , weak) IBOutlet UITextField *textField;
@property (nonatomic , copy) void (^textChangeBlock)(NSString *text);
@end
