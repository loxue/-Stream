//
//  BAModifyView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonClickBlock)(int index);

@interface BAModifyView : UIView

- (instancetype)initWithFrame:(CGRect)frame buttonCount:(int)buttonCount;
- (void)setClickBlock:(ButtonClickBlock)block;

@end
