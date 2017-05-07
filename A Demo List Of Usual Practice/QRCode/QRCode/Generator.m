//
//  Generator.m
//  QRCode
//
//  Created by 許天柱 on 5/7/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Generator.h"


@interface Generator() 

@property (nonatomic, strong) UITextField *tfCode;
@property (nonatomic, strong) UIButton *btnGenerate;
@property (nonatomic, strong) UIImageView *imageView;

@end



@implementation Generator

- (void) viewDidLoad {
    [super viewDidLoad];
    
    CGSize windowSize = [UIScreen mainScreen].bounds.size;
    
    self.tfCode = [[UITextField alloc] initWithFrame: CGRectMake(10, 30, windowSize.width - 100, 40)];
    [self.view addSubview: self.tfCode];
    self.tfCode.borderStyle = UITextBorderStyleRoundedRect;
    
    self.btnGenerate = [[UIButton alloc] initWithFrame: CGRectMake(windowSize.width - 100, 30, 90, 40)];
    [self.view addSubview: self.btnGenerate];
    [self.btnGenerate addTarget: self action: @selector(actionGenerate) forControlEvents: UIControlEventTouchUpInside];
    self.btnGenerate.backgroundColor = [UIColor lightGrayColor];
    [self.btnGenerate setTitle: @"生成" forState: UIControlStateNormal];
    [self.btnGenerate setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    
    self.imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 300, 300)];
    [self.view addSubview: self.imageView];
    self.imageView.center = CGPointMake(windowSize.width/2, windowSize.height/2);
    
    self.tfCode.text = @"http://adad184.com";
}

- (void)actionGenerate
{
    NSString *text = self.tfCode.text;
    
    NSData *stringData = [text dataUsingEncoding: NSUTF8StringEncoding];
    
    //生成
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    UIColor *onColor = [UIColor blackColor];
    UIColor *offColor = [UIColor whiteColor];
    
    //上色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage",qrFilter.outputImage,
                             @"inputColor0",[CIColor colorWithCGColor:onColor.CGColor],
                             @"inputColor1",[CIColor colorWithCGColor:offColor.CGColor],
                             nil];
    
    CIImage *qrImage = colorFilter.outputImage;
    
    //绘制
    CGSize size = CGSizeMake(300, 300);
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRelease(cgImage);
    
    self.imageView.image = codeImage;
}

@end

