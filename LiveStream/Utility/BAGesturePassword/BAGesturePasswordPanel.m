//
//  BAGesturePasswordPanel.m
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAGesturePasswordPanel.h"

@interface BAGesturePasswordPanel ()

@property (nonatomic, strong) NSMutableArray* buttons;
@property (nonatomic, strong) NSMutableArray* selectedButtons;
@property (nonatomic, strong) NSMutableArray* wrongButtons;

@property (nonatomic, assign) CGPoint curPoint;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) BOOL isDrawing;

@property (nonatomic, assign) BOOL isWrongColor;

@property (nonatomic, assign) CGFloat pointButtonSize;

@property (nonatomic, assign) CGFloat pointButtonMargin;

@property (nonatomic, strong) UIColor *wrongLineColor;

@property (nonatomic, strong) UIColor *normalLineColor;

@property (nonatomic, assign) CGFloat lineWidth;

@end

@implementation BAGesturePasswordPanel

- (NSMutableArray *)buttons
{
    if (_buttons==nil) {
        _buttons = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _buttons;
}

- (NSMutableArray *)selectedButtons
{
    if (_selectedButtons==nil) {
        _selectedButtons = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _selectedButtons;
}

- (NSMutableArray *)wrongButtons
{
    if (_wrongButtons==nil) {
        _wrongButtons = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _wrongButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPanel];
    }
    return self;
}

- (void)initPanel
{
    self.clipsToBounds = YES;
    _pointButtonMargin = 25;
    _pointButtonSize = [[UIScreen mainScreen] bounds].size.width/3-2*_pointButtonMargin;
    _wrongLineColor = [UIColor whiteColor];
    _normalLineColor = [UIColor whiteColor];
    _lineWidth = 8.f;
    for (int i = 0; i < 9; i++) {
        UIButton *pointButton = [UIButton buttonWithType:UIButtonTypeCustom];
        pointButton.backgroundColor = [UIColor clearColor];
        [pointButton setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [pointButton setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        pointButton.userInteractionEnabled = NO;
        pointButton.tag = i+1;
        pointButton.alpha = 1.f;
        [self addSubview:pointButton];
        [self.buttons addObject:pointButton];
    }
    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = [[UIScreen mainScreen] bounds].size.width/3;
    BAWEAK_SELF(self);
    [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *pointButton = obj;
        int row = (int)idx/3;
        int col = (int)idx%3;
        CGFloat x = weakself.pointButtonMargin+col*w;
        CGFloat y = weakself.pointButtonMargin+row*w;
        pointButton.frame = RECT(x, y, weakself.pointButtonSize, weakself.pointButtonSize);
    }];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.selectedButtons.count > 0) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // 设置线条颜色
        _isWrongColor ? [_wrongLineColor set] : [_normalLineColor set];
        
        // 设置线条宽度
        CGContextSetLineWidth(context, _lineWidth);
        
        // 画之前的线
        CGPoint addLines[9];
        int count = 0;
        for (UIButton* button in self.selectedButtons) {
            CGPoint point = CGPointMake(button.center.x, button.center.y);
            addLines[count++] = point;
            
            // 画中心圆
            CGRect circleRect = CGRectMake(button.center.x- _lineWidth/2,
                                           button.center.y - _lineWidth/2,
                                           _lineWidth,
                                           _lineWidth);
            CGContextSetFillColorWithColor(context, _normalLineColor.CGColor);
            CGContextFillEllipseInRect(context, circleRect);
        }
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextAddLines(context, addLines, count);
        CGContextStrokePath(context);
        
        if (_isDrawing) {
            // 画当前线
            UIButton* lastButton = self.selectedButtons.lastObject;
            CGContextMoveToPoint(context, lastButton.center.x, lastButton.center.y);
            CGContextAddLineToPoint(context, _curPoint.x, _curPoint.y);
            CGContextStrokePath(context);
        }
    }
}

#pragma mark - TouchEventHandler
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _isDrawing = NO;
    CGPoint point = [[touches anyObject] locationInView:self];
    [self updateFingerPosition:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    _isDrawing = YES;
    CGPoint point = [[touches anyObject] locationInView:self];
    [self updateFingerPosition:point];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endPosition];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endPosition];
}

- (void)updateFingerPosition:(CGPoint)point
{
    _curPoint = point;
    CGFloat radius = _pointButtonSize/2;
    for (UIButton *btn in _buttons)
    {
        CGFloat xdiff = point.x - btn.center.x;
        CGFloat ydiff = point.y - btn.center.y;
        if ((fabs(xdiff) < radius)&& (fabs(ydiff) < radius))
        {
            if (!btn.selected) {
                [btn setSelected:YES];
                [self.selectedButtons addObject:btn];
            }
        }
    }
    [self setNeedsDisplay];
}

- (void)endPosition
{
    _isDrawing = NO;
    
    __block NSString *passwordString = @"";
    
    // 生成密码串
    [self.selectedButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *btn = obj;
        passwordString = [passwordString stringByAppendingFormat:@"%ld",(long)btn.tag];
    }];
    
    [self setNeedsDisplay];
    
    if (_delegate && [_delegate respondsToSelector:@selector(panel:didFinishGeneratePassword:)]) {
         [_delegate panel:self didFinishGeneratePassword:passwordString];
    }
    [self clearColorAndSelectedButton]; // 清除到初始样式
}

- (void)clearColorAndSelectedButton
{
    if (!_isDrawing) {
        [self clearColor];
        [self clearSelectedButton];
    }
}

- (void)clearSelectedButton
{
    // 换到下次按时再弄
    [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *btn = obj;
        [btn setSelected:NO];
    }];
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)clearColor
{
    if (_isWrongColor) {
        // 重置颜色
        _isWrongColor = NO;
        [_buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIButton *btn = obj;
            [btn setBackgroundImage:[UIImage imageNamed:@"setting_selected"] forState:UIControlStateSelected];
        }];
        
    }
}

@end
