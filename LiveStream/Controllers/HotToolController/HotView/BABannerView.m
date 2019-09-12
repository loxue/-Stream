//
//  BABannerView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/12.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BABannerView.h"

@implementation BABannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = BACKGROUND_COLOR;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    // 添加header
    UILabel *hiLabel = [ViewUtility lableWithFrame:RECT(15, 0, SCREEN_WIDTH-15*2, 70)
                                         labelText:@"Hi,欢迎你的使用"
                                        labelColor:HEADER_TITLE_COLOR
                                         labelFont:HEADER_FONT_SIZE
                                    labelAlignment:NSTextAlignmentLeft];
    [self addSubview:hiLabel];
    
    self.lineView = [[UIView alloc] initWithFrame:RECT(MIN_X(hiLabel.frame),
                                                          MAX_Y(hiLabel.frame), SCREEN_WIDTH-2*(MIN_X(hiLabel.frame)),
                                                          1.f)];
    self.lineView.backgroundColor = LINE_COLOR;
    [self addSubview:self.lineView];
    
    // 添加banner
    [self addSubview:self.banner];
}

- (KNBannerView *)banner {
    if (_banner == nil) {
        NSArray *imgArr = @[@"video_banner_img"];
        _banner = [KNBannerView bannerViewWithLocationImagesArr:imgArr frame:RECT(MIN_X(self.lineView.frame), MAX_Y(self.lineView.frame)+16, SCREEN_WIDTH-30, SCREEN_SCALE*150)];
    }
    return _banner;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
