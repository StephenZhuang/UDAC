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
#import "Ios6QRViewController.h"
#import "Ios7QRViewController.h"

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
    _codeArray = [[NSMutableArray alloc] init];
    originCode = @"";
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)scanAction
{
    if (IOS7_OR_LATER) {
        Ios7QRViewController *ios7 = [[Ios7QRViewController alloc] init];
        ios7.isContinuous = YES;
        ios7.scanBlock = ^(NSString *code) {
            if (code == nil || [code isEqualToString:originCode]) {
                return ;
            }
            originCode = code;
            [_codeArray addObject:code];
        };
        [self.navigationController pushViewController:ios7 animated:YES];
    } else {
        Ios6QRViewController *ios6 = [[Ios6QRViewController alloc] init];
        ios6.isContinuous = YES;
        ios6.scanBlock = ^(NSString *code) {
            if (code == nil || [code isEqualToString:originCode]) {
                return ;
            }
            originCode = code;
            [_codeArray addObject:code];
        };
        [self.navigationController pushViewController:ios6 animated:YES];
    }
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

- (void)loadData
{
  //  {"billcode","{\"billcode\":\""+billcode+"\",\"class\":\"com.shqj.webservice.entity.XsddOrderCode\"}"}
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.XsddOrderCode" forKey: @"class"];
    [dic setObject:_order.billcode forKey:@"billcode"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"billcode"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        XsddQuerydetailOrderList *xao=[[XsddQuerydetailOrderList alloc] init];
        [xao build:dic];
        [_dataArray removeAllObjects];
        [_dataArray addObjectsFromArray:xao.data];
        [self.tableView reloadData];
    }];
    [webservice postWithMethodName:@"xsdd_doQueryDetailOrder" params: params];
}

///** 获取详细商品*/
//－（void）dataload:(NSString *)billcode{
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:[[NSString alloc] initWithFormat:@"{\"billcode\":\"%@\",\"class\":\"com.shqj.webservice.entity.XsddOrderCode\"}",billcode] forKey: @"billcode"];
//    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
//    [webservice postWithMethodName:@"xsdd_doQueryDetailOrder" params: params];
//}
//
//
//- (void)webServiceFinished:(NSString *)data
//{
//    NSDictionary *dic = [data objectFromJSONString];
//    XsddQuerydetailOrderList *xao=[[XsddQuerydetailOrderList alloc] init];
//    [xao build:dic];
//    
//}
//
//
//
///**
// 提交扫描二维码，躲避
// tms:[  {\"billcode\":\"二维码\",\"smcode\":\"登录key\",\"class\":\"com.shqj.webservice.entity.XsddMake\"}]
// */
//－（void）dataloaddsubmit:	(NSString*)tms{
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:tms forKey: @"jlorder"];
//    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinishedsubmit:)];
//    [webservice postWithMethodName:@"xsdd_doXsck" params: params];
//}
//
//
//- (void)webServiceFinishedsubmit:(NSString *)data
//{
//    NSDictionary *dic = [data objectFromJSONString];
//    Retn *xao=[[Retn alloc] init];
//    [xao build:dic];
//    
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SoldOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SoldOrderDetailCell"];
        XsddQueryAllOrder *order = _order;
        [cell.orderCodeLabel setText:order.billcode];
        [cell.orderTimeLabel setText:order.riqi];
        [cell.guestLabel setText:order.kh];
        [cell.solderLabel setText:order.ywy];
        [cell.addressLabel setText:order.shdiz];
        return cell;
    } else if (indexPath.section == 1) {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        [cell.codeLabel setText:@"商品编号"];
        [cell.nameLabel setText:@"名称"];
        [cell.countLabel setText:@"数量"];
        return cell;
    } else {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        XsddQuerydetailOrder *order = _dataArray[indexPath.row];
        [cell.codeLabel setText:order.spcode];
        [cell.nameLabel setText:order.spname];
        [cell.countLabel setText:order.spcount];
        return cell;
    }
}

- (IBAction)submitWithCode
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableArray *dicArray = [[NSMutableArray alloc] init];
    for (NSString *code in _codeArray) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:@"com.shqj.webservice.entity.XsddMake" forKey: @"class"];
        [dic setObject:_order.billcode forKey:@"billcode"];
        [dic setObject:code forKey:@"smcode"];
        [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
        [dicArray addObject:dic];
    }
    NSString *jsonString = [dicArray JSONString];
    [params setObject:jsonString forKey: @"jlorder"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        Retn *retn = [[Retn alloc] init];
        [retn build:dic];
        if (retn.returntype.intValue == 1) {
            [ProgressHUD showSuccess:@"提交成功"];
        } else {
            [ProgressHUD showError:@"提交失败"];
        }
    }];
    [webservice postWithMethodName:@"xsdd_doXsck" params: params];
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
