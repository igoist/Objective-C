//
//  ViewController.h
//  Test
//
//  Created by 許天柱 on 5/15/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldBackground.h"

@interface ViewController : UIViewController

@property (nonatomic,strong) UILabel *header;
@property (nonatomic,strong) UILabel *el;
@property (nonatomic,strong) TextFieldBackground *background;
@property (nonatomic,strong) UITextField *account;
@property (nonatomic,strong) UITextField *password;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UILabel *iCopyRight;

@end

