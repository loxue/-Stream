//
//  BaseViewController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/22.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *mainScroll;

@end

@implementation BaseViewController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)InitController {
    [self createFields];
    [self createViews];
    [self createEvents];
}

- (void)loadView {
    self.view = self.mainScroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self InitController];
    //for iOS7
    if (ISIOS7LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.extendedLayoutIncludesOpaqueBars = NO;
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : NAVI_TITLE_COLOR,NSFontAttributeName : NAVITITLE_FONT_SIZE}];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    }
    [self loadData];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    self.navigationController.navigationBarHidden = YES;
    
//    //隐藏底部tabBar
//    if (![self.rdv_tabBarController isTabBarHidden]) {
//        [self.rdv_tabBarController setTabBarHidden:YES animated:NO];
//    }
}

- (UIScrollView *)mainScroll {
    if (_mainScroll == nil) {
        _mainScroll = [[UIScrollView alloc] initWithFrame:RECT(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUSBAR_HEIGHT-TABBAR_HEIGHT+11)];
        _mainScroll.delegate = self;
        [_mainScroll setShowsVerticalScrollIndicator:NO];
        [_mainScroll setShowsHorizontalScrollIndicator:NO];
        _mainScroll.backgroundColor = BACKGROUND_COLOR;
        _mainScroll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _mainScroll;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self destroyEvents];
}

- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

- (void)createFields {
    
}

- (void)destroyFields {
    
}

- (void)createViews {
    
}

- (void)destroyViews {
    
}

- (void)createEvents {
    
}

- (void)destroyEvents {
    
}

- (void)loadData {
    
}

- (void)updateWhenDidAppearHandler {
    
}

- (void)addNormalBackButton {
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] init];
    backItem.title=@"返回";
    backItem.tintColor = MASTERCOLOR;
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)addBackBarButtonItem {
    [self.navigationItem setItemWithType:BANavigationItemTypeleft
                                  target:self
                                  action:@selector(backToPreViewController:)
                             normalImage:@"barItem_return_n"
                        highlightedImage:@"barItem_return_n"
                           selectedImage:@"barItem_return_n"];
}

- (void)setNavBarTintColor:(UIColor*)color {
    if(ISIOS7LATER) {
        [self.navigationController.navigationBar setBarTintColor:color];
    }
    else {
        [self.navigationController.navigationBar setTintColor:color];
    }
}

- (void)setNavBarHidden:(BOOL)hidden {
    self.navigationController.navigationBar.hidden = hidden;
}

- (void)backToPreViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showNullViewWithImage:(NSString *)imageName
                      content:(NSString *)content
                    hasTabBar:(BOOL)hasTabBar {
    CGRect rect = CGRectNull;
    rect = RECT(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-VIEWCTRLTOP_BARHEIGHT-(hasTabBar?TABBAR_HEIGHT:0));
    
}

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{

}
- (NSUInteger)supportedInterfaceOrientations
{

}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{

}
*/

@end
