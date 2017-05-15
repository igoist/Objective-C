//
//  ViewController.m
//  Test
//
//  Created by 許天柱 on 5/15/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    const int inputPostition = 230;
    const int copyRightPostition = 480;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1]];
    
    _background=[[TextFieldBackground alloc] initWithFrame:CGRectMake(20, inputPostition, self.view.frame.size.width-40, 100)];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setMasksToBounds:YES];
    
    [self.view addSubview:_background];
    
    _header=[[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 50)];
    _header.text = @"QRCode";
    _header.font = [UIFont fontWithName:@"Helvetica Neue" size: 48];
    _header.textAlignment = NSTextAlignmentCenter;
    _header.textColor = [UIColor colorWithRed: 97/255.0 green: 218/255.0 blue: 251/255.0 alpha: 1];
    [self.view addSubview:_header];
    
    _el=[[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width-40, 20)];
    _el.text = @"first login view, el psy congroo, el psy congroo";
    _el.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _el.textAlignment = NSTextAlignmentCenter;
    _el.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview:_el];

    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView.backgroundColor = [UIColor clearColor];
    UILabel *paddingView2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView.backgroundColor = [UIColor clearColor];
    
    _account=[[UITextField alloc] initWithFrame:CGRectMake(20, inputPostition, self.view.frame.size.width-40, 50)];
    _account.backgroundColor=[UIColor whiteColor];
    _account.placeholder=[NSString stringWithFormat:@"Account"];
    _account.layer.cornerRadius=5.0;
    _account.leftView = paddingView;
    _account.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_account];
    
    _password=[[UITextField alloc] initWithFrame:CGRectMake(20, inputPostition + 60, self.view.frame.size.width-40, 50)];
    _password.backgroundColor=[UIColor whiteColor];
    _password.placeholder=[NSString stringWithFormat:@"Password"];
    _password.secureTextEntry = true;
    _password.leftView = paddingView2;
    _password.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_password];
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, inputPostition + 60 * 2, self.view.frame.size.width-40, 50)];
    
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    
    _iCopyRight = [[UILabel alloc] initWithFrame:CGRectMake(20, copyRightPostition, self.view.frame.size.width-40, 50)];
    _iCopyRight.text = @"Copyright © 2017 Igoist Inc.";
    _iCopyRight.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _iCopyRight.textAlignment = NSTextAlignmentCenter;
    _iCopyRight.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview: _iCopyRight];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
