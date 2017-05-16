//
//  ExController.m
//  QRCode
//
//  Created by 許天柱 on 2/26/17.
//  Copyright © 2017 Egoist. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "ExController.h"

@interface ExController()<AVCaptureMetadataOutputObjectsDelegate>//用于处理采集信息的代理
{
    AVCaptureSession *session;// 输入输出的中间桥梁
    UIView *bgModal;          // 模糊图层
    UIView *scanRectView;     // 矩形框
}
@end

@implementation ExController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *_header=[[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 50)];
    _header.text = @"QRCode";
    _header.font = [UIFont fontWithName: @"Helvetica Neue" size: 48];
    _header.textAlignment = NSTextAlignmentCenter;
    _header.textColor = [UIColor colorWithRed: 97/255.0 green: 218/255.0 blue: 251/255.0 alpha: 1];
    [self.view addSubview: _header];
    
    // new & 设置模糊图层
    bgModal = [UIView new];
    bgModal.backgroundColor = [UIColor colorWithRed: 0.0/255.0 green: 233.0/255.0 blue: 0.0/255.0 alpha: 0.5];
    [self.view addSubview: bgModal];
    
    // new 矩形框
    CGSize windowSize = [UIScreen mainScreen].bounds.size;
    CGSize scanSize = CGSizeMake(windowSize.width*3/4, windowSize.width*3/4);
    scanRectView = [UIView new];
    [self.view addSubview: scanRectView];
    scanRectView.frame = CGRectMake(0, 0, scanSize.width, scanSize.height);
    scanRectView.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    // scanRectView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed: 77.0/255.0 green:148.0/255.0 blue:237.0/255.0 alpha:1.0]);
    scanRectView.layer.borderColor = ([UIColor colorWithRed: 77.0/255.0 green:148.0/255.0 blue:237.0/255.0 alpha:1.0].CGColor);
    scanRectView.layer.borderWidth = 6;
    
    CGRect scanRect = CGRectMake((windowSize.width-scanSize.width)/2, (windowSize.height-scanSize.height)/2, scanSize.width, scanSize.height);
    NSLog(@"scanRect：( %f, %f )", scanRect.origin.x, scanRect.origin.y);
    
    // 这个CGRect参数和普通的Rect范围不太一样，它的四个值的范围都是0-1，表示比例
    // x对应的恰恰是距离左上角的垂直距离，y对应的是距离左上角的水平距离
    scanRect = CGRectMake(scanRect.origin.y/windowSize.height, scanRect.origin.x/windowSize.width, scanRect.size.height/windowSize.height,scanRect.size.width/windowSize.width);
    // NSLog(@"scanRect：( %f, %f )", scanRect.origin.x, scanRect.origin.y);
    
    // 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeVideo];
    // 创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice: device error: nil];
    // 创建输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
    // 设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // 设置矩形框
    output.rectOfInterest = scanRect;
    
    // 初始化链接对象
    session = [[AVCaptureSession alloc]init];
    // 高质量采集率
    [session setSessionPreset: AVCaptureSessionPresetHigh];
    [session addInput: input];
    [session addOutput: output];
    
    // 设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession: session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    layer.frame = self.view.layer.bounds;
    [self.view.layer insertSublayer: layer atIndex: 0];
    
    //开始捕获
    [self->session startRunning];
    
}



// 实现 delegate
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if ( (metadataObjects.count==0) )
    {
        return;
    }
    if (metadataObjects.count>0) {
        [session stopRunning];
        // AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        AVMetadataMachineReadableCodeObject * metadataObject = metadataObjects.firstObject;
        // 输出扫描字符串
        NSLog(@"本次解析内容：%@",metadataObject.stringValue);
        
        NSString * tmp = metadataObject.stringValue;
        
        if ([tmp isEqualToString: @"56;临安"]) {
            if ([_dict[@"view"] isEqualToString: @"正常报价"]) {
                tmp = @"价格：56\n产地：临安";
            } else if ([_dict[@"view"] isEqualToString: @"会员报价"]) {
                tmp = @"价格：50\n产地：临安\n生产时间：17-16-10";
            } else {
                tmp = @"价格：40\n产地：临安\n生产时间：17-16-10\n运输成本：4";
            }
        }
        
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:@"消息"
                                    message: tmp
                                    preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"继续"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self->session startRunning];
                                 
                             }];
        UIAlertAction *another = [UIAlertAction
                                  actionWithTitle:@"其余"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      [alert dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
        UIAlertAction * cancel = [UIAlertAction
                                 actionWithTitle:@"停止"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //[alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        [alert addAction:ok];
        [alert addAction:cancel];
        [alert addAction:another];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

// 实现 alert 方法
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self->session startRunning];
}
@end
