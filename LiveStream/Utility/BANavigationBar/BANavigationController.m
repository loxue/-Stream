//
//  BANavigationController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/31.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BANavigationController.h"
#import <QuartzCore/QuartzCore.h>
#import "BANavigationBar.h"

@interface BANavigationController ()
{
    
}
@end

@implementation BANavigationController

- (void)dealloc {
    NSLog(@"BANavigationController dealloc");
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithNavigationBarClass:[BANavigationBar class] toolbarClass:nil];
    if (self) {
        self.canDragBack = YES;
        UIColor *firstColor = MASTERCOLOR;
        UIColor *secondColor = MASTERCOLOR;
        NSArray *colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
        [[BANavigationBar appearance] setBarTintGradientColors:colors];
        [[self navigationBar] setTranslucent:NO];
        self.viewControllers = @[rootViewController];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],
        NSFontAttributeName:[UIFont boldSystemFontOfSize:18.f]}];
    }
    return self;
}

- (void)setCanDragBack:(BOOL)bCanDragBack {
    if (ISIOS7LATER) {
        self.interactivePopGestureRecognizer.enabled = bCanDragBack;
    }
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (viewController == self) {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
        self.navigationController.navigationBar.alpha = 0.300;
        self.navigationController.navigationBar.translucent = YES;
    } else {
        self.navigationController.navigationBar.alpha = 1;
        self.navigationController.navigationBar.tintColor = nil;
        self.navigationController.navigationBar.translucent = NO;
    }
}

@end
