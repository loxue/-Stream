//
//  SettingHeaderView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingHeaderView : UIView

@property (nonatomic, strong) UIImageView *headerImg;
@property (nonatomic, strong) UILabel *headerVersion;
@property (nonatomic, strong) UILabel *headerInfo;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
