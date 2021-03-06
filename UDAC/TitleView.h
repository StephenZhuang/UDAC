//
//  TitleView.h
//  MobileNJU
//
//  Created by Stephen Zhuang on 14-5-6.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property (nonatomic , weak) IBOutlet UILabel *titleLabel;
@property (nonatomic , weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic , strong) NSString* title;
@property (weak , nonatomic) IBOutlet UIView *touchView;
@property (nonatomic , strong) NSString* subTitle;
@end
