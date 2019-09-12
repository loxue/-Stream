//
//  BANavigationBar.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/31.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BANavigationBar.h"

@interface BANavigationBar ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation BANavigationBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Init code
    }
    return self;
}

static CGFloat const kDefaultOpacity = 0.5f;

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors {
    // create the gradient layer
    if (self.gradientLayer == nil) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.opacity = self.translucent ? kDefaultOpacity : 1.0f;
    }
    
    NSMutableArray * colors = nil;
    if (barTintGradientColors != nil)
    {
        colors = [NSMutableArray arrayWithCapacity:[barTintGradientColors count]];
   
        // and add them to the colors array
        [barTintGradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIColor class]]) {
                // UIColor class
                [colors addObject:(id)[obj CGColor]];
            } else if ( CFGetTypeID( (__bridge void *)obj ) == CGColorGetTypeID() ) {
                // CGColorRef
                [colors addObject:obj];
            } else {
                // obj is not a supported type
                @throw [NSException exceptionWithName:@"BarTintGraidentColorsError" reason:@"object in barTintGradientColors array is not a UIColor or CGColorRef" userInfo:nil];
            }
        }];
        
        // make it possible for the graident to be seen for iOS 6 and iOS 7
        if ( [self respondsToSelector:@selector(setBarTintColor:)] ) {
            // iOS 7
            self.barTintColor = [UIColor clearColor];
        } else {
            // iOS 6
            self.tintColor = [UIColor clearColor];
            // stops the gradient on iOS 6 UINavigationBar
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    // set the graident colours to the laery
    self.gradientLayer.colors = colors;
}

#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // allow all layout subviews call to adjust the frame
    if ( self.gradientLayer != nil ) {
        if ( floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 ) {
            // iOS 7
            CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
            self.gradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
        } else {
            // iOS 6
            self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        }
        
        // make sure the graident layer is at position 1
        [self.layer insertSublayer:self.gradientLayer atIndex:1];
    }
}

- (void)initBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha {
    [self setBackgroundImage:[ViewUtility imageWithColor:SETTING_LIST_COLOR]

               forBarMetrics:UIBarMetricsDefault];

    self.shadowImage = [UIImage new];

    self.translucent = YES;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha {
    [self setBackgroundImage:[ViewUtility imageWithColor:SETTING_LIST_COLOR]

               forBarMetrics:UIBarMetricsDefault];

}

- (void)reset {
    [self setBackgroundImage:nil

               forBarMetrics:UIBarMetricsDefault];

}


@end
