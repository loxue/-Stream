//
//  HotToolController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/11.
//  Copyright © 2019 intj. All rights reserved.
//

#import "HotToolController.h"
#import "BABannerView.h"
#import "BAUserTipView.h"
#import "BAFunctionView.h"
#import "BAModifyView.h"

@interface HotToolController ()

@property (nonatomic, strong) BABannerView *bannerView;
@property (nonatomic, strong) BAUserTipView *userTipView;
@property (nonatomic, strong) BAFunctionView *functionView;
@property (nonatomic, strong) BAModifyView *modifyView;

@end

@implementation HotToolController

- (BABannerView *)bannerView {
    if (_bannerView == nil) {
        _bannerView = [[BABannerView alloc] initWithFrame:RECT(0, 0, SCREEN_WIDTH, 236*SCREEN_SCALE)];
    }
    return _bannerView;
}

- (BAUserTipView *)userTipView {
    if (_userTipView == nil) {
        CGRect tipFrame = RECT(0, MAX_Y(self.bannerView.frame), SCREEN_WIDTH, 90*SCREEN_SCALE);
        _userTipView = [[BAUserTipView alloc] initWithFrame:tipFrame buttonCount:4];
    }
    return _userTipView;
}

- (BAFunctionView *)functionView {
    if (_functionView == nil) {
        _functionView = [[BAFunctionView alloc] initWithFrame:RECT(0, MAX_Y(self.userTipView.frame), SCREEN_WIDTH, 154*SCREEN_SCALE)];
    }
    return _functionView;
}

- (BAModifyView *)modifyView {
    if (_modifyView == nil) {
        CGRect modifyFrame = RECT(15, MAX_Y(self.functionView.frame)+10, SCREEN_WIDTH-30, 90*SCREEN_SCALE);
        _modifyView = [[BAModifyView alloc] initWithFrame:modifyFrame buttonCount:5];
        _modifyView.layer.cornerRadius = 5.f;
        _modifyView.layer.borderWidth = 1.f;
        _modifyView.layer.borderColor = LINE_COLOR.CGColor;
    }
    return _modifyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加header
    [self.view addSubview:self.bannerView];
    [self.view addSubview:self.userTipView];
    BAWEAK_SELF(self);
    [self.userTipView setClickBlock:^(int index) {
        
    }];
    [self.view addSubview:self.functionView];
    [self.functionView setClickBlock:^(int index) {
        BACameraController *cameraVC = [[BACameraController alloc] init];
//        cameraVC.title = ;
        [weakself.navigationController pushViewController:cameraVC animated:YES];
    }];
    
    [self.view addSubview:self.modifyView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    if ([self.rdv_tabBarController isTabBarHidden]) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    //隐藏底部tabBar
    if (![self.rdv_tabBarController isTabBarHidden]) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    }
}

@end
