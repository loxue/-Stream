//
//  BABaseNetResponse.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BABaseNetResponse : NSObject

/** <#digest#> */
@property (nonatomic, strong) NSError *error;

/** <#digest#> */
@property (nonatomic, copy) NSString *errorMsg;

/** <#digest#> */
@property (assign, nonatomic) NSInteger statusCode;

/** <#digest#> */
@property (nonatomic, copy) NSMutableDictionary *headers;

/** <#digest#> */
@property (nonatomic, strong) id responseObject;

@end
