//
//  BACommonMacro.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#ifndef BACommonMacro_h
#define BACommonMacro_h

/** weakSelf */
#define BAWEAK_SELF(type)  __weak typeof(type) weak##type = type
/** property transfor string */
#define BAKEY_PATH(obj, key) @(((void)obj.key, #key))
/** 空值判断 */
#define BAIS_EMPTY(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/** bundle */
#define BUNDLE          [NSBundle mainBundle]
#define USERDEFAULTS    [NSUserDefaults standardUserDefaults]

/** 系统版本 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 屏幕分辨率 */
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))
/** iPhone X系列判断  */
#define  IS_IPHONE_X (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size)  || CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
/** 顶部statusBar高度  */
#define STATUSBAR_HEIGHT    (IS_IPHONE_X ? 44.f : 20.f)
/** 顶部navibar高度 */
#define NAVIBAR_HEIGHT      (44.f+STATUSBAR_HEIGHT)
/** 底部tabbar高度  */
#define TABBAR_HEIGHT       (IS_IPHONE_X ? (49.f+34.f) : 49.f)
/** 底部safeArea高度  */
#define TABBAR_SAFE_BOTTOM_MARGIN     (IS_IPHONE_X ? 34.f : 0.f)
#define VIEWCTRLTOP_BARHEIGHT           44.0f

#define RECT(x, y, w, h)  CGRectMake(x, y, w, h)
#define SIZE(w, h)        CGSizeMake(w, h)
#define POINT(x, y)       CGPointMake(x, y)
#define MAX_X(rect)    CGRectGetMaxX(rect)
#define MAX_Y(rect)    CGRectGetMaxY(rect)
#define MID_X(rect)    CGRectGetMidX(rect)
#define MID_Y(rect)    CGRectGetMinY(rect)
#define MIN_X(rect)    CGRectGetMinX(rect)
#define MIN_Y(rect)    CGRectGetMaxX(rect)
#define GET_WIDTH(rect)     CGRectGetWidth(rect)
#define GET_HEIGHT(rect)    CGRectGetHeight(rect)
#define SCREEN_SCALE    (SCREEN_WIDTH/375.f)

/** 颜色 */
#define UICOLORFORMHEX(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16 )) / 255.0 green:((( s & 0xFF00 ) >> 8 )) / 255.0 blue:(( s & 0xFF )) / 255.0 alpha:1.0]
// 背景色
#define BACKGROUND_COLOR   UICOLORFORMHEX(0xFFFFFF)
// item
#define ITEM_COLOR   UICOLORFORMHEX(0xF6F6F6)


/** 弹窗背景颜色 */
#define TOAST_VIEW_BACKGROUNDCOLOR  UICOLORFORMHEX(0x1F1F1F)
/** 设置页背景颜色 */
#define SETTING_BACKGROUNDCOLOR   UICOLORFORMHEX(0xF0EFF5)

#define CAMERA_BACKGROUND        UICOLORFORMHEX(0x181818)

/** 设置页list颜色 */
#define SETTING_LIST_COLOR        UICOLORFORMHEX(0xFFFFFF)
#define CLEAR_COLOR    [UIColor clearColor]
#define HEADER_TITLE_COLOR        UICOLORFORMHEX(0x000000)
#define NAVI_TITLE_COLOR            UICOLORFORMHEX(0xFDFDFD)
//#define NAVI_BACKGROUND_COLOR       UICOLORFORMHEX(0x181818)
#define SELECT_ITEM_COLOR           UICOLORFORMHEX(0xFD9A5E)

/** 分割线颜色 */
#define LINE_COLOR   UICOLORFORMHEX(0xf4f4f4)
/** 字体颜色 */
#define TIP_TEXT_COLOR  UICOLORFORMHEX(0x3b3b3b)
#define BUTTON_TITLE_COLOR UICOLORFORMHEX(0x333333)
/** 字体 */
#define ITEM_FONT_SIZE      [UIFont systemFontOfSize:10.f]
#define BUTTON_FONT_SIZE    [UIFont systemFontOfSize:14.f]
#define HEADER_FONT_SIZE    [UIFont systemFontOfSize:24.f]
#define NAVITITLE_FONT_SIZE    [UIFont boldSystemFontOfSize:16.f]

/** tabbar字体未选中颜色 */
#define TABBAR_FONT_NORMAL_COLOR  UICOLORFORMHEX(0xAEAEAE)
/** tabbar字体选中颜色 */
#define TABBAR_FONT_SELECT_COLOR  UICOLORFORMHEX(0x575757)


/** 副标题颜色 */
#define FOOTER_VIEW_TITLECOLOR    UICOLORFORMHEX(0x7A797F)
/** 导航主题颜色 */
#define MASTERCOLOR               UICOLORFORMHEX(0x181818)
/** 滚动横条颜色 */
#define SCROLLBAR_COLOR           UICOLORFORMHEX(0xFD9A5E)

/** window */
#define K_WINDOW    [UIApplication sharedApplication].keyWindow
/** topView */
#define TOP_VIEW  K_WINDOW.rootViewController.view

/** 系统版本 */
#define IOS_VERSION       [[[UIDevice currentDevice] systemVersion] floatValue]
#define ISIOS7LATER       !(IOS_VERSION < 7.0)
#define ISIOS8LATER       !(IOS_VERSION < 8.0)


#endif /* CommonMacro_h */
