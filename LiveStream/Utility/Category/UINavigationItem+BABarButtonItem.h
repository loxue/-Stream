//
//  UINavigationItem+BABarButtonItem.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/3.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BANavigationItemTypeleft    = 0,
    BANavigationItemTyperight   = 1
} BANavigationItemType;

@interface UINavigationItem (BABarButtonItem)

- (void)setNavTitle:(NSString *)title
     withTitleColor:(UIColor*)titleColor;

- (void)setNavTitle:(NSString *)title
     withTitleColor:(UIColor*)titleColor
     withTittleSize:(CGFloat)fontSize;

- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
            normalImage:(NSString *)nImage
       highlightedImage:(NSString *)hImage
          selectedImage:(NSString *)sImage;

- (void)setItemWithType:(BANavigationItemType)type
                 target:(id)target
                 action:(SEL)action
                  title:(NSString *)title;

@end

