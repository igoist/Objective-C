//
//  AppDelegate.m
//  QRCode
//
//  Created by 許天柱 on 2/26/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginView.h"
//#import "ExController.h"
//#import "Picker.h"
//#import "Generator.h"
#import "UserInfo.h"

@interface AppDelegate ()



@end

@implementation AppDelegate

@synthesize splashView;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    UITabBarController *tab = [UITabBarController new];
//    UIViewController *vc2 = [Picker new];
//    UIViewController *vc3 = [Generator new];
//    UIViewController *vc4 = [ExController new];
//    UIViewController *vc1 = [UserInfo new];
//    LoginView *vc5 = [LoginView new];
//
//    vc2.tabBarItem.title = @"读取";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"icon3_24dp"];
//    vc3.tabBarItem.title = @"生成";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"icon1_24dp"];
//    vc4.tabBarItem.title = @"扫描";
//    vc4.tabBarItem.image = [UIImage imageNamed:@"icon1_24dp"];
//    vc1.tabBarItem.title = @"管理";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"icon2_24dp"];
//    
//    vc5.tabBarItem.title = @"管理";
//    vc5.tabBarItem.image = [UIImage imageNamed:@"icon2_24dp"];
//    
//    tab.view.backgroundColor = [UIColor whiteColor];
//    
//    tab.viewControllers = @[vc2,vc3, vc4, vc1, vc5];
//    
//    self.window.rootViewController = tab;
    
    [self.window makeKeyAndVisible];
    
    splashView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 320, 568)];
    splashView.backgroundColor = [UIColor colorWithRed: 34.0/255.0 green: 34.0/255.0 blue: 34.0/255.0 alpha: 1.0];
    
    [self.window addSubview: splashView];
    [self.window bringSubviewToFront: splashView];
    
    [self performSelector: @selector(textEnter) withObject: nil afterDelay: 0.8f];
    [self performSelector: @selector(iconEnter) withObject: nil afterDelay: 0.0f];
    [self performSelector: @selector(leavePrepare) withObject: nil afterDelay: 5.3f];
    [self performSelector: @selector(leave) withObject: nil afterDelay: 5.66f];
    
    //设置动画效果
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration: 10.0];
//    [UIView setAnimationDelegate:self];
//    CGAffineTransform transform =CGAffineTransformMakeRotation(M_PI);
//    [_splashView setTransform:transform];
////    _splashView.alpha=0.0;
////    _splashView.frame=CGRectMake(96, 220, 128, 128);
//    [UIView commitAnimations];
    return YES;
}

-(void)iconEnter
{
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(96, 140, 128, 128)];
    icon.image = [UIImage imageNamed:@"Default"];
    [splashView addSubview:icon];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 20];
    [UIView setAnimationDelegate:self];
    CGAffineTransform transform =CGAffineTransformMakeRotation(M_PI);
    [icon setTransform:transform];
    [UIView commitAnimations];
}

-(void)textEnter
{
    UILabel *text =[[UILabel alloc] initWithFrame:CGRectMake(20, 270, 280, 20)];
    text.text = @"Welcome to QRCode";
    text.font = [UIFont fontWithName:@"Helvetica Neue" size: 18];
    text.textAlignment = NSTextAlignmentCenter;
    text.textColor = [UIColor colorWithRed: 249/255.0 green: 249/255.0 blue: 249/255.0 alpha: 1];
    text.alpha = 0;
    [splashView addSubview: text];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 2];
    [UIView setAnimationDelegate:self];
    text.alpha = 1;
    [UIView commitAnimations];
}

-(void) leavePrepare
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.4];
    [UIView setAnimationDelegate:self];
    splashView.alpha = 0;
    [UIView commitAnimations];
}

-(void) leave
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tab = [UITabBarController new];
//    UIViewController *vc2 = [Picker new];
//    UIViewController *vc3 = [Generator new];
//    UIViewController *vc4 = [ExController new];
    UIViewController *vc1 = [UserInfo new];
    LoginView *vc5 = [LoginView new];

//
//    vc2.tabBarItem.title = @"读取";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"icon3_24dp"];
//    vc3.tabBarItem.title = @"生成";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"icon1_24dp"];
//    vc4.tabBarItem.title = @"扫描";
//    vc4.tabBarItem.image = [UIImage imageNamed:@"icon1_24dp"];
    vc1.tabBarItem.title = @"管理";
    vc1.tabBarItem.image = [UIImage imageNamed:@"icon2_24dp"];

    vc5.tabBarItem.title = @"管理";
    vc5.tabBarItem.image = [UIImage imageNamed:@"icon2_24dp"];

//    tab.view.backgroundColor = [UIColor whiteColor];

//    tab.viewControllers = @[vc2,vc3, vc4, vc1, vc5];
    tab.viewControllers = @[vc1, vc5];
    
    self.window.rootViewController = vc5;
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration: 2.0];
//    [UIView setAnimationDelegate:self];
//    splashView.alpha=0.0;
//    [UIView commitAnimations];
    
    [self.window makeKeyAndVisible];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}







#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Egoist.com.QRCode" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"QRCode" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"QRCode.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
