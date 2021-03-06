//
//  JiangliTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "JiangliTableViewController.h"
#import "GoodsCell.h"
#import "ThreeCell.h"

@interface JiangliTableViewController ()

@end

@implementation JiangliTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self addTitleView:@"店员奖励" subTitle:@"奖励兑换"];
    _dataArray = [[NSMutableArray alloc] init];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKey" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkey"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"jl_doQueryJlJE" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    _queryJlJE = [[QueryJlJE alloc] init];
    [_queryJlJE build:dic];
//    [self.dataArray removeAllObjects];
//    [self.dataArray addObjectsFromArray:kcList.data];
    [_yueLabel setText:[NSString stringWithFormat:@"可兑换现金总额:%@",_queryJlJE.yue]];
    [self.tableView reloadData];
}

- (IBAction)exchangeAction:(id)sender
{
    [self.view endEditing:YES];
    NSString *num = _queryJlJE.yue.stringValue;
    if (num.length == 0) {
        return;
    }
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.JLDHOrder" forKey: @"class"];
    [dic setObject:[NSNumber numberWithInt:num.integerValue] forKey:@"dcount"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"pk_key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"jlorder"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(exchangeFinished:)];
    [webservice postWithMethodName:@"jl_doMaokeOrder" params: params];
}

- (void)exchangeFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    MakeJFOrder *retn = [[MakeJFOrder alloc] init];
    [retn build:dic];
    if (retn.returntype.integerValue == 1) {
        [ProgressHUD showSuccess:@"兑换成功"];
    } else {
        [ProgressHUD showError:retn.retuenmsg];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_queryJlJE) {
        return 3;
    }
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0 || section == 1) {
        return 1;
    }
    return _dataArray.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return @" ";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"soldcell"];
        return cell;
    } else if (indexPath.section == 1) {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        [cell.codeLabel setText:@"商品条码"];
        [cell.nameLabel setText:@"商品名称"];
        [cell.countLabel setText:@"店员奖金"];
        return cell;
    } else {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        return cell;
    }
    
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell" forIndexPath:indexPath];
    [cell.nameLabel setText:_queryJlJE.allje.stringValue];
    [cell.codeLabel setText:_queryJlJE.dhje.stringValue];
    [cell.countLabel setText:_queryJlJE.ffe.stringValue];
    [cell.priceLabel setText:_queryJlJE.yue.stringValue];
    
    
    return cell;
}


///** 获取月度销售明细*/
//－（void）dataload{
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:@"com.shqj.webservice.entity.UserKey" forKey: @"class"];
//    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
//    NSString *jsonString = [dic JSONString];
//    [params setObject:jsonString forKey: @"userkey"];
//    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
//    [webservice postWithMethodName:@"doQueryJFDetail" params: params];
//}
//
//
//- (void)webServiceFinished:(NSString *)data
//{
//    NSDictionary *dic = [data objectFromJSONString];
//    QueryJFDetailList *xao=[[QueryJFDetailList alloc] init];
//    [xao build:dic];
//}
//
//
///** 奖励订单生成
// 参数  {\"pk_key\":\"" + pk_key + "\",\"dcount\":\"" + dcount + "\",\"class\":\"com.shqj.webservice.entity.JLDHOrder\"}
// */
//－（void）dataloadsubmit:(NSInteger*)dcount{
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:@"com.shqj.webservice.entity.JLDHOrder" forKey: @"class"];
//    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"pk_key"];
//    [dic setObject:dcount forKey:@"dcount"];
//    NSString *jsonString = [dic JSONString];
//    [params setObject:jsonString forKey: @"jlorder"];
//    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinishedsubmit:)];
//    [webservice postWithMethodName:@"jl_doMaokeOrder" params: params];
//}
//
//- (void)webServiceFinishedsubmit:(NSString *)data
//{
//    NSDictionary *dic = [data objectFromJSONString];
//    MakeJFOrder *xao=[[MakeJFOrder alloc] init];
//    [xao build:dic];
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
