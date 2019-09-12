//
//  BaseViewController.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/22.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+BABarButtonItem.h"
#import "BABarButtonItem.h"
#import "BANavigationController.h"
#import "BANavigationBar.h"

@interface BaseViewController : UIViewController

- (void)createFields;
- (void)destroyFields;

- (void)createEvents;
- (void)destroyEvents;

- (void)createViews;
- (void)destroyViews;

- (void)loadData;

- (void)addBackBarButtonItem;

- (void)addNormalBackButton;

- (void)setNavBarTintColor:(UIColor*)color;

- (void)setNavBarHidden:(BOOL)hidden;

- (void)showNullViewWithImage:(NSString *)imageName content:(NSString *)content hasTabBar:(BOOL)hasTabBar;

- (void)updateWhenDidAppearHandler;

@end
