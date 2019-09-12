//
//  BAGesturePasswordController.m
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAGesturePasswordController.h"
#import "BAGesturePasswordPanel.h"
#import "BAGesturePassword.h"

@interface BAGesturePasswordController ()<BAGesturePasswordPanelDelegate>

@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) UIButton *forgetButton;

@property (nonatomic, strong) BAGesturePasswordPanel *panel;

@property (nonatomic, strong) NSArray *tips;

@property (nonatomic, assign) NSInteger minLength;

@property (nonatomic, copy) NSString *firstPassword;

@property (nonatomic, copy) NSString *secondPassword;

@property (nonatomic, copy) NSString *curSavedPassword;

@property (nonatomic, assign) NSInteger remainTimes;

@property (nonatomic, assign) BOOL isPassForModify;

@end

@implementation BAGesturePasswordController

- (void)setType:(BAGesturePasswordType)type
{
    switch (type) {
        case BAGesturePasswordTypeUnLock:
        {
            self.tips = @[@"请绘制手势密码解锁"];
            break;
        }
        case BAGesturePasswordTypeCreate:
        {
            self.tips = @[@"绘制解锁图案",@"再次绘制解锁图案",@"手势密码创建成功"];
            break;
        }
        case BAGesturePasswordTypeModify:
        {
            self.tips = @[@"请绘制旧的密码",@"请绘制新的密码",@"请再次确认密码",@"手势密码修改成功"];
            break;
        }
        case BAGesturePasswordTypeClear:
        {
            self.tips = @[@"请绘制当前密码",@"手势密码清除成功"];
            break;
        }
        default:
            break;
    }
    _type = type;
}

- (void)createFields
{
    _minLength = 4;
    _remainTimes = 5;
    self.firstPassword = @"";
    self.secondPassword = @"";
    self.curSavedPassword = [BAGesturePassword loadPassword];
    _isPassForModify = NO;
}

- (void)createViews
{
    self.view.backgroundColor = MASTERCOLOR;//RGB(238, 238, 238);
    self.title = @"手势密码";
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat yOffset = 64;
    if (_isPush) {
        yOffset = 0;
    }
    if (_type==BAGesturePasswordTypeUnLock) {
        UIImage *img = [UIImage imageNamed:@"default_headpic"];
        UIImageView *headView = [[UIImageView alloc] initWithImage:img];
        headView.frame = RECT(0, 0, img.size.width, img.size.height);
        headView.center = POINT(SCREEN_WIDTH/2, yOffset + img.size.height/2);
        [self.view addSubview:headView];
        yOffset = yOffset + img.size.height + 25;
    }
    else
    {
        yOffset = yOffset + 40;
    }
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, yOffset, screenSize.width, 21)];
    _tipLabel.text = _tips[0];
    _tipLabel.textColor = [UIColor whiteColor];
    _tipLabel.font = [UIFont systemFontOfSize:18.f];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tipLabel];

    _panel = [[BAGesturePasswordPanel alloc] initWithFrame:CGRectMake(0, _tipLabel.frame.origin.y+30, screenSize.width, screenSize.width)];
    _panel.delegate = self;
    [self.view addSubview:_panel];
    
    if (_type!=BAGesturePasswordTypeCreate) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetButton.frame = CGRectMake(30, CGRectGetMaxY(_panel.frame), 130, 21);
        [_forgetButton setTitle:@"忘记手势密码？" forState:UIControlStateNormal];
        [_forgetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _forgetButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        _forgetButton.backgroundColor = [UIColor clearColor];
        [_forgetButton addTarget:self action:@selector(forgetButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_forgetButton];
        return;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
}

- (void)forgetButtonClickEvent:(id)sender
{
//    if (_forgetButtonClickEvent) {
//        _forgetButtonClickEvent();
//    }
    if (_FailedHandler) {
        _FailedHandler();
    }
    [self hide];
}

#pragma mark - BAGesturePasswordPanelDelegate
- (void)panel:(BAGesturePasswordPanel *)panel didFinishGeneratePassword:(NSString *)password
{
    NSLog(@"生成的密码：%@",password);
    switch (_type) {
        case BAGesturePasswordTypeUnLock:
        {
            [self unlockHandler:password];
            break;
        }
        case BAGesturePasswordTypeCreate:
        {
            [self createPasswordHandler:password];
            break;
        }
        case BAGesturePasswordTypeModify:
        {
            [self modifyPasswordHandler:password];
            break;
        }
        case BAGesturePasswordTypeClear:
        {
            [self clearPasswordHandler:password];
            break;
        }
        default:
            break;
    }
}

#pragma mark - 修改密码处理
- (void)modifyPasswordHandler:(NSString *)password
{
    //检查密码长度
    if (![self checkPasswordLength:password]) {
        return;
    }
    if (!_isPassForModify) {
        //验证通过，输入新手势密码
        if ([password isEqualToString:_curSavedPassword]) {
            _isPassForModify = YES;
            [self showTip:_tips[1]];
        }
        else
        {
            [self inputErrorHandler:password];
        }
    }
    else
    {
        
        //第一次密码输入
        if ([_firstPassword isEqualToString:@""] && [_secondPassword isEqualToString:@""]) {
            self.firstPassword = password;
            [self showTip:_tips[2]];
        }
        //第二次密码输入
        else if (![_firstPassword isEqualToString:@""] && [_secondPassword isEqualToString:@""]) {
            self.secondPassword = password;
            //两次密码一致
            if ([_firstPassword isEqualToString:_secondPassword]) {
                [BAGesturePassword savePassword:password];
                [self showAlert:_tips[3]];
                [self hide];
            }
            //密码不一致
            else
            {
                self.secondPassword = @"";
                [self showErrorTip:@"与上次绘制不一致,请重新绘制"];
            }
        }
    }
}

#pragma mark - 清除密码处理
- (void)clearPasswordHandler:(NSString *)password
{
    //检查密码长度
    if (![self checkPasswordLength:password]) {
        return;
    }
    //验证通过
    if ([password isEqualToString:_curSavedPassword]) {
        [BAGesturePassword clearPassword];
        [self showAlert:_tips[1]];
        [self hide];
    }
    //验证失败
    else
    {
        [self inputErrorHandler:password];
    }
}

#pragma mark - 解锁处理
- (void)unlockHandler:(NSString *)password
{
    //检查密码长度
    if (![self checkPasswordLength:password]) {
        return;
    }
    //解锁成功
    if ([password isEqualToString:_curSavedPassword]) {
        [self hide];
    }
    //解锁失败
    else
    {
        [self inputErrorHandler:password];
    }
}

- (void)inputErrorHandler:(NSString *)password
{
    if (password.length<=0) {
        return;
    }
    _remainTimes--;
    [self showErrorTip:[NSString stringWithFormat:@"密码错误，还可以再输入%ld次", (long)_remainTimes]];
    if (_remainTimes==0)
    {
        if (_FailedHandler) {
            _FailedHandler();
        }
        [self hide];
    }
}

#pragma mark - 创建密码处理
- (void)createPasswordHandler:(NSString *)password
{
    //检查密码长度
    if (![self checkPasswordLength:password]) {
        return;
    }
    //第一次密码输入
    if ([_firstPassword isEqualToString:@""] && [_secondPassword isEqualToString:@""]) {
        self.firstPassword = password;
        [self showTip:_tips[1]];
    }
    //第二次密码输入
    else if (![_firstPassword isEqualToString:@""] && [_secondPassword isEqualToString:@""]) {
        self.secondPassword = password;
        //两次密码一致
        if ([_firstPassword isEqualToString:_secondPassword]) {
            [BAGesturePassword savePassword:password];
            [self showAlert:_tips[2]];
            [self hide];
        }
        //密码不一致
        else
        {
            self.secondPassword = @"";
            [self showErrorTip:@"与上次绘制不一致,请重新绘制"];
        }
    }
    else {
        NSAssert(1, @"设置密码发生意外");
    }
}

#pragma mark - 界面消失
- (void)hide
{
    if (_isPush) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 检查密码长度
- (BOOL)checkPasswordLength:(NSString *)password
{
    if (password.length<_minLength) {
        [self showErrorTip:[NSString stringWithFormat:@"至少选择%ld个点，请重新绘制",(long)_minLength]];
        return NO;
    }
    return YES;
}

#pragma mark - 普通Tip效果
- (void)showTip:(NSString *)tip
{
    _tipLabel.text = tip;
    _tipLabel.textColor = [UIColor whiteColor];
}

#pragma mark - 错误Tip效果
- (void)showErrorTip:(NSString *)tip
{
    _tipLabel.text = tip;
    _tipLabel.textColor = [UIColor whiteColor];
    [self shakeAnimationForView:_tipLabel];
}

#pragma mark 抖动动画
- (void)shakeAnimationForView:(UIView *)view
{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

#pragma mark - 提示信息
- (void)showAlert:(NSString*)string
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:string
                                                   delegate:nil
                                          cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
