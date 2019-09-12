//
//  BAPageControl.h
//  LiveStream
//
//  Created by inTJ on 2019/5/21.
//  Copyright © 2019 intj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAPageControl : UIControl

/**
 *  @brief UIPageControl
 */
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) NSInteger numberOfPages;              // 指示器个数
@property (nonatomic, strong) UIColor * pageIndicatorColor;         // 颜色
@property (nonatomic, strong) UIColor * currentPageIndicatorColor;  // 当前颜色
@property (nonatomic, assign) NSInteger currentPage;            // 当前页


/**
 *  @brief pageControl method
 */
- (instancetype)initWithFrame:(CGRect)frame
              indicatorMargin:(CGFloat)margin
               indicatorWidth:(CGFloat)indicatorWidth
        currentIndicatorWidth:(CGFloat)currentIndicatorWidth
              indicatorHeight:(CGFloat)indicatorHeight;


@end
