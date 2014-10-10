//
//  JiangliTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-15.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "JiangliTableViewController.h"
#import "GoodsCell.h"

@interface JiangliTableViewController ()

@end

@implementation JiangliTableViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self addTitleView:@"店员奖励" subTitle:@"奖励兑换"];
    _dataArray = [[NSMutableArray alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self loadData];
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
    [webservice postWithMethodName:@"jl_doQueryJlJE" params: params];
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    _queryJlJE = [[QueryJlJE alloc] init];
    [_queryJlJE build:dic];
//    [self.dataArray removeAllObjects];
//    [self.dataArray addObjectsFromArray:kcList.data];
    [self.tableView reloadData];
    if (self.refreshControl.refreshing) {
        [self.refreshControl endRefreshing];
    }
}

- (IBAction)exchangeAction:(id)sender
{
    [self.view endEditing:YES];
    NSString *num = _numTextField.text;
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
        return 1;
    }
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell" forIndexPath:indexPath];
    [cell.nameLabel setText:_queryJlJE.allje.stringValue];
    [cell.codeLabel setText:_queryJlJE.dhje.stringValue];
    [cell.countLabel setText:_queryJlJE.ffe.stringValue];
    [cell.priceLabel setText:_queryJlJE.yue.stringValue];
    
    
    return cell;
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
