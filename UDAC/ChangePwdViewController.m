//
//  ChangePwdViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-9.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController ()

@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"设置" subTitle:@"修改密码"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:_originPwdTextField]) {
        [_pwdTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

//String jsonValue = "{\"key\":\"" + F.Verify + "\",\"pwd\":\"" + pwd + "\",\"class\":\"com.shqj.webservice.entity.UserKeyPwd\"}";
//UpdateOne update = new UpdateOne("doUpdateMyPWD", new String[][] { { "userkeypwd", jsonValue }, });


- (IBAction)changAction:(id)sender{
    if(_originPwdTextField.text==_pwdTextField.text){
        return ;
    }
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyPwd" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    [dic setObject:_originPwdTextField.text forKey:@"pwd"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkeypwd"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"doUpdateMyPWD" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
