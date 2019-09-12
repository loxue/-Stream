//
//  BAUserTipView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAUserTipView.h"

@implementation BAUserTipView
{
    ClickBlock clickBlock;
}

- (instancetype)initWithFrame:(CGRect)frame buttonCount:(int)buttonCount {
    if (self = [super initWithFrame:frame]) {
        [self loadViewsWithCount:buttonCount];
    }
    return self;
}

- (void)loadViewsWithCount:(int)count {
    if (count < 5) {
        NSArray *titleArr = @[@"素材库", @"足迹", @"草稿箱", @"用户手册"];
        NSArray *imageArr = @[@"home_material", @"home_history", @"home_stuido", @"home_manual"];
        for (int i=0; i<count; i++) {
            CGRect btnFrame = RECT((SCREEN_WIDTH-30)/4*i+15, 0, (SCREEN_WIDTH-30)/4, (SCREEN_WIDTH-30)/4);
            UIButton *btn = [ViewUtility buttonWithFrame:btnFrame
                                             buttonTitle:titleArr[i]
                                         buttonTitleFont:BUTTON_FONT_SIZE
                                        buttonTitleColor:BUTTON_TITLE_COLOR
                                             buttonImage:[UIImage imageNamed:imageArr[i]]
                                   buttonBackgroundImage:[UIImage imageNamed:@""]
                                buttonTitleAndImageStyle:BAButtonImageStyleTop
                                 buttonTitleToImageSpace:10.f
                                ];
            
            btn.tag = 10+i;
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
}

- (void)setClickBlock:(ClickBlock)block {
    clickBlock = [block copy];
}

- (void)btnClicked:(UIButton *)sender {
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
