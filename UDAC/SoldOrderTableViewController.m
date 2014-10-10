//
//  SoldOrderTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "SoldOrderTableViewController.h"
#import "SoldOrderCell.h"
#import "SolderOrderDetailViewController.h"

@interface SoldOrderTableViewController ()

@end

@implementation SoldOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addTitleView:@"销售" subTitle:@"销售订单"];
    _dataArray = [[NSMutableArray alloc] init];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArray.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SoldOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SoldOrderCell" forIndexPath:indexPath];
    
    // Configure the cell...
    XsddQueryAllOrder *order = _dataArray[indexPath.row];
    [cell.orderCodeLabel setText:order.billcode];
    [cell.orderTimeLabel setText:order.riqi];
    [cell.guestLabel setText:order.kh];
    [cell.solderLabel setText:order.ywy];
    [cell.addressLabel setText:[NSString stringWithFormat:@"收货地址：%@",order.shdiz]];
    return cell;
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        XsddQueryAllOrderList *xao=[[XsddQueryAllOrderList alloc] init];
        [xao build:dic];
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:xao.data];
        [self.tableView reloadData];
    }];
    [webservice postWithMethodName:@"xsdd_doQueryAllOrder" params: params];
}

//－（void）dataload｛
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
//    [webservice postWithMethodName:@"xsdd_doQueryAllOrder" params: params];
//｝
//
//
//- (void)webServiceFinished:(NSString *)data
//{
//    NSDictionary *dic = [data objectFromJSONString];
//    XsddQueryAllOrderList *xao=[[XsddQueryAllOrderList alloc] init];
//    [xao build:dic];
//    
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SoldOrderCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    XsddQueryAllOrder *order = _dataArray[indexPath.row];
    SolderOrderDetailViewController *vc = segue.destinationViewController;
    vc.order = order;
}


@end
