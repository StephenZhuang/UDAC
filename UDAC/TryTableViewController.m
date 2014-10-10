//
//  TryTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "TryTableViewController.h"
#import "ThreeCell.h"

@interface TryTableViewController ()

@end

@implementation TryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addTitleView:@"试用" subTitle:@"试用兑换"];
    _dataArray = [[NSMutableArray alloc] init];
    total = 0;
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
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
    [webservice postWithMethodName:@"jf_doQueryAllCanBackCP" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryAllCanBackCPList *cpList = [[QueryAllCanBackCPList alloc] init];
    [cpList build:dic];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:cpList.data];
    [self.tableView reloadData];
}

- (IBAction)exchangeAction:(id)sender
{
    if (total == 0) {
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (QueryAllCanBackCP *cp in _dataArray) {
        if (cp.num > 0) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:@"com.shqj.webservice.entity.JFBackOrder" forKey: @"class"];
            [dic setObject:[NSNumber numberWithInt:cp.num] forKey:@"count"];
            [dic setObject:cp.pk_cpkey forKey:@"pk_cpkey"];
            [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"pk_key"];
            [arr addObject:dic];
        }
    }
    NSString *jsonString = [arr JSONString];
    [params setObject:jsonString forKey: @"jforder"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(exchangeFinished:)];
    [webservice postWithMethodName:@"jf_doMakeJFOrder" params: params];
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

#pragma -mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 31;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        
    if (indexPath.section == 0) {
        ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        
        [cell.nameLabel setText:@"商品名称"];
        [cell.priceLabel setText:@"单价"];
        [cell.totalPriceLabel setText:@"金额"];
        [cell.countLabel setText:@"数量"];
        [cell.step setHidden:YES];
        return cell;
    }
    ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
    QueryAllCanBackCP *cp = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:cp.cpname];
    [cell.priceLabel setText:[NSString stringWithFormat:@"%.1f",cp.cpprice.floatValue]];
    [cell.totalPriceLabel setText:[NSString stringWithFormat:@"%.1f",cp.num * cp.cpprice.floatValue]];
    [cell.countLabel setText:[NSString stringWithFormat:@"%i",cp.num]];
    cell.stepBlcok = ^(double num) {
        cp.num = num;
        [self configTotal];
    };
    [cell.step setHidden:NO];
    return cell;
}

- (void)configTotal
{
    total = 0;
    for (QueryAllCanBackCP *cp in _dataArray) {
        total += cp.num * cp.cpprice.floatValue;
    }
    
    if (total == 0) {
        [_exchangeButton setTitle:@"立刻兑换" forState:UIControlStateNormal];
    } else {
        [_exchangeButton setTitle:[NSString stringWithFormat:@"立刻兑换(%1.f)",total] forState:UIControlStateNormal];
    }
}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
