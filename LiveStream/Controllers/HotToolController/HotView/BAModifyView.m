//
//  BAModifyView.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAModifyView.h"

@implementation BAModifyView
{
    ButtonClickBlock clickBlock;
}

- (instancetype)initWithFrame:(CGRect)frame buttonCount:(int)buttonCount {
    if (self = [super initWithFrame:frame]) {
        [self loadViewsWithCount:buttonCount];
    }
    return self;
}

- (void)loadViewsWithCount:(int)count {
    if (count < 6) {
        NSArray *titleArr = @[@"视频滤镜", @"超级相机", @"图片编辑", @"视频同框", @"快慢放"];
        NSArray *imageArr = @[@"home_filter", @"home_superCamera", @"home_photoEdit", @"home_moments", @"home_speed"];
        for (int i=0; i<count; i++) {
            CGRect btnFrame = RECT((SCREEN_WIDTH-30)/5*i, 0, (SCREEN_WIDTH-30)/5, 90*SCREEN_SCALE);
            UIButton *btn = [ViewUtility buttonWithFrame:btnFrame
                                             buttonTitle:titleArr[i]
                                         buttonTitleFont:BUTTON_FONT_SIZE
                                        buttonTitleColor:BUTTON_TITLE_COLOR
                                             buttonImage:[UIImage imageNamed:imageArr[i]]
                                   buttonBackgroundImage:[UIImage imageNamed:@""]
                                buttonTitleAndImageStyle:BAButtonImageStyleTop
                                 buttonTitleToImageSpace:25.f
                             ];
            btn.tag = 30+i;
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
}

- (void)setClickBlock:(ButtonClickBlock)block {
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
 // 初始化views
 //    homeScrollView = [[BABaseView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) itemCounts:self.dataArr.count dataDic:self.dataDic hotArray:@[@0, @2, @10]];
 //    [self.view addSubview:homeScrollView];
 //    BAWEAK_SELF(self);
 //    [homeScrollView setClickBlock:^(int index) {
 //        NSLog(@"click tapped=%d", index);
 //        NSArray *controllerNameStr = @[NSStringFromClass([AppendController class]),NSStringFromClass([BgmController class]),NSStringFromClass([SubtitleController class]),NSStringFromClass([CollageController class]),NSStringFromClass([TextvideoController class]),NSStringFromClass([ImagevideoController class]),NSStringFromClass([CropController class]),NSStringFromClass([CuttingController class]),NSStringFromClass([VarspeedController class]),NSStringFromClass([RotateController class]),NSStringFromClass([MosaicController class]),NSStringFromClass([FilterController class]),NSStringFromClass([AspectratioController class]),NSStringFromClass([LivephotoController class]),NSStringFromClass([ExportController class]),NSStringFromClass([CoverController class]),NSStringFromClass([UpsidedownController class]),NSStringFromClass([LivestreamController class]),NSStringFromClass([MusicplayController class]),NSStringFromClass([BarrageController class]),NSStringFromClass([BluetoothController class])];
 //        UIViewController *vc = [[NSClassFromString(controllerNameStr[index-1000]) alloc] init];
 //        vc.title = weakself.dataArr[index-1000];
 //        vc.view.backgroundColor = ITEM_FONT_COLOR;
 //        [weakself.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : ITEM_COLOR,NSFontAttributeName : [UIFont systemFontOfSize:14.f]}];
 //        [weakself.navigationController pushViewController:vc animated:YES];
 //    }];
}
*/

@end
