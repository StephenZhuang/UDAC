//
//  MenuViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UICollectionViewDataSource ,UICollectionViewDelegate>
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@end