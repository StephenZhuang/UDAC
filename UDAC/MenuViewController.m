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
    _colorArray = [NSArray arrayWithObjects:RGB(248, 0, 94),RGB(226, 83, 51),RGB(165, 159, 41),RGB(158, 25, 231),RGB(165, 159, 41),RGB(158, 25, 231),RGB(243, 0, 84),RGB(86, 29, 230), nil];
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"库存查询",@"售出",@"退货",@"积分兑换",@"积分订单",@"奖励兑换",@"奖励订单",@"兑换记录", nil];
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        [_titleArray removeObjectAtIndex:2];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)logoutAction:(id)sender
{
    [ToolUtils sharedInstance].isLogin = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([ToolUtils sharedInstance].user.usertype.integerValue == 1) {
        return 7;
    }
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:_colorArray[indexPath.row]];
    [cell.titleLabel setText:_titleArray[indexPath.row]];
    [cell.subTitleLabel setHidden:indexPath.row!=0];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MenuHeader *header = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header.nameLabel setText:[ToolUtils sharedInstance].username];
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
