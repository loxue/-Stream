//
//  BANavigationController.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/31.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BANavigationController : UINavigationController <UIGestureRecognizerDelegate>

@property (nonatomic,assign) BOOL canDragBack;

@end

NS_ASSUME_NONNULL_END
