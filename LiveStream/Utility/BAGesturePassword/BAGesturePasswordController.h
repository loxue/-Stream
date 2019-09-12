//
//  BAGesturePasswordController.h
//  LiveStream
//
//  Created by 马彦春 on 2014/3/28.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BaseViewController.h"

typedef enum : NSUInteger {
    BAGesturePasswordTypeUnLock,//解锁
    BAGesturePasswordTypeCreate,//创建
    BAGesturePasswordTypeModify,//修改
    BAGesturePasswordTypeClear, //删除
} BAGesturePasswordType;

typedef void(^FailedBlock)(void);
//typedef void(^ForgetButtonClickBlock)(void);

@interface BAGesturePasswordController : BaseViewController

@property (nonatomic, assign) BAGesturePasswordType type;

@property (nonatomic, assign) BOOL isPush;

@property (nonatomic, strong) FailedBlock FailedHandler;

//@property (nonatomic, strong) ForgetButtonClickBlock forgetButtonClickEvent;

@end
