//
//  AppDelegate.h
//  QRCode
//
//  Created by 許天柱 on 2/26/17.
//  Copyright © 2017 Egoist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//@property (strong, nonatomic) UIImageView *splashView;
@property (strong, nonatomic) UIView *splashView;
//@property (strong, nonatomic) UIView *windowBackground;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

