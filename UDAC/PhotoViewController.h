//
//  PhotoViewController.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-10-9.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UIActionSheetDelegate , UINavigationControllerDelegate ,UIImagePickerControllerDelegate>
{
    NSInteger selectedIndex;
}
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *photoArray;
@property (nonatomic , strong) NSArray *nameArray;
@property (nonatomic , copy) void (^setPhotoBlock)();
@end
