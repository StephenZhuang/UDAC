//
//  BaseTabBarController.m
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "BaseTabBarController.h"

@implementation BaseTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0) {
        [ToolUtils sharedInstance].isLogin = NO;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
@end
