//
//  BABarButtonItem.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/3.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BABarButtonItem.h"

#define ItemWidth  NAVIBAR_HEIGHT
#define ItemHeight NAVIBAR_HEIGHT

@implementation BABarButtonItem

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setNormalImage:(NSString *)normalImage
{
    _normalImage = normalImage;
    [_button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
}

- (void)setHighlightedImage:(NSString *)highlightedImage
{
    _highlightedImage = highlightedImage;
    [_button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(NSString *)selectedImage
{
    _selectedImage = selectedImage;
    [_button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
}

+ (id)buttonItemWithTarget:(id)target
                    action:(SEL)action
               normalImage:(NSString *)nImage
          highlightedImage:(NSString *)hImage
             selectedImage:(NSString *)sImage
{
    BABarButtonItem *item = [[BABarButtonItem alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    item.button  = button;
    button.frame =CGRectMake(0, 0, ItemWidth, ItemHeight);
    item.normalImage = nImage;
    item.highlightedImage = hImage;
    item.selectedImage = sImage;
    [item setTarget:target withAction:action];
    return item;
}

- (void)setTarget:(id)target withAction:(SEL)action
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
