//
//  MenuViewController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuHeader.h"
#import "MenuCell.h"
#import "SoldTableViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    [self addTitleView:@"" subTitle:@""];
    _colorArray = [NSArray arrayWithObjects:RGB(248, 0, 94),RGB(86, 29, 230),RGB(165, 159, 41),RGB(158, 25, 231),RGB(165, 159, 41),RGB(158, 25, 231),RGB(243, 0, 84),RGB(86, 29, 230),RGB(226, 83, 51), nil];
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"存货明细",@"销售扫码",@"积分换礼",@"换礼订单",@"店员奖励",@"奖励订单",@"试用兑换",@"试用订单",@"积分奖励", nil];
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        [_titleArray removeObjectAtIndex:2];
    }
    
    [self loadData];
    
}

- (void)loadData
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"com.shqj.webservice.entity.UserKey" forKey: @"class"];
    [dic setObject:[ToolUtils sharedInstance].user.key forKey:@"key"];
    NSString *jsonString = [dic JSONString];
    [params setObject:jsonString forKey: @"userkey"];
    WebServiceRead *webservice = [[WebServiceRead alloc] initWithBlock:^(NSString *data) {
        NSDictionary *dic = [data objectFromJSONString];
        _queryJlJECount = [[QueryJlJECount alloc] init];
        [_queryJlJECount build:dic];
        [self.collectionView reloadData];
    }];
    [webservice postWithMethodName:@"doQueryAllCountAndJE" params: params];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        return 3;
    }
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:_colorArray[indexPath.row]];
    [cell.titleLabel setText:_titleArray[indexPath.row]];
    if (indexPath.row == 0) {
        [cell.subTitleLabel setHidden:NO];
        if (_queryJlJECount) {
            [cell.subTitleLabel setText:[NSString stringWithFormat:@"库存:%@ 总额:%@",_queryJlJECount.kccount ,_queryJlJECount.je]];
        }
    } else if (indexPath.row == 1) {
        [cell.subTitleLabel setHidden:NO];
        [cell.subTitleLabel setText:@"月销售额：null"];
    } else if (indexPath.row == 2) {
        [cell.subTitleLabel setHidden:NO];
        [cell.subTitleLabel setText:@"余额：0.0"];
    } else if (indexPath.row == 8) {
        [cell.subTitleLabel setHidden:NO];
        [cell.subTitleLabel setText:@"获取记录"];
    } else {
        [cell.subTitleLabel setHidden:YES];
    }

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MenuHeader *header = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header.nameLabel setText:[ToolUtils sharedInstance].username];
        [header.subNameLabel setText:[ToolUtils sharedInstance].username];
        header.layer.cornerRadius = 5;
        header.layer.masksToBounds = YES;
        header.layer.borderColor = [UIColor whiteColor].CGColor;
        header.layer.borderWidth = 5;
    }
    return header;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:_titleArray[indexPath.row] sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"售出"]) {
        SoldTableViewController *vc = segue.destinationViewController;
        vc.isSell = YES;
    }
}


@end
