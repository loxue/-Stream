//
//  SwitchMenuView.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/17.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ClickBlock)(int index);

@interface SwitchMenuView : UIView

/** scroll bar color */
@property (nonatomic, strong) UIColor *scrollBarColor;
/** item title color */
@property (nonatomic, strong) UIColor *itemColor;
/** title dataSource */
@property (nonatomic, strong) NSArray *titleArr;

/** itemView width */
@property (nonatomic, assign) CGFloat *itemWidth;
/** itemView height */
@property (nonatomic, assign) CGFloat *itemHeight;


- (instancetype)initWithFrame:(CGRect)frame itemCounts:(NSArray<NSString *> *)itemCounts;

- (void)setClickBlock:(ClickBlock)block;

@end

NS_ASSUME_NONNULL_END
