//
//  UIViewController+TitleView.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TitleView)
- (void)addTitleView:(NSString *)title subTitle:(NSString *)subTitle;
- (void)addBackButton;
- (void)setExtrueLineHidden:(UITableView *)tableView;
@end
