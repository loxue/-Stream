//
//  BAGesturePassword.h
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAGesturePassword : NSObject

/**
 *  是否添加手势密码
 *
 *  @return 返回是否添加手势密码
 */
+ (BOOL)hasPassword;

/**
 *  加载手势密码
 *
 *  @return 返回手势密码字符串
 */
+ (NSString *)loadPassword;

/**
 *  保存手势密码字符串
 *
 *  @param password 手势密码字符串
 */
+ (void)savePassword:(NSString *)password;

/**
 *  清除手势密码
 */
+ (void)clearPassword;

@end
