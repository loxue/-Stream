//
//  BAUserTipView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock)(int index);

@interface BAUserTipView : UIView

- (instancetype)initWithFrame:(CGRect)frame buttonCount:(int)buttonCount;
- (void)setClickBlock:(ClickBlock)block;

@end
