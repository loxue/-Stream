//
//  UINavigationItem+BABarButtonItem.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/3.
//  Copyright © 2019 intj. All rights reserved.
//

#import "UINavigationItem+BABarButtonItem.h"
#import "BABarButtonItem.h"

@implementation UINavigationItem (BABarButtonItem)

- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor {
    UILabel *label = [[UILabel alloc] init];
    label.frame = RECT(0, 0, 180, 25);
    label.backgroundColor = UICOLORFORMHEX(0xFFFFFF);
    label.tag = 99901;
    label.font = [UIFont boldSystemFontOfSize:20];
    if (titleColor == nil) {
        label.textColor = [UIColor whiteColor];
    }
    else
    {
        label.textColor = titleColor;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.titleView = label;
}

- (void)setNavTitle:(NSString *)title withTitleColor:(UIColor*)titleColor withTittleSize:(CGFloat)fontSize{
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = RECT(0, 0, 180, 25);
    label.backgroundColor = UICOLORFORMHEX(0xFFFFFF);
    label.tag = 99901;
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    if (titleColor == nil) {
        label.textColor = [UIColor whiteColor];
    }
    else
    {
        label.textColor = titleColor;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.titleView = label;
    
}


- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
            normalImage:(NSString *)nImage
       highlightedImage:(NSString *)hImage
          selectedImage:(NSString *)sImage {
    BABarButtonItem *buttonItem = [BABarButtonItem buttonItemWithTarget:target
                                                                 action:action
                                                            normalImage:nImage
                                                       highlightedImage:hImage
                                                          selectedImage:sImage];
    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem.button];
    NSArray *array = nil;
    if (ISIOS7LATER) {
        UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:self
                                                                                    action:nil];
        flexSpacer.width = -10;
        array = @[flexSpacer,barbuttonItem];
        if (type == BANavigationItemTypeleft) {
            [self setLeftBarButtonItems:array];
        }
        else {
            [self setRightBarButtonItems:array];
        }
    }
    else
    {
        if (type == BANavigationItemTypeleft) {
            [self setLeftBarButtonItem:barbuttonItem];
        }
        else {
            [self setRightBarButtonItem:barbuttonItem];
        }
    }
}

- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
                  title:(NSString *)title
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    NSArray *array = nil;
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:self
                                                                                action:nil];
    flexSpacer.width = 0;
    array = @[flexSpacer,barButtonItem];
    if (type == BANavigationItemTypeleft) {
        [self setLeftBarButtonItems:array];
    }
    else {
        [self setRightBarButtonItems:array];
    }
}


@end
