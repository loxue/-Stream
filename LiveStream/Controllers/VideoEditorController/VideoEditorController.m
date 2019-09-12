//
//  VideoEditorController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/11.
//  Copyright © 2019 intj. All rights reserved.
//

#import "VideoEditorController.h"
#import "KNBannerView.h"
#import "VideoEditorView.h"

@interface VideoEditorController ()

@property (nonatomic, strong) VideoEditorView *editorView;

@end

@implementation VideoEditorController

- (VideoEditorView *)editorView {
    if (_editorView == nil) {
        _editorView = [[VideoEditorView alloc] initWithFrame:RECT(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
    }
    return _editorView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.editorView];
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
