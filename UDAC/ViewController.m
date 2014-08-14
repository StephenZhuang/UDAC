//
//  ViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ToolUtils *toolUtils = [ToolUtils sharedInstance];
    if (toolUtils.isLogin) {
        [_usernameTextField setText:toolUtils.username];
        [_passwordTextField setText:toolUtils.password];
        [self loginAction:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:_usernameTextField]) {
        [_passwordTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)loginAction:(id)sender
{
    [self.view endEditing:YES];
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if (username.length == 0) {
        return;
    }
    if (password.length == 0) {
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserInfo" forKey: @"class"];
    [dic setObject:username forKey: @"usercode"];
    [dic setObject:password forKey: @"userpwd"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userinfo"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    webservice.showLoading = YES;
    [webservice postWithMethodName:@"doLogin" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    Login *login = [[Login alloc] init];
    [login build:dic];
    if (login.returntype.integerValue == 1) {
//        [ProgressHUD showSuccess:@"登录成功"];
        ToolUtils *toolUtils = [ToolUtils sharedInstance];
        toolUtils.username = _usernameTextField.text;
        toolUtils.password = _passwordTextField.text;
        toolUtils.isLogin = YES;
        toolUtils.user = login;
        
        [self performSegueWithIdentifier:@"login" sender:nil];
    } else {
        [ProgressHUD showError:login.key];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
