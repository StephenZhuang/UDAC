//
//  PdDetailTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "PdDetailTableViewController.h"
#import "Ios6QRViewController.h"
#import "Ios7QRViewController.h"

@interface PdDetailTableViewController ()

@end

@implementation PdDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _dataArray = [[NSMutableArray alloc] init];
    originCode = @"";
    [self addTitleView:@"库存" subTitle:@"库存盘点"];
    [self scanAction:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        [cell.textLabel setText:[NSString stringWithFormat:@"%@(%@)",_kcpd.cpname,_kcpd.cpprice]];
    } else {
        Kupd *kudp = _dataArray[indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"%@(%@)",kudp.smm,kudp.retuenmsg]];
    }
    
    return cell;
}



- (IBAction)scanAction:(id)sender
{
    if (IOS7_OR_LATER) {
        Ios7QRViewController *ios7 = [[Ios7QRViewController alloc] init];
        ios7.isContinuous = YES;
        ios7.scanBlock = ^(NSString *code) {
            if (code == nil || [code isEqualToString:originCode]) {
                return ;
            }
            originCode = code;
            [self submitWithCode:code];
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
            [self submitWithCode:code];
        };
        [self.navigationController pushViewController:ios6 animated:YES];
    }
}

- (void)submitWithCode:(NSString *)code
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKupdPD" forKey: @"class"];
    [dic setObject:_kcpd.cpcode forKey:@"pk_cp"];
    [dic setObject:code forKey:@"smm"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [@[dic] JSONString];
    [params setObject:jsonString forKey: @"kupd"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        KupdList *xao=[[KupdList alloc] init];
        [xao build:dic];
        [_dataArray addObjectsFromArray:xao.data];
        [self.tableView reloadData];
    }];
    if (_isUnusual) {
        [webservice postWithMethodName:@"yc_kupd" params: params];
    } else {
        [webservice postWithMethodName:@"kupd" params: params];
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
