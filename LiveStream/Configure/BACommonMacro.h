//
//  BACommonMacro.h
//  LiveStream
//
//  Created by imac on 2018/4/4.
//  Copyright © 2018年 intj. All rights reserved.
//

#ifndef BACommonMacro_h
#define BACommonMacro_h

// weakSelf
#define BAWeakSelf(type)  __weak typeof(type) weak##type = type
// property transfor string
#define BAKeyPath(obj, key) @(((void)obj.key, #key))
// null判断
#define BAIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#endif /* CommonMacro_h */
