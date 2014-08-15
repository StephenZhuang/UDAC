//
//  OrderDetailTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "OrderDetailTableViewController.h"
#import "OrderCell.h"
#import "GoodsCell.h"

@interface OrderDetailTableViewController ()

@end

@implementation OrderDetailTableViewController
@synthesize order;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addTitleView:@"积分" subTitle:@"订单详情"];
    _dataArray = [[NSMutableArray alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self loadData];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleBordered target:self action:@selector(deleteAction)];
    [item setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = item;
}
                             
- (void)deleteAction
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:order.dbillcode forKey:@"billcode"];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndOrderCode" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userandcode"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(deleteFinished:)];
    [webservice postWithMethodName:@"jf_doDeleteMyOrder" params: params];
}

- (void)deleteFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    MakeJFOrder *retn = [[MakeJFOrder alloc] init];
    [retn build:dic];
    if (retn.returntype.integerValue == 1) {
        [ProgressHUD showSuccess:@"删除成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [ProgressHUD showError:retn.retuenmsg];
    }
}

- (void)refreshControlValueChanged
{
    if (self.refreshControl.refreshing) {
        [self loadData];
    }
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:order.dbillcode forKey:@"billcode"];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndOrderCode" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userandcode"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"jf_doQueryDetailByCode" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryDetailByCodeList *detailList = [[QueryDetailByCodeList alloc] init];
    [detailList build:dic];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:detailList.data];
    [self.tableView reloadData];
    if (self.refreshControl.refreshing) {
        [self.refreshControl endRefreshing];
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
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }
    return self.dataArray.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"订单信息";
    } else {
        return @"商品信息";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 248;
    } else {
        return 100;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        [cell.orderLabel setText:order.dbillcode];
        [cell.statusLabel setText:order.sendstatus];
        [cell.sendCompanyLabel setText:order.sendcorp];
        [cell.sendDateLabel setText:order.senddate];
        [cell.sendOrderLabel setText:order.sendcode];
        [cell.nameLabel setText:order.connectman];
        [cell.addressLabel setText:order.connectaddr];
        [cell.phoneLabel setText:order.connectmoblie];
        [cell.corpDateLabel setText:order.backdate];
        [cell.reviewLabel setText:order.appstatus];
        [cell.countLabel setText:order.allcount.stringValue];
        [cell.priceLabel setText:order.allprice.stringValue];
        
        return cell;
    } else {
        GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell"];
        QueryAllMyOrder *detail = [self.dataArray objectAtIndex:indexPath.row];
        [cell.nameLabel setText:detail.cpname];
        [cell.codeLabel setText:detail.cpcount.stringValue];
        [cell.countLabel setText:detail.cpprice.stringValue];
        [cell.priceLabel setText:detail.allprice.stringValue];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

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
