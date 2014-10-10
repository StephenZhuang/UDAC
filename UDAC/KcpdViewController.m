//
//  KcpdViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-9.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "KcpdViewController.h"
#import "PandianCell.h"

@interface KcpdViewController ()

@end

@implementation KcpdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"库存" subTitle:@"库存盘点"];
    _dataArray = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

#pragma - mark tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PandianCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PandianCell"];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/** 获取盘点商品*/
－（void）dataload{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"kcpd_sp" params: params];
}


- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    KcpdSpList *xao=[[KcpdSpList alloc] init];
    [xao build:dic];
}


/** 提交二维码
 参数  ［ "{\"key\":\"" + F.Verify + "\",\"pk_cp\":\"商品编号\",\"smm\":\"扫描码\",\"class\":\"com.shqj.webservice.entity.UserKupdPD\"}"］
 */
－（void）dataloadsubmit:(NSString *)kupd{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kupd forKey: @"kupd"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinishedsubmit:)];
    [webservice postWithMethodName:@"kupd" params: params];
}


- (void)webServiceFinishedsubmit:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    KupdList *xao=[[KupdList alloc] init];
    [xao build:dic];
}



@end
