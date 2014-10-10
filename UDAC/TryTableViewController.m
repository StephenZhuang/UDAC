//
//  TryTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "TryTableViewController.h"

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


/** 获取试用商品*/
－（void）dataload{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKey" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkey"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"sy_doQuerySYE" params: params];
}


- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryJdkList *xao=[[QueryJdkList alloc] init];
    [xao build:dic];
}


/** 试用订单生成
 参数  ［{\"class\":\"com.shqj.webservice.entity.JFBackOrder\",\"count\":数量,\"pk_cpkey\":\"商品编码\",\"pk_key\":\"登录key\"}］
 */
－（void）dataloadsubmit:(NSString*)systr{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:systr forKey: @"jforder"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinishedsubmit:)];
    [webservice postWithMethodName:@"sy_doMakeJFOrder" params: params];
}

- (void)webServiceFinishedsubmit:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    MakeJFOrder *xao=[[MakeJFOrder alloc] init];
    [xao build:dic];
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
