//
//  ExchangeViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-14.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "ExchangeViewController.h"
#import "GoodsCell.h"
#import "ThreeCell.h"

#define LeftEdge 74
#define DefaultLabelWidth 160

@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTitleView:@"积分" subTitle:@"积分换礼"];
    _dataArray = [[NSMutableArray alloc] init];
    _addArray = [[NSMutableArray alloc] init];
    total = 0;
    
    [self.view setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
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
    if ([tableView isEqual:_tableView]) {
        
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
    } else {
        GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell"];
        QueryAllCanBackCP *cp = [_addArray objectAtIndex:indexPath.row];
        [cell.nameLabel setText:cp.cpname];
        [cell.codeLabel setText:[NSString stringWithFormat:@"%.1f",cp.num * cp.cpprice.floatValue]];
        [cell.countLabel setText:[NSString stringWithFormat:@"%i",cp.num]];
        [cell.minusButton setTag:indexPath.row];
        [cell.plusButton setTag:indexPath.row];
        return cell;
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([tableView isEqual:_tableView]) {
//        [_sideView setHidden:NO];
//        [UIView animateWithDuration:0.2 animations:^(void){
//            [_sideView setFrame:CGRectMake(DefaultLabelWidth, _sideView.frame.origin.y, _sideView.frame.size.width, _sideView.frame.size.height)];
//            [_tableView setFrame:CGRectMake(-LeftEdge, _tableView.frame.origin.y, _tableView.frame.size.width, _tableView.frame.size.height)];
//        } completion:^(BOOL isFinished){
//            if (isFinished) {
//                
//            }
//        }];
//        
//        QueryAllCanBackCP *cp = [self.dataArray objectAtIndex:indexPath.row];
//        NSInteger index = [_addArray indexOfObject:cp];
//        if (index == NSNotFound) {
//            [_addArray addObject:cp];
//        } else {
//        }
//        cp.num++;
//        [_addTableView reloadData];
//        [self configTotal];
//    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

- (IBAction)minusAction:(UIButton *)sender
{
    QueryAllCanBackCP *cp = [self.addArray objectAtIndex:sender.tag];
    cp.num--;
    if (cp.num <= 0) {
        [_addArray removeObject:cp];
    }
    if (_addArray.count == 0) {
        CGRect rect = _tableView.frame;
        CGRect rect2 = _sideView.frame;
        rect.origin.x = 0;
        rect2.origin.x = 320;
        [UIView animateWithDuration:0.2 animations:^(void){
            [_tableView setFrame:rect];
            [_sideView setFrame:rect2];
        } completion:^(BOOL isFinished){
            [_sideView setHidden:YES];
        }];
    }
    [_addTableView reloadData];
    [self configTotal];
}

- (IBAction)plusAction:(UIButton *)sender
{
    QueryAllCanBackCP *cp = [self.addArray objectAtIndex:sender.tag];
    cp.num++;
    [_addTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:sender.tag inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [self configTotal];
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

#pragma - mark touch delegate
- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        CGRect rect = _tableView.frame;
        CGRect rect2 = _sideView.frame;
        oringx1 = rect.origin.x;
        oringx2 = rect2.origin.x;
        
        CGPoint firstPoint = [pan locationInView:self.view];
        
//        if (_sideView.hidden) {
//            CGRect rect = [_tableView convertRect:[_tableView rectForRowAtIndexPath:[_tableView indexPathForRowAtPoint:firstPoint]] toView:[_tableView superview]];
//            [_arrowImage setFrame:CGRectMake(_arrowImage.frame.origin.x, rect.origin.y + 14, _arrowImage.frame.size.width, _arrowImage.frame.size.height)];
//            NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:firstPoint];
//            MCategory *category = [_firstArray objectAtIndex:indexPath.row];
//            [[ApisFactory getApiCategoryList] load:self selecter:@selector(disposMessage:) pid:category.id];
//        }
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        CGPoint point = [pan translationInView:self.view];
        
        float dx = point.x;
        [_sideView setHidden:NO];
        
        CGRect rect = _tableView.frame;
        rect.origin.x = MIN(0, MAX(-LeftEdge, oringx1 + dx)) ;
        [_tableView setFrame:rect];
        
        CGRect rect2 = _sideView.frame;
        rect2.origin.x = MIN(320, MAX(DefaultLabelWidth, oringx2 + dx));
        [_sideView setFrame:rect2];
    } else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        [self restoreView];
    }
}

- (void)restoreView
{
    CGRect rect = _tableView.frame;
    CGRect rect2 = _sideView.frame;
    CGFloat x = rect.origin.x;
    if (x < 0) {
        rect.origin.x = -LeftEdge;
        rect2.origin.x = DefaultLabelWidth;
        [UIView animateWithDuration:0.2 animations:^(void){
            [_tableView setFrame:rect];
            [_sideView setFrame:rect2];
        } completion:^(BOOL isFinished){
            
        }];
    } else {
        rect2.origin.x = 320;
        [UIView animateWithDuration:0.2 animations:^(void){
            [_tableView setFrame:rect];
            [_sideView setFrame:rect2];
        } completion:^(BOOL isFinished){
            [_sideView setHidden:YES];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
