//
//  ViewController.m
//  QRCode
//
//  Created by 許天柱 on 2/26/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVCaptureSession * session;//输入输出的中间桥梁
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
    
    //画线条
    CGMutablePathRef path = CGPathCreateMutable();
    //2-1.设置起始点
    CGPathMoveToPoint(path, NULL, 50, 50);
    //2-2.设置目标点
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    
    
    
    // 开始捕获
    //[session startRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
