//
//  FilterTool.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/21.
//  Copyright © 2019 intj. All rights reserved.
//

#import "FilterTool.h"

@implementation FilterTool

+ (BOOL)isContainArrays:(NSArray *)arrayA withArrayB:(NSArray *)arrayB {
    NSSet *setA = [NSSet setWithArray:arrayA];
    NSSet *setB = [NSSet setWithArray:arrayB];
    return [setA isSubsetOfSet:setB]?YES:NO;
}

+ (BOOL)isEmptyArray:(NSArray *)array {
    if(array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0){
        return YES;
    }
    return NO;
}

+ (BOOL)isEmptyString:(NSString *)string {
    if(string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0){
        return YES;
    }
    return NO;
}

+ (BOOL)isEmptyNumber:(NSNumber *)number {
    if ((number == nil) || [number isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

@end
