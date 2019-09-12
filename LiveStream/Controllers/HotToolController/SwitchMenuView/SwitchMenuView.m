//
//  SwitchMenuView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/17.
//  Copyright © 2019 intj. All rights reserved.
//

#import "SwitchMenuView.h"

@implementation SwitchMenuView
{
    UILabel *titleLabel;
    UIView *scrollBar;
    
    ClickBlock clickBlock;
}

- (instancetype)initWithFrame:(CGRect)frame
                   itemCounts:(NSArray *)itemCounts {
    if (self = [super initWithFrame:frame]) {
        //初始化配置
        [self loadItemViews:itemCounts];
    }
    return self;
}

- (void)loadItemViews:(NSArray *)itemsView {
    // add ges
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    
    // add text
    for (int i=0; i<itemsView.count; i++) {
        CGRect rect = RECT(0, 0, 100, 40);
        titleLabel = [ViewUtility lableWithFrame:rect
                                       labelText:itemsView[i]
                                      labelColor:NAVI_TITLE_COLOR
                                       labelFont:NAVITITLE_FONT_SIZE
                                  labelAlignment:NSTextAlignmentCenter];
        titleLabel.userInteractionEnabled = YES;
        titleLabel.tag = 80+i;
        [titleLabel addGestureRecognizer:tapGes];
        [self addSubview:titleLabel];
    }
    
    // add line
    CGFloat padding = 6.f;
    UIView *lineView = [[UIView alloc] initWithFrame:RECT(0, MAX_Y(titleLabel.frame)+8, SCREEN_WIDTH/itemsView.count-2*padding, 2)];
    lineView.backgroundColor = SCROLLBAR_COLOR;
    [self addSubview:lineView];
    
}

- (void)setClickBlock:(ClickBlock)block {
    clickBlock = [block copy];
}

- (void)clicked:(UILabel *)sender {
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
