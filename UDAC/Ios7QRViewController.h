//
//  Ios7QRViewController.h
//  MallTemplate
//
//  Created by Stephen Zhuang on 14-4-8.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^ScanBlock)(NSString *code);

@interface Ios7QRViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, retain) UIImageView *line;
@property (nonatomic , copy) ScanBlock scanBlock;
@end
