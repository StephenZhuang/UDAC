//
//  BankTableViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-10.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "BankTableViewController.h"
#import "TextFieldCell.h"

@interface BankTableViewController ()

@end

@implementation BankTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addTitleView:@"设置" subTitle:@"银行账户"];
    _placeholderArray = @[@"开户省份",@"开户城市",@"户名",@"银行账户",@"开户行"];
    _textArray = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",nil];
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
    // Return the number of rows in the section.
    return _placeholderArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell.textField setPlaceholder:_placeholderArray[indexPath.row]];
    [cell.textField  setText:_textArray[indexPath.row]];
    cell.textChangeBlock = ^(NSString *text) {
        [_textArray replaceObjectAtIndex:indexPath.row withObject:text];
    };
    return cell;
}

#pragma -mark textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)submitAction:(id)sender
{
    for (NSString *text in _textArray) {
        if ([text isEqualToString:@""]) {
            [ProgressHUD showError:@"资料未填写完整"];
            return;
        }
    }
    
    [self loadData];
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserYHKH" forKey: @"class"];
    [dic setObject:_textArray[0] forKey:@"khsf"];
    [dic setObject:_textArray[1] forKey:@"khcity"];
    [dic setObject:_textArray[2] forKey:@"psnname"];
    [dic setObject:_textArray[3] forKey:@"yhkh"];
    [dic setObject:_textArray[4] forKey:@"khh"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"useryhkh"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        Retn *retn = [[Retn alloc] init];
        [retn build:dic];
        if (retn.returntype.integerValue == 1) {
            [ProgressHUD showSuccess:@"提交成功"];
        } else {
            [ProgressHUD showError:@"提交失败"];
        }
    }];
    [webservice postWithMethodName:@"doAddYhkh" params: params];
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
