//
//  TitleView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/14.
//  Copyright © 2019 intj. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame
                    headImage:(UIImage *)headImage
                    headTitle:(NSString *)headTitle {
    if (self = [super initWithFrame:frame]) {
        // 添加image
        CGFloat padding_top = 15.f;
        CGRect imageFrame = RECT(15, padding_top, 2, frame.size.height-padding_top*2);
        UIImageView *headerImg = [ViewUtility imageViewWithFrame:imageFrame contentImage:headImage];
        [self addSubview:headerImg];
        
        // 添加title
        CGRect titleFrame = RECT(MAX_X(headerImg.frame)+padding_top-8, padding_top, SCREEN_WIDTH-MAX_X(headerImg.frame)-padding_top, frame.size.height-padding_top*2);
        UILabel *headerTitle = [ViewUtility lableWithFrame:titleFrame labelText:headTitle labelColor:BUTTON_TITLE_COLOR labelFont:BUTTON_FONT_SIZE labelAlignment:NSTextAlignmentLeft];
        [self addSubview:headerTitle];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
