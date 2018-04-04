//
//  BABaseNetRequest.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BABaseNetResponse;

@interface BABaseNetRequest : NSObject

- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(BABaseNetResponse *response))completion;

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(BABaseNetResponse *response))completion;

@end
