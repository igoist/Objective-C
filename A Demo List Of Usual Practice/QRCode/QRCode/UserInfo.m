//
//  UserInfo.m
//  QRCode
//
//  Created by 許天柱 on 5/15/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo()


@end

@implementation UserInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1]];
    
    UILabel *_header=[[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 50)];
    _header.text = @"QRCode";
    _header.font = [UIFont fontWithName: @"Helvetica Neue" size: 48];
    _header.textAlignment = NSTextAlignmentCenter;
    _header.textColor = [UIColor colorWithRed: 97/255.0 green: 218/255.0 blue: 251/255.0 alpha: 1];
    [self.view addSubview: _header];
    
    UILabel *_el=[[UILabel alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 20)];
    _el.text = @"this is setting view, el psy congroo, el psy congroo";
    _el.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _el.textAlignment = NSTextAlignmentCenter;
    _el.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview:_el];
    
    int initialHeight = 220;
    int growHeight = 50;
    int widthMinus = 100;
    int deltaY = 7;
    
    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView.backgroundColor = [UIColor clearColor];
    UILabel *paddingView2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView2.backgroundColor = [UIColor clearColor];
    UILabel *paddingView3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView3.backgroundColor = [UIColor clearColor];
    UILabel *paddingView4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView4.backgroundColor = [UIColor clearColor];
    
    
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, initialHeight, 60, 18)];
    _indexLabel.text = @"Index：";
    _indexLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _indexLabel.textAlignment = NSTextAlignmentRight;
    _indexLabel.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview:_indexLabel];
    
//    NSLog(@"%@", self.dict);
    _index = [[UITextField alloc] initWithFrame:CGRectMake(80, initialHeight - deltaY, self.view.frame.size.width-widthMinus, 32)];
    _index.enabled = NO;
    _index.text = [@"No.58260" stringByAppendingString: [NSString stringWithFormat:@"%@", _dict[@"ind"]]];
    _index.backgroundColor = [UIColor whiteColor];
    _index.placeholder = [NSString stringWithFormat:@"index"];
    _index.layer.cornerRadius = 5.0;
    _index.textColor = [UIColor colorWithRed: 0/255.0 green: 0/255.0 blue: 0/255.0 alpha: 0.65];
    _index.leftView = paddingView;
    _index.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: _index];
    
    _accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, initialHeight + growHeight * 1, 60, 18)];
    _accountLabel.text = @"Account：";
    _accountLabel.font = [UIFont fontWithName: @"Helvetica Neue" size: 12];
    _accountLabel.textAlignment = NSTextAlignmentRight;
    _accountLabel.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview: _accountLabel];
    
    _account = [[UITextField alloc] initWithFrame:CGRectMake(80, initialHeight + growHeight * 1 - deltaY, self.view.frame.size.width-widthMinus, 32)];
    _account.enabled = NO;
//    _account.text = @"avvxtz";
    _account.text = _dict[@"account"];
    _account.backgroundColor = [UIColor whiteColor];
    _account.placeholder = [NSString stringWithFormat: @"account"];
    _account.layer.cornerRadius = 5.0;
    _account.textColor = [UIColor colorWithRed: 0/255.0 green: 0/255.0 blue: 0/255.0 alpha: 0.65];
    _account.leftView = paddingView2;
    _account.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: _account];
    
    _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, initialHeight + growHeight * 2, 60, 18)];
    _typeLabel.text = @"Type：";
    _typeLabel.font = [UIFont fontWithName: @"Helvetica Neue" size: 12];
    _typeLabel.textAlignment = NSTextAlignmentRight;
    _typeLabel.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview: _typeLabel];
    
    _type = [[UITextField alloc] initWithFrame:CGRectMake(80, initialHeight + growHeight * 2 - deltaY, self.view.frame.size.width-widthMinus, 32)];
    _type.enabled = NO;
    if ([_dict[@"type"] isEqualToString: @"用户"]) {
        _type.text = @"normal user";
    } else {
        _type.text = @"administrator";
    }
    _type.backgroundColor = [UIColor whiteColor];
    _type.placeholder = [NSString stringWithFormat: @"type"];
    _type.layer.cornerRadius = 5.0;
    _type.textColor = [UIColor colorWithRed: 0/255.0 green: 0/255.0 blue: 0/255.0 alpha: 0.65];
    _type.leftView = paddingView3;
    _type.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: _type];
    
    _vieLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, initialHeight + growHeight * 3, 60, 18)];
    _vieLabel.text = @"View：";
    _vieLabel.font = [UIFont fontWithName: @"Helvetica Neue" size: 12];
    _vieLabel.textAlignment = NSTextAlignmentRight;
    _vieLabel.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview: _vieLabel];
    
    _vie = [[UITextField alloc] initWithFrame:CGRectMake(80, initialHeight + growHeight * 3 - deltaY, self.view.frame.size.width-widthMinus, 32)];
    _vie.enabled = NO;
//    _vie.text = @"normal view";
    _vie.text = _dict[@"view"];
    _vie.backgroundColor = [UIColor whiteColor];
    _vie.placeholder = [NSString stringWithFormat: @"type"];
    _vie.layer.cornerRadius = 5.0;
    _vie.textColor = [UIColor colorWithRed: 0/255.0 green: 0/255.0 blue: 0/255.0 alpha: 0.65];
    _vie.leftView = paddingView4;
    _vie.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: _vie];

    
    _logoutButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [_logoutButton setFrame:CGRectMake(20, initialHeight + growHeight * 4.5, self.view.frame.size.width-40, 50)];
    [_logoutButton setTitle: @"Logout" forState: UIControlStateNormal];
    [_logoutButton setBackgroundColor:[UIColor colorWithRed: 51/255.0 green: 102/255.0 blue: 255/255.0 alpha: 1]];
    [_logoutButton setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
//    [_logoutButton addTarget: self action: @selector(handleLogin:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: _logoutButton];
}

@end
