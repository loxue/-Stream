//
//  BAGesturePassword.m
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BAGesturePassword.h"

@implementation BAGesturePassword

/**
 *  是否添加手势密码
 *
 *  @return 返回是否添加手势密码
 */
+ (BOOL)hasPassword
{
    NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"BAGesturePassword"];
    if (pwd==nil || [pwd isEqualToString:@""] || [pwd isEqualToString:@"(null)"]) {
        return NO;
    }
    return YES;
}

/**
 *  加载手势密码
 *
 *  @return 返回手势密码字符串
 */
+ (NSString *)loadPassword
{
    if ([BAGesturePassword hasPassword]) {
        NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"BAGesturePassword"];
        return pwd;
    }
    return nil;
}

/**
 *  保存手势密码字符串
 *
 *  @param password 手势密码字符串
 */
+ (void)savePassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"BAGesturePassword"];
}

/**
 *  清除手势密码
 */
+ (void)clearPassword
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"BAGesturePassword"];
}

@end
