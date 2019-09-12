//
//  SettingHeaderView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "SettingHeaderView.h"

@implementation SettingHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    [self addSubview:self.headerImg];
    [self addSubview:self.headerVersion];
    [self addSubview:self.headerInfo];
}

#pragma mark - setter and getter

- (UIImageView *)headerImg {
    if (_headerImg == nil) {
        UIImage *image = [UIImage imageNamed:@"setting_icon"];
        _headerImg = [ViewUtility imageViewWithFrame:RECT(SCREEN_WIDTH/2-30, 0, 60, 60) contentImage:image];
    }
    return _headerImg;
}

- (UILabel *)headerVersion {
    if (_headerVersion == nil) {
        _headerVersion = [ViewUtility lableWithFrame:RECT(0, MAX_Y(self.headerImg.frame)+10, SCREEN_WIDTH, 20)
                                           labelText:[NSString stringWithFormat:@"%@", APP_VERSION]
                                          labelColor:FOOTER_VIEW_TITLECOLOR
                                           labelFont:ITEM_FONT_SIZE
                                      labelAlignment:NSTextAlignmentCenter];
    }
    return _headerVersion;
}

- (UILabel *)headerInfo {
    if (_headerInfo == nil) {
        _headerInfo = [ViewUtility lableWithFrame:RECT(20, MAX_Y(self.headerVersion.frame)+10, SCREEN_WIDTH-40, 100)
                                           labelText:@"一个对音视频开发比较感兴趣的iOSer，工程代码基于IJKPlayer、GPUImage框架之上进行了二次开发,还未开发完，后续会陆续补充上所有功能。写这个的目的仅为了学习，并无商业用途。感兴趣想进一步交流的同学可关注\n个人博客：https://borago.top\n个人github：https://github.com/loxue\nQQ交流群：802051297"
                                          labelColor:FOOTER_VIEW_TITLECOLOR
                                           labelFont:ITEM_FONT_SIZE
                                      labelAlignment:NSTextAlignmentLeft];
        _headerInfo.numberOfLines = 0;
    }
    return _headerInfo;
}


@end
