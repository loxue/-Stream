//
//  VideoEditorView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/13.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoEditorView : UIView

@property (nonatomic, strong) NSString *s;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
