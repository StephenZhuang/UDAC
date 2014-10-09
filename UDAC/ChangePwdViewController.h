//
//  ChangePwdViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-9.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePwdViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic , weak) IBOutlet UITextField *originPwdTextField;
@property (nonatomic , weak) IBOutlet UITextField *pwdTextField;
@end
