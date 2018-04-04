//
//  BABaseNetRequest.m
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#import "BABaseNetRequest.h"

@implementation BABaseNetRequest

#pragma GET METHOD
- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(BABaseNetResponse *response))completion
{
    BAWeakSelf(self);
    [[BABaseRequestManger sharedManager] GET:URLString parameters:parameters completion:^(BABaseNetResponse *response) {
        if (!weakself) {
            return ;
        }
        !completion ?: completion(response);
    }];
}

#pragma POST METHOD
- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(BABaseNetResponse *response))completion
{
    BAWeakSelf(self);
    [[BABaseRequestManger sharedManager] POST:URLString parameters:parameters completion:^(BABaseNetResponse *response) {
        if (!weakself) {
            return ;
        }
        !completion ?: completion(response);
    }];
}

@end
