//
//  TitleView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/14.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    headImage:(UIImage *)headImage
                    headTitle:(NSString *)headTitle;

@end

NS_ASSUME_NONNULL_END
