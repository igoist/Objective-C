//
//  UserInfo.h
//  QRCode
//
//  Created by 許天柱 on 3/10/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserInfo: UIViewController

@property (nonatomic,strong) NSDictionary *dict;

@property (nonatomic,strong) UILabel *indexLabel;
@property (nonatomic,strong) UITextField *index;
@property (nonatomic,strong) UILabel *accountLabel;
@property (nonatomic,strong) UITextField *account;
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UITextField *type;
@property (nonatomic,strong) UILabel *vieLabel;
@property (nonatomic,strong) UITextField *vie;
@property (nonatomic,strong) UIButton *logoutButton;


@end

