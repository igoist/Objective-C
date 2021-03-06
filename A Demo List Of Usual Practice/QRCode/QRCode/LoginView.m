//
//  LoginView.m
//  QRCode
//
//  Created by 許天柱 on 3/1/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "loginView.h"
#import "AppDelegate.h"
#import "ExController.h"
#import "Picker.h"
#import "Generator.h"
#import "UserInfo.h"


@interface LoginView()


@end

@implementation LoginView

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
    
    _el=[[UILabel alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 20)];
    _el.text = @"first login view, el psy congroo, el psy congroo";
    _el.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _el.textAlignment = NSTextAlignmentCenter;
    _el.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview:_el];
    
    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView.backgroundColor = [UIColor clearColor];
    UILabel *paddingView2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    paddingView2.backgroundColor = [UIColor clearColor];
    
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
    
    [_loginButton setTitle: @"Login" forState: UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed: 51/255.0 green: 102/255.0 blue: 255/255.0 alpha: 1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
//    _loginButton.showsTouchWhenHighlighted = YES;
    [_loginButton addTarget: self action: @selector(handleLogin:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: _loginButton];
    
    _iCopyRight = [[UILabel alloc] initWithFrame:CGRectMake(20, copyRightPostition, self.view.frame.size.width-40, 50)];
    _iCopyRight.text = @"Copyright © 2017 Igoist Inc.";
    _iCopyRight.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    _iCopyRight.textAlignment = NSTextAlignmentCenter;
    _iCopyRight.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    [self.view addSubview: _iCopyRight];
}



- (void)handleLogin: (UIButton *)btn {
//    NSString *webPath=[NSString stringWithFormat:@"http://127.0.0.1:8000/qrcode/api_user/name=%@&pass=%@", @"xxx", @"dd"];
    NSString *webPath=[NSString stringWithFormat: @"http://192.168.1.107:8000/qrcode/api_user/"];
//    NSString *webPath=[NSString stringWithFormat: @"http://127.0.0.1:8000/qrcode/api_user/"];
//    webPath = [webPath stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet]; //url不允许为中文等特殊字符，需要进行字符串的转码为URL字符串，例如空格转换后为“%20”；
    NSURL *url=[NSURL URLWithString: webPath];
    NSURLRequest  *request = [NSURLRequest requestWithURL:url];
    
    static int flag  = 0;
    NSURLSessionDataTask *task=[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dicts;
        NSLog(@"enter task");
        @try {
            NSLog(@"enter localhost");
            dicts = [NSJSONSerialization JSONObjectWithData: data options: 0 error: nil];
            NSLog(@"%@", dicts);
            NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            NSLog(@"%@", result);
        } @catch (NSException *exception) {
            NSLog(@"just local data");
            dicts = @{
                @"dic1": @{
                    @"index": @0,
                    @"name": @"avvxtz",
                    @"passwd": @"111111",
                    @"tp": @"用户",
                    @"v": @"会员报价"
                },
                @"dic3": @{
                    @"index": @2,
                    @"name": @"egoist",
                    @"passwd": @"111111",
                    @"tp": @"管理员",
                    @"v": @"内部报价"
                },
                @"dic2": @{
                    @"index": @1,
                    @"name": @"avvxtz1",
                    @"passwd": @"111112",
                    @"tp": @"用户",
                    @"v": @"正常报价"
                }
            };
//            NSData *data2 = [@"[{'passwd': '111111', 'index': 0, 'name': 'egoist', 'tp': '\u7ba1\u7406\u5458', 'v': '\u5185\u90e8\u62a5\u4ef7'}, {'passwd': '111112', 'index': 1, 'name': 'avvxtz1', 'tp': '\u7528\u6237', 'v': '\u4f1a\u5458\u62a5\u4ef7'}, {'passwd': '111111', 'index': 2, 'name': 'avvxtz', 'tp': '\u7528\u6237', 'v': '\u6b63\u5e38\u62a5\u4ef7'}]" dataUsingEncoding:NSUTF8StringEncoding];

//            NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                         @0, @"index",
//                                  @"egoist", @"name",
//                                  @"111111", @"passwd",
//                                  @"管理员",    @"tp",
//                                  @"内部报价", @"v", nil];
//            NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                  @0, @"index",
//                                  @"avvxtz1", @"name",
//                                  @"111112", @"passwd",
//                                  @"用户",    @"tp",
//                                  @"会员报价", @"v", nil];
//            NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                  @0, @"index",
//                                  @"avvxtz", @"name",
//                                  @"111111", @"passwd",
//                                  @"用户",    @"tp",
//                                  @"正常报价", @"v", nil];
//            NSMutableArray *aArr = [NSMutableArray arrayWithObjects: dic1,nil];
//            dicts = [NSMutableArray array];
//            [dicts addObject: aArr];
//            aArr = [NSMutableArray arrayWithObjects: dic2,nil];
//            [dicts addObject: aArr];
//            aArr = [NSMutableArray arrayWithObjects: dic3,nil];
//            [dicts addObject: aArr];
            NSLog(@"what happened %@", dicts);
//            NSLog(@"what happened %@", data2);
//            NSLog(@"what happened %@", error);
            
           
        }
//        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
        NSString * message = @"";
        if ([_account.text isEqual: @""]) {
            flag = 9;
        }
        if (flag != 9) {
            for (NSDictionary *dict in dicts) {
                NSLog(@"%@", dict);
              // 太恶心了，变量类型的事情后面再纠结，演示时候将上面两行还有上面webPath换成本地，uncommend下面四行
//            for (NSString *key in dicts) {
//                NSLog(@"%@", dicts[key]);
//                NSDictionary *dict = dicts[key];
//                NSLog(@"%@", dict[@"name"]);
                if ([dict[@"name"] isEqual: _account.text]) {
                    if ([dict[@"passwd"] isEqual: _password.text]) {
                        NSLog(@"密码正确：%@", dict[@"passwd"]);
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            UITabBarController *tab = [UITabBarController new];
                            UserInfo *vc1 = [UserInfo new];
                            vc1.dict = @{
                                @"ind": dict[@"index"],
                                @"account": dict[@"name"],
                                @"type": dict[@"tp"],
                                @"view": dict[@"v"]
                            };
                            
                            vc1.tabBarItem.title = @"用户";
                            vc1.tabBarItem.image = [UIImage imageNamed:@"icon2_24dp"];
                            
                            Picker *vc2 = [Picker new];
                            ExController *vc4 = [ExController new];
                            vc2.tabBarItem.title = @"读取";
                            vc2.tabBarItem.image = [UIImage imageNamed:@"icon3_24dp"];
                            vc2.dict = @{
                                 @"ind": dict[@"index"],
                                 @"account": dict[@"name"],
                                 @"type": dict[@"tp"],
                                 @"view": dict[@"v"]
                             };
                            
                            vc4.dict = @{
                                @"ind": dict[@"index"],
                                @"account": dict[@"name"],
                                @"type": dict[@"tp"],
                                @"view": dict[@"v"]
                            };
                            
                            vc4.tabBarItem.title = @"扫描";
                            vc4.tabBarItem.image = [UIImage imageNamed:@"icon1_24dp"];
                            
                            if ([dict[@"tp"] isEqualToString: @"用户"]) {
                                tab.viewControllers = @[vc2, vc4, vc1];
                            } else {
                                UIViewController *vc3 = [Generator new];
                                vc3.tabBarItem.title = @"生成";
                                vc3.tabBarItem.image = [UIImage imageNamed:@"icon5_24dp"];
                                tab.viewControllers = @[vc2, vc4, vc3, vc1];
                            }
                            [self presentViewController:tab animated:YES completion:nil];
                        });
                        return;
                    } else if ([_password.text isEqual: @""]) {
                        NSLog(@"Yes ---:%@", _password.text);
                        flag = 2;
                        break;
                    } else {
                        flag = 1;
                        break;
                    }
                }
                flag = 8;
            }
        }
        if (flag > 0) {
            switch (flag) {
                case 9:
                    message = @"请输入用户名";
                    break;
                case 8:
                    message = @"用户名不存在";
                    break;
                case 2:
                    message = @"请输入密码";
                    break;
                case 1:
                    message = @"密码错误";
                    break;
                default:
                    NSLog(@"%d", flag);
                    break;
            }
            flag = 0;
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            }];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: message preferredStyle: UIAlertControllerStyleAlert];
            [alertController addAction:cancelAction];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
        }
    }];
    
    [task resume];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
