//
//  SettingController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/11.
//  Copyright © 2019 intj. All rights reserved.
//

#import "SettingController.h"
/** 应用内评分 */
#import <StoreKit/StoreKit.h>
#import "UIControl+Blocks.h"
#import "BASettingCell.h"
#import "OpenShareHeader.h"
#import "SettingHeaderView.h"

@interface SettingController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *listView;
    NSArray *arr0, *arr1;
}
@end

@implementation SettingController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [super viewDidLoad];
    self.title = @"设置";
    
    listView = [[UITableView alloc] initWithFrame:RECT(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUSBAR_HEIGHT-TABBAR_HEIGHT+11) style:UITableViewStyleGrouped];
    listView.delegate = self;
    listView.dataSource = self;
    listView.separatorStyle = NO;
    listView.showsVerticalScrollIndicator = NO;
    listView.backgroundColor = CLEAR_COLOR;
    [self.view addSubview:listView];
    // init
    arr0 = @[@"切换主题", @"清除缓存", @"检查更新", @"分享给好友", @"关于我"];
    arr1 = @[@"setting_theme", @"setting_clear", @"setting_checkupdate", @"setting_share", @"setting_about"];
 
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BASettingCell *cell = [BASettingCell cellWithTableViewCell:tableView];
    cell.textLabel.text = arr0[indexPath.row];
    cell.textLabel.textColor = BUTTON_TITLE_COLOR;
    cell.imageView.image = [UIImage imageNamed:arr1[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            // 分享
            OSMessage *message = [[OSMessage alloc]init];
            message.title=@"hello openshare (message.title)";
            //                message.image = testImage;
            message.link=@"http://openshare.gfzj.us/";
            
            [OpenShare shareToWeibo:message Success:^(OSMessage *message) {
                NSLog(@"分享到sina微博成功:\%@",message);
            } Fail:^(OSMessage *message, NSError *error) {
                NSLog(@"分享到sina微博失败:\%@\n%@",message,error);
            }];
            
        }
            break;
        case 4:
        {
            if (@available(iOS 10.3, *)) {
                // 每年最多弹窗三次
                [SKStoreReviewController requestReview];
            }
        }
            
        default:
            break;
    }
    
}

#pragma mark - 设置headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[SettingHeaderView alloc] initWithFrame:RECT(0, 0, SCREEN_WIDTH, 200)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200.f;
}


@end
