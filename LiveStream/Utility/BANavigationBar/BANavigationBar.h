//
//  BANavigationBar.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/31.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BANavigationBar : UINavigationBar

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors;
- (void)initBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha;
- (void)setBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
