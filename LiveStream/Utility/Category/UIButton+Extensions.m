//
//  UIButton+Extensions.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/15.
//  Copyright © 2019 intj. All rights reserved.
//

#import "UIButton+Extensions.h"

@implementation UIButton (Extensions)

- (void)buttonWithImageStyle:(BAButtonImageStyle)style
           imageToSpaceTitle:(CGFloat)space {
    // 1、获取image和title的高和宽
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    CGFloat titleHeight = self.titleLabel.frame.size.height;
    
    // 2、初始偏移
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    
    // 3、处理偏移
    switch (style) {
        case BAButtonImageStyleTop:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, titleHeight + space / 2, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(imageHeight + space / 2, -imageWidth, 0, 0);
            break;
        case BAButtonImageStyleLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space / 2);
            titleEdgeInsets = UIEdgeInsetsMake(0, space / 2, 0, 0);
            break;
        case BAButtonImageStyleBottom:
            imageEdgeInsets = UIEdgeInsetsMake(titleHeight + space / 2, 0, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, imageHeight + space / 2, 0);
            break;
        case BAButtonImageStyleRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + space / 2, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space / 2, 0, imageWidth);
            break;
        default:
            break;
    }
    // 4、赋值
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
}

@end
