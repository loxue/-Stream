//
//  BAGesturePasswordPanel.h
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAGesturePasswordPanel;
@protocol BAGesturePasswordPanelDelegate <NSObject>

@required
- (void)panel:(BAGesturePasswordPanel *)panel didFinishGeneratePassword:(NSString *)password;

@end

@interface BAGesturePasswordPanel : UIView

@property (nonatomic, weak) id<BAGesturePasswordPanelDelegate> delegate;

@end
