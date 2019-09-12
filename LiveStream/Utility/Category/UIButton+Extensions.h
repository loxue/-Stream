//
//  UIButton+Extensions.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/15.
//  Copyright © 2019 intj. All rights reserved.
//

@interface UIButton (Extensions)

typedef NS_ENUM(NSInteger, BAButtonImageStyle){
    BAButtonImageStyleTop = 0,  //图上字下
    BAButtonImageStyleLeft,     //图左字右
    BAButtonImageStyleBottom,   //图下字上
    BAButtonImageStyleRight     //图右字左
};

- (void)buttonWithImageStyle:(BAButtonImageStyle)style
                 imageToSpaceTitle:(CGFloat)space;

@end
