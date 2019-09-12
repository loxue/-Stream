//
//  BAFunctionView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ImageClickBlock)(int index);

@interface BAFunctionView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setClickBlock:(ImageClickBlock)block;

@end
