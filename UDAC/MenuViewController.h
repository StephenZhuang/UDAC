//
//  MenuViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UICollectionViewDataSource ,UICollectionViewDelegate>
{
    float jifen;
}
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic , strong) NSArray *colorArray;
@property (nonatomic , strong) NSMutableArray *titleArray;
@property (nonatomic , strong) QueryJlJECount *queryJlJECount;
@end
