//
//  Ios6QRViewController.h
//  MallTemplate
//
//  Created by Stephen Zhuang on 14-4-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import "ZBarSDK.h"
#import "Ios7QRViewController.h"

@interface Ios6QRViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,ZBarReaderDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
    
}
@property (nonatomic, strong) UIImageView * line;
@property (nonatomic , copy) ScanBlock scanBlock;
@property (nonatomic , assign) BOOL isContinuous;
@end
