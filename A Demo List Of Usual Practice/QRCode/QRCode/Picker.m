//
//  Picker.m
//  QRCode
//
//  Created by 許天柱 on 3/7/17.
//  Copyright © 2017 Egoist. All rights reserved.
//



#import "Picker.h"


@interface Picker()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end


@implementation Picker


- (void) viewDidLoad {
    // UIButton *btnRead = [UIButton buttonWithType:UIButtonTypeContactAdd];
    UIButton *btnRead = [[UIButton alloc] init];
    btnRead.frame = CGRectMake(115, 200, 59, 59);
    [btnRead setBackgroundImage: [UIImage imageNamed:@"btn01.png"] forState: UIControlStateNormal];
    btnRead.transform = CGAffineTransformMakeRotation(M_PI / -4);
    // [btnRead setTitle:@"Readbtn!" forState: UIControlStateNormal];
    [btnRead addTarget: self action: @selector(actionRead) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: btnRead];
    // btnRead.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    
}

- (void)actionRead
{
    UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
    
    photoPicker.delegate = self;
    photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    photoPicker.view.backgroundColor = [UIColor brownColor];
    [self presentViewController:photoPicker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismissed");
        NSLog(@"%@", info);
    }];
    
    UIImage * srcImage = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *image = [CIImage imageWithCGImage: srcImage.CGImage];
    NSArray *features = [detector featuresInImage: image];
    CIQRCodeFeature *feature = [features firstObject];
    
    NSString *result = feature.messageString;
    
    if ( result )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:result message:@"调用成功" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        
        [alert show];
    }
}

@end
