//
//  AppDelegate.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

API_AVAILABLE(ios(10.0))
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RDVTabBarController *tabBarController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

