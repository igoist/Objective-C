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
    [self.view setBackgroundColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1]];
    
    UILabel *_header=[[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 50)];
    _header.text = @"QRCode";
    _header.font = [UIFont fontWithName: @"Helvetica Neue" size: 48];
    _header.textAlignment = NSTextAlignmentCenter;
    _header.textColor = [UIColor colorWithRed: 97/255.0 green: 218/255.0 blue: 251/255.0 alpha: 1];
    [self.view addSubview: _header];
    
    UILabel *_el=[[UILabel alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 20)];
    _el.text = @"this is the picker view, el psy congroo, el psy congroo";
    _el.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _el.textAlignment = NSTextAlignmentCenter;
    _el.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview:_el];
    
//    UIButton *btnRead = [[UIButton alloc] init];
//    btnRead.frame = CGRectMake(115, 200, 59, 59);
//    [btnRead setBackgroundImage: [UIImage imageNamed:@"btn01.png"] forState: UIControlStateNormal];
//    btnRead.transform = CGAffineTransformMakeRotation(M_PI / -4);
//    // [btnRead setTitle:@"Readbtn!" forState: UIControlStateNormal];
//    [btnRead addTarget: self action: @selector(actionRead) forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview: btnRead];
    // btnRead.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    
//    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(7, 13, 36, 50)];
//    paddingView.backgroundColor = [UIColor clearColor];
    
    UIButton *btnRead  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRead setFrame:CGRectMake(20, 259, self.view.frame.size.width-40, 50)];
    
    [btnRead setTitle: @"Click to pick qrcode from your album" forState: UIControlStateNormal];
    [btnRead setBackgroundColor:[UIColor colorWithRed: 51/255.0 green: 102/255.0 blue: 255/255.0 alpha: 1]];
    [btnRead setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [btnRead addTarget: self action: @selector(actionRead) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: btnRead];
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
    
    NSString *tmp = feature.messageString;
    
    if ( tmp )
    {
        if ([tmp isEqualToString: @"56;临安"]) {
            if ([_dict[@"view"] isEqualToString: @"正常报价"]) {
                tmp = @"价格：56\n产地：临安";
            } else if ([_dict[@"view"] isEqualToString: @"会员报价"]) {
                tmp = @"价格：50\n产地：临安\n生产时间：17-16-10";
            } else {
                tmp = @"价格：40\n产地：临安\n生产时间：17-16-10\n运输成本：4";
            }
        }
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: tmp preferredStyle: UIAlertControllerStyleAlert];
        [alertController addAction:cancelAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertController animated:YES completion:nil];
        });
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"调用成功" message: tmp delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
//        [alert show];
    }
}

@end
