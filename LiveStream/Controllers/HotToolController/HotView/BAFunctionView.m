//
//  BAFunctionView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAFunctionView.h"

@implementation BAFunctionView
{
    ImageClickBlock clickBlock;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadViews];
    }
    return self;
}

- (void)loadViews {
    NSArray *imageArr = @[@"home_huisheng", @"home_mAlbum", @"home_transition", @"home_eAlbum"];
    CGRect imageFrame;
    for (int i=0; i<4; i++) {
        if (i == 0) {
            imageFrame = RECT(15, 2, (SCREEN_WIDTH-30)/6*4-15-2.5, 70*SCREEN_SCALE);
        } else if (i == 1) {
            imageFrame = RECT((SCREEN_WIDTH-30)/6*4+2.5, 2, (SCREEN_WIDTH-30)/6*2+12.5, 70*SCREEN_SCALE);
        } else if (i == 2) {
            imageFrame = RECT(15, 88, SCREEN_WIDTH/2-15-2.5, 70*SCREEN_SCALE);
        } else {
            imageFrame = RECT(SCREEN_WIDTH/2+2.5, 88, SCREEN_WIDTH/2-15-2.5, 70*SCREEN_SCALE);
        }
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imageBtn.frame = imageFrame;
        imageBtn.tag = 20 + i;
        [imageBtn setBackgroundImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [imageBtn addTarget:self action:@selector(imageClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:imageBtn];
    }
    
}

- (void)setClickBlock:(ImageClickBlock)block {
    clickBlock = [block copy];
}

- (void)imageClicked:(UIButton *)sender {
    if (clickBlock) {
        clickBlock((int)sender.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
