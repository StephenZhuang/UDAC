//
//  SoldTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "SoldTableViewController.h"
#import "GoodsCell.h"
#import "Ios6QRViewController.h"
#import "Ios7QRViewController.h"
#import "ThreeCell.h"

@interface SoldTableViewController ()

@end

@implementation SoldTableViewController

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
    if (_isSell) {
        [self addTitleView:@"售出" subTitle:@"售出查询"];
    } else {
        [self addTitleView:@"退货" subTitle:@"退货查询"];
    }
    _dataArray = [[NSMutableArray alloc] init];
    _mDataArray = [[NSMutableArray alloc] init];
    _scanCode = @"";
    originCode = @"";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"扫码上传" style:UIBarButtonItemStyleBordered target:self action:@selector(upload)];
    [item setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)refreshControlValueChanged
{
//    if (self.refreshControl.refreshing) {
//        [self loadData];
//    }
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndSMCode" forKey: @"class"];
    [dic setObject:originCode forKey:@"smcode"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"str"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(webServiceFinished:)];
    [webservice postWithMethodName:@"doQueryCKBySMM" params: params];
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        [self loadMD];
    }
}

- (void)webServiceFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryCKBySMMList *jdkList = [[QueryCKBySMMList alloc] init];
    [jdkList build:dic];
    for (QueryCKBySMM *queryCKBySMM in jdkList.data) {
        [queryCKBySMM setState:@"待上传"];
        for (QueryCKBySMM *_queryCKBySMM in _mDataArray) {
            if ([_queryCKBySMM.spcode isEqualToString:queryCKBySMM.spcode]) {
                [_mDataArray replaceObjectAtIndex:[_mDataArray indexOfObject:_queryCKBySMM] withObject:queryCKBySMM];
                break;
            }
        }
    }
//    [self.mDataArray removeAllObjects];
//    [self.mDataArray addObjectsFromArray:jdkList.data];
    [self.tableView reloadData];
}

- (void)loadMD
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKeyAndSMCode" forKey: @"class"];
    [dic setObject:_scanCode forKey:@"smcode"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkey"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(loadMDFinished:)];
    [webservice postWithMethodName:@"doQueryALLkc" params: params];
}

- (void)loadMDFinished:(NSString *)data
{
    NSDictionary *dic = [data objectFromJSONString];
    QueryXjCKList *jdkList = [[QueryXjCKList alloc] init];
    [jdkList build:dic];
    [self.mDataArray removeAllObjects];
    [self.mDataArray addObjectsFromArray:jdkList.data];
    [self.tableView reloadData];
}

- (IBAction)sellAction:(UIButton *)sender
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.Userxsck" forKey: @"class"];
    [dic setObject:_scanCode forKey:@"smcode"];
    
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        QueryXjCK *queryckbysmm = self.mDataArray[sender.tag];
        [dic setObject:queryckbysmm.key forKey:@"mdkey"];
    } else {
        [dic setObject:@"a" forKey:@"mdkey"];
    }
    
    if (_isSell) {
        [dic setObject:@"a" forKey:@"isth"];
    } else {
        [dic setObject:@"Y" forKey:@"isth"];
    }
    
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userxmck"];
    WebServiceRead *webservice = [[WebServiceRead alloc] init:self selecter:@selector(sellFinished:)];
    [webservice postWithMethodName:@"doXsck" params: params];
}

- (void)sellFinished:(NSString *)data
{
    if (_isSell) {
        [ProgressHUD showSuccess:@"售出成功"];
    } else {
        [ProgressHUD showSuccess:@"退货成功"];
    }
}
                             
- (void)upload
{
    [self.view endEditing:YES];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (QueryCKBySMM *queryCKBySMM in _mDataArray) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:@"com.shqj.webservice.entity.Userxsck" forKey: @"class"];
        [dic setObject:queryCKBySMM.spcode forKey:@"smcode"];
        [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
        [arr addObject:dic];
    }
    NSString *jsonString = [arr JSONString];
    [params setObject:jsonString forKey: @"userxmck"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        Xsck *xsck = [[Xsck alloc] init];
        [xsck build:dic];
        if (xsck.returntype.integerValue == 1) {
            [ProgressHUD showSuccess:xsck.retuenmsg];
        } else {
            [ProgressHUD showError:xsck.retuenmsg];
        }
        
        for (XsckDetail *xsckDetail in xsck.data) {
            for (QueryCKBySMM *_queryCKBySMM in _mDataArray) {
                if ([_queryCKBySMM.spcode isEqualToString:xsckDetail.smm]) {
                    [_queryCKBySMM setState:xsckDetail.retuenmsg];
                    break;
                }
            }
        }
        [_dataArray addObjectsFromArray:_mDataArray];
        [_mDataArray removeAllObjects];
        
        [self.tableView reloadData];
    }];
    [webservice postWithMethodName:@"doXsck" params: params];
}

- (IBAction)gotoScan:(id)sender
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
//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:@"com.shqj.webservice.entity.UserKupdPD" forKey: @"class"];
//    [dic setObject:_kcpd.cpcode forKey:@"pk_cp"];
//    [dic setObject:code forKey:@"smm"];
//    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
//    NSString *jsonString = [@[dic] JSONString];
//    [params setObject:jsonString forKey: @"kupd"];
//    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
//        NSDictionary *dic = [data objectFromJSONString];
//        KupdList *xao=[[KupdList alloc] init];
//        [xao build:dic];
//        [_dataArray addObjectsFromArray:xao.data];
//        [self.tableView reloadData];
//    }];
//    [webservice postWithMethodName:@"yc_kupd" params: params];
    QueryCKBySMM *queryCKBySMM = [[QueryCKBySMM alloc] init];
    [queryCKBySMM setSpcode:originCode];
    [_mDataArray addObject:queryCKBySMM];
    [self loadData];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
//    originCode = textField.text;
//    [self loadData];
    return YES;
}

- (IBAction)addAction:(id)sender
{
    if ([_codeTextField.text isEqualToString:originCode]) {
        return;
    }
    originCode = _codeTextField.text;
    [self submitWithCode:self.scanCode];
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return self.dataArray.count;
    }
    return self.mDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        return 97;
//    } else {
//        return 71;
//    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
    if (indexPath.section == 0) {
        

        [cell.codeLabel setText:@"商品条码"];
        [cell.nameLabel setText:[NSString stringWithFormat:@"%@(%@/%@)",@"商品名称",@"单价",@"奖金"]];
        [cell.countLabel setText:@"状态"];
    } else if (indexPath.section == 1) {
        QueryCKBySMM *queryckbysmm = self.dataArray[indexPath.row];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@(%@/%@)",queryckbysmm.spname,queryckbysmm.dj,queryckbysmm.jldj];
        cell.codeLabel.text = queryckbysmm.spcode;
        cell.countLabel.text = queryckbysmm.state;
        
    } else {
        QueryCKBySMM *queryckbysmm = self.mDataArray[indexPath.row];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@(%@/%@)",queryckbysmm.spname,queryckbysmm.dj,queryckbysmm.jldj];
        cell.codeLabel.text = queryckbysmm.spcode;
        cell.countLabel.text = @"待上传";
    }
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
