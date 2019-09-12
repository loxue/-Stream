//
//  VideoEditorView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "VideoEditorView.h"

@implementation VideoEditorView
{
    CGRect viewFrame;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        viewFrame = frame;
        [self loadViews];
    }
    return self;
}

- (void)loadViews {
    
    /** ++++++++++++  banner   +++++++++++ */
    UILabel *titleLabel = [ViewUtility lableWithFrame:RECT(15, 20, SCREEN_WIDTH-30, 35)
                                       labelText:@"视频剪辑"
                                      labelColor:HEADER_TITLE_COLOR
                                       labelFont:HEADER_FONT_SIZE
                                  labelAlignment:NSTextAlignmentLeft];
    [self addSubview:titleLabel];
    UILabel *smallLabel = [ViewUtility lableWithFrame:RECT(15, MAX_Y(titleLabel.frame), SCREEN_WIDTH-30, 18)
                                            labelText:@"随心所欲处理你的视频"
                                           labelColor:FOOTER_VIEW_TITLECOLOR
                                            labelFont:ITEM_FONT_SIZE
                                       labelAlignment:NSTextAlignmentLeft];
    [self addSubview:smallLabel];
    UIView *lineView = [[UIView alloc] initWithFrame:RECT(MIN_X(smallLabel.frame),
                                                          MAX_Y(smallLabel.frame)+20, SCREEN_WIDTH-2*(MIN_X(smallLabel.frame)),
                                                          1.f)];
    lineView.backgroundColor = LINE_COLOR;
    [self addSubview:lineView];
    
    // 添加引导图
    UIImageView *headerImg = [ViewUtility imageViewWithFrame:RECT(MIN_X(lineView.frame), MAX_Y(lineView.frame)+10, SCREEN_WIDTH-2*(MIN_X(lineView.frame)), 150*SCREEN_SCALE) contentImage:[UIImage imageNamed:@"video_banner_img"]];
//    headerImg.layer.contents = [ViewUtility cornerRadiusWithImage:headerImg.image
//                                                       imageFrame:headerImg.frame
//                                                     cornerRadius:8.f
//                                                       cornerType:UIRectCornerAllCorners];
    headerImg.layer.cornerRadius = 40;
    
    [self addSubview:headerImg];
    [headerImg.layer masksToBounds];
    
    
    /** ++++++++++++  video editor   +++++++++++ */
    TitleView *section_one_title = [[TitleView alloc] initWithFrame:RECT(0, MAX_Y(headerImg.frame)+15, SCREEN_WIDTH, 44) headImage:[UIImage imageNamed:@"contentview_bg"] headTitle:@"视频编辑"];
    [self addSubview:section_one_title];
    
    // 添加按钮
    CGFloat padding = 15.f;
    NSArray *videoTitleArr = @[@"视频剪辑", @"视频拼接", @"视频倒放", @"视频旋转", @"扣视频"];
    NSArray *videoImgArr = @[@"home_clip", @"home_joint", @"home_reverse", @"home_rotate", @"home_koushipin"];
    for (int i = 0; i<5; i++) {
        CGRect btnRect = RECT(padding+((SCREEN_WIDTH-padding*2)/5*i), MAX_Y(section_one_title.frame), (SCREEN_WIDTH-padding*2)/5, 80);
        UIButton *videoBtn = [ViewUtility buttonWithFrame:btnRect
                                              buttonTitle:videoTitleArr[i]
                                          buttonTitleFont:BUTTON_FONT_SIZE
                                         buttonTitleColor:TIP_TEXT_COLOR
                                              buttonImage:[UIImage imageNamed:videoImgArr[i]]
                                    buttonBackgroundImage:[UIImage imageNamed:@"0"]
                                 buttonTitleAndImageStyle:BAButtonImageStyleTop
                                  buttonTitleToImageSpace:padding];
        videoBtn.tag = 100 + i;
        [self addSubview:videoBtn];
    }
    // 添加分割线
    UIView *lineView1 = [[UIView alloc] initWithFrame:RECT(MIN_X(titleLabel.frame),
                                                          MAX_Y(section_one_title.frame)+80+5, SCREEN_WIDTH-2*(MIN_X(titleLabel.frame)),
                                                          1.f)];
    lineView1.backgroundColor = LINE_COLOR;
    [self addSubview:lineView1];
    
    
    /** ++++++++++++  audio editor   +++++++++++ */
    TitleView *section_two_title = [[TitleView alloc] initWithFrame:RECT(0, MAX_Y(lineView1.frame)+15, SCREEN_WIDTH, 44) headImage:[UIImage imageNamed:@"contentview_bg"] headTitle:@"音频编辑"];
    [self addSubview:section_two_title];
    
    // 添加按钮
    CGFloat audioPadding = 15.f;
    NSArray *audioTitleArr = @[@"背景音乐", @"提取音频", @"视频配音"];
    NSArray *audioImgArr = @[@"home_BGMusic", @"home_ext_audio", @"home_audio"];
    for (int i = 0; i<3; i++) {
        CGRect btnRect = RECT(audioPadding+((SCREEN_WIDTH-audioPadding*2)/5*i), MAX_Y(section_two_title.frame), (SCREEN_WIDTH-audioPadding*2)/5, 80);
        UIButton *audioBtn = [ViewUtility buttonWithFrame:btnRect
                                              buttonTitle:audioTitleArr[i]
                                          buttonTitleFont:BUTTON_FONT_SIZE
                                         buttonTitleColor:TIP_TEXT_COLOR
                                              buttonImage:[UIImage imageNamed:audioImgArr[i]] buttonBackgroundImage:[UIImage imageNamed:@"1"]
                                 buttonTitleAndImageStyle:BAButtonImageStyleTop
                                  buttonTitleToImageSpace:audioPadding];
        audioBtn.tag = 110 + i;
        [self addSubview:audioBtn];
    }
    // 添加分割线
    UIView *lineView2 = [[UIView alloc] initWithFrame:RECT(MIN_X(titleLabel.frame),
                                                           MAX_Y(section_two_title.frame)+80+5, SCREEN_WIDTH-2*(MIN_X(titleLabel.frame)),
                                                           1.f)];
    lineView2.backgroundColor = LINE_COLOR;
    [self addSubview:lineView2];
    
    
    /** ++++++++++++  hot editor   +++++++++++ */
    TitleView *section_three_title = [[TitleView alloc] initWithFrame:RECT(0, MAX_Y(lineView2.frame)+15, SCREEN_WIDTH, 44) headImage:[UIImage imageNamed:@"contentview_bg"] headTitle:@"热门工具"];
    [self addSubview:section_three_title];
    
    // 添加按钮
    CGFloat hotPadding = 15.f;
    NSArray *hotTitleArr = @[@"添加字幕", @"马赛克", @"贴纸", @"GIF", @"视频压缩"];
    NSArray *hotImgArr = @[@"home_subtitle", @"home_mosaic", @"home_sticker", @"home_gif", @"comporess"];
    for (int i = 0; i<5; i++) {
        CGRect btnRect = RECT(hotPadding+((SCREEN_WIDTH-hotPadding*2)/5*i), MAX_Y(section_three_title.frame), (SCREEN_WIDTH-hotPadding*2)/5, 80);
        UIButton *audioBtn = [ViewUtility buttonWithFrame:btnRect
                                              buttonTitle:hotTitleArr[i]
                                          buttonTitleFont:BUTTON_FONT_SIZE
                                         buttonTitleColor:TIP_TEXT_COLOR
                                              buttonImage:[UIImage imageNamed:hotImgArr[i]]
                                    buttonBackgroundImage:[UIImage imageNamed:@"2"]
                                 buttonTitleAndImageStyle:BAButtonImageStyleTop
                                  buttonTitleToImageSpace:hotPadding];
        audioBtn.tag = 120 + i;
        [self addSubview:audioBtn];
    }
    
}

- (void)addBannerView {
    
}

- (void)addVideoView {
    
}

- (void)addAudioView {
    
}

- (void)addHotView {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
