//
//  SolderOrderDetailViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "SolderOrderDetailViewController.h"
#import "SoldOrderDetailCell.h"
#import "ThreeCell.h"

@interface SolderOrderDetailViewController ()

@end

@implementation SolderOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"销售" subTitle:@"订单详情"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"扫描" style:UIBarButtonItemStyleBordered target:self action:@selector(scanAction)];
    [item setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = item;
    _dataArray = [[NSMutableArray alloc] init];
}

- (void)scanAction
{
 
}

#pragma -mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else {
        return _dataArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 63;
    } else {
        return 20;
    }
}

/** 获取详细商品*/
－（void）dataload:(NSString *)billcode{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[[NSString alloc] initWithFormat:@"{\"billcode\":\"%@\",\"class\":\"com.shqj.webservice.entity.XsddOrderCode\"}",billcode] forKey: @"userkeypwd"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"xsdd_doQueryDetailOrder" params: params];
}


- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    XsddQuerydetailOrderList *xao=[[XsddQuerydetailOrderList alloc] init];
    [xao build:dic];
    
}



/**
 提交扫描二维码，躲避
 tms:[  {\"billcode\":\"二维码\",\"smcode\":\"登录key\",\"class\":\"com.shqj.webservice.entity.XsddMake\"}]
 */
－（void）dataloaddsubmit:	(NSString*)tms{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:tms forKey: @"jlorder"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinishedsubmit:)];
    [webservice postWithMethodName:@"xsdd_doXsck" params: params];
}


- (void)webServiceFinishedsubmit:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    Retn *xao=[[Retn alloc] init];
    [xao build:dic];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SoldOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SoldOrderDetailCell"];
        return cell;
    } else if (indexPath.section == 1) {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        [cell.countLabel setText:@"商品编号"];
        [cell.nameLabel setText:@"名称"];
        [cell.countLabel setText:@"数量"];
        return cell;
    } else {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        return cell;
    }
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

@end
