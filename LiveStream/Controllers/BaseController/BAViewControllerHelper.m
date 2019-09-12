//
//  BAViewControllerHelper.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/11.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAViewControllerHelper.h"
#import "HotToolController.h"
#import "VideoEditorController.h"
#import "SettingController.h"

@implementation BAViewControllerHelper

+ (RDVTabBarController *)createTabBarController {
    /** navcontroller */
    HotToolController *hotVC = [[HotToolController alloc] init];
    hotVC.title = @"热门工具";
    BANavigationController *hotNav = [[BANavigationController alloc] initWithRootViewController:hotVC];
    
    VideoEditorController *veditorVC = [[VideoEditorController alloc] init];
    veditorVC.title = @"视频编辑";
    BANavigationController *veditorNav = [[BANavigationController alloc] initWithRootViewController:veditorVC];
    
    SettingController *settingVC = [[SettingController alloc] init];
    settingVC.title = @"设置";
    BANavigationController *settingNav = [[BANavigationController alloc] initWithRootViewController:settingVC];
    
    /** tabbarcontroller */
    RDVTabBarController *tabBarVC = [[RDVTabBarController alloc] init];
    RDVTabBar *tabBar = tabBarVC.tabBar;
    tabBar.translucent = NO;
    tabBarVC.selectedIndex = 1;
    tabBar.backgroundView.backgroundColor = BACKGROUND_COLOR;
    
    [tabBarVC setViewControllers:@[hotNav, veditorNav, settingNav]];
    [BAViewControllerHelper tabBarForController:tabBarVC];
    
    UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5f)];
    lineView.backgroundColor = LINE_COLOR;
    lineView.tag = 1;
    [tabBarVC.tabBar addSubview:lineView];
    
    return tabBarVC;
}

+ (void)tabBarForController:(RDVTabBarController *)tabBarController {
    
    NSArray *tabBarItemImages = @[@"tab_hot", @"tab_video", @"tab_setting"];
    NSArray *tabBarItemTitles = @[@"热门工具", @"视频编辑", @"设置"];
    NSInteger index = 0;
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        item.backgroundColor = BACKGROUND_COLOR;
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:tabBarItemTitles[index]];
        item.imagePositionAdjustment = UIOffsetMake(0, -3);
        item.titlePositionAdjustment = UIOffsetMake(0, 5);
        
        item.selectedTitleAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:10],NSForegroundColorAttributeName:TABBAR_FONT_SELECT_COLOR};
        item.unselectedTitleAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:10],NSForegroundColorAttributeName: TABBAR_FONT_NORMAL_COLOR};
        item.tag = index;
        
        index++;
    }
}

@end
