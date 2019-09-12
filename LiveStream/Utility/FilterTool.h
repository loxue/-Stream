//
//  FilterTool.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/21.
//  Copyright © 2019 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterTool : NSObject

/**  判断两个数组是否是包含关系  */
+ (BOOL)isContainArrays:(NSArray *)arrayA withArrayB:(NSArray *)arrayB;

/**  空数组   */
+ (BOOL)isEmptyArray:(NSArray *)array;

/**  空字符串  */
+ (BOOL)isEmptyString:(NSString *)string;

/**  空number  */
+ (BOOL)isEmptyNumber:(NSNumber *)number;

@end
