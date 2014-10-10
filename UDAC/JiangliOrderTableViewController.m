//
//  JiangliOrderTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "JiangliOrderTableViewController.h"
#import "OrderCell.h"

@interface JiangliOrderTableViewController ()

@end

@implementation JiangliOrderTableViewController

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

    [self addTitleView:@"奖励" subTitle:@"奖励订单"];
    _dataArray = [[NSMutableArray alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
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
    [dic setObject:@"com.shqj.webservice.entity.UserKey" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkey"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"jl_doQueryMyjlOrder" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryAllMyJLOrderList *orderList = [[QueryAllMyJLOrderList alloc] init];
    [orderList build:dic];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:orderList.data];
    [self.tableView reloadData];
    if (self.refreshControl.refreshing) {
        [self.refreshControl endRefreshing];
    }
}

- (IBAction)sureAction:(UIButton *)sender
{
    QueryAllMyJLOrder *order = self.dataArray[sender.tag];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndOrderCode" forKey: @"class"];
    [dic setObject:order.dbillcode forKey:@"billcode"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userandcode"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(sureFinished:)];
    [webservice postWithMethodName:@"jl_doSureMyOrder" params: params];
}

- (void)sureFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    MakeJFOrder *retn = [[MakeJFOrder alloc] init];
    [retn build:dic];
    if (retn.returntype.integerValue == 1) {
        [ProgressHUD showSuccess:retn.retuenmsg];
    } else {
        [ProgressHUD showError:retn.retuenmsg];
    }
}

- (IBAction)deleteAction:(UIButton *)sender
{
    QueryAllMyJLOrder *order = self.dataArray[sender.tag];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndOrderCode" forKey: @"class"];
    [dic setObject:order.dbillcode forKey:@"billcode"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userandcode"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        MakeJFOrder *retn = [[MakeJFOrder alloc] init];
        [retn build:dic];
        if (retn.returntype.integerValue == 1) {
            [self.dataArray removeObjectAtIndex:sender.tag];
            [self.tableView reloadData];
        } else {
            [ProgressHUD showError:retn.retuenmsg];
        }
    }];
    [webservice postWithMethodName:@"jl_doDeleteMyOrder" params: params];
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
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    QueryAllMyJLOrder *order = [self.dataArray objectAtIndex:indexPath.section];
    
    [cell.orderLabel setText:order.dbillcode];
    [cell.statusLabel setText:order.allcount.stringValue];
    [cell.sendCompanyLabel setText:order.backdate];
    [cell.sendDateLabel setText:order.appstatus];
    [cell.sendOrderLabel setText:order.appdate];
    [cell.nameLabel setText:order.sendstatus];
    [cell.addressLabel setText:order.senddate];
    [cell.phoneLabel setText:order.allcount.stringValue];
    [cell.corpDateLabel setText:order.surestatus];
    [cell.reviewLabel setText:order.suredate];
    
    cell.deleteButton.tag = indexPath.section;
    cell.sureButton.tag = indexPath.section;
    return cell;
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
