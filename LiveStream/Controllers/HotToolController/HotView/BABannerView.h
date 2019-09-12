//
//  BABannerView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/12.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KNBannerView.h"

@interface BABannerView : UIView

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) KNBannerView *banner;

- (instancetype)initWithFrame:(CGRect)frame;

@end
