//
//  BABarButtonItem.h
//  LiveStream
//
//  Created by 马彦春 on 2019/6/3.
//  Copyright © 2019 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BABarButtonItem : NSObject

@property (nonatomic, strong) UIButton*button;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) NSString *normalImage;
@property (nonatomic, strong) NSString *highlightedImage;
@property (nonatomic, strong) NSString *selectedImage;

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;

/**
 <#Description#>

 @param target <#target description#>
 @param action <#action description#>
 @param nImage <#nImage description#>
 @param hImage <#hImage description#>
 @param sImage <#sImage description#>
 @return <#return value description#>
 */


/**
 <#Description#>

 @param target target description
 @param action action description
 @param nImage nImage description
 @param hImage hImage description
 @param sImage sImage description
 @return return value description
 */
+ (id)buttonItemWithTarget:(id)target
                    action:(SEL)action
               normalImage:(NSString *)nImage
          highlightedImage:(NSString *)hImage
             selectedImage:(NSString *)sImage;

- (void)setTarget:(id)target withAction:(SEL)action;

@end

NS_ASSUME_NONNULL_END
