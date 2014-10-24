//
//  MenuCell.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UICollectionViewCell
@property (nonatomic , strong) IBOutlet UILabel *titleLabel;
@property (nonatomic , strong) IBOutlet UILabel *subTitleLabel;
@property (nonatomic , strong) IBOutlet UILabel *subTitleLabel2;
@property (nonatomic , strong) IBOutlet UIImageView *logoImage;
@end
