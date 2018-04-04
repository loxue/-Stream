//
//  BABaseRequestManger.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BABaseNetResponse.h"
#import <AFNetworking.h>

typedef enum : NSInteger {
    BARequestManagerStatusCodeCustomDemo = -10000,
} BARequestManagerStatusCode;

typedef BABaseNetResponse *(^ResponseFormat)(BABaseNetResponse *response);

@interface BABaseRequestManger : AFHTTPSessionManager

+ (instancetype)sharedManager;

//本地数据模式
@property (assign, nonatomic) BOOL isLocal;

//预处理返回的数据
@property (copy, nonatomic) ResponseFormat responseFormat;

- (void)POST:(NSString *)urlString parameters:(id)parameters completion:(void (^)(BABaseNetResponse *response))completion;

- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(BABaseNetResponse *response))completion;

/**
 data 对应的二进制数据
 name 服务端需要参数
 */
- (void)upload:(NSString *)urlString parameters:(id)parameters formDataBlock:(void(^)(id<AFMultipartFormData> formData))formDataBlock progress:(void (^)(NSProgress *progress))progress completion:(void (^)(BABaseNetResponse *response))completion;

@end
