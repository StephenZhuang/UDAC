//
//  UIViewController+TitleView.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "UIViewController+TitleView.h"
#import "TitleView.h"

@implementation UIViewController (TitleView)
- (void)addTitleView:(NSString *)title subTitle:(NSString *)subTitle
{
    TitleView *titleView = [[[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:self options:nil] firstObject];
    [titleView setTitle:title];
    [titleView setSubTitle:subTitle];
    self.navigationItem.titleView = titleView;
    [self addBackButton];
}

- (void)addBackButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
    UIImage *image = [[UIImage imageNamed:@"back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
    item.tintColor = [UIColor whiteColor];
    [item setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = item;
}

- (void)setExtrueLineHidden:(UITableView *)tableView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.tableFooterView = view;
}
@end
