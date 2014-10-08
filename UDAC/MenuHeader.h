//
//  MenuHeader.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuHeader : UICollectionReusableView
@property (nonatomic , strong) IBOutlet UILabel *nameLabel;
@property (nonatomic , strong) IBOutlet UILabel *subNameLabel;
@property (nonatomic , strong) IBOutlet UILabel *addressLabel;
@property (nonatomic , strong) IBOutlet UIImageView *logoImage;
@end
