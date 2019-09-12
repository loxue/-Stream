//
//  ViewUtility.h
//  LiveStream
//
//  Created by 马彦春 on 2019/5/21.
//  Copyright © 2019 intj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewUtility : NSObject

/**  导航渐变   */
+ (void)modifyNaviBarBackgroundColor;

+ (id)cornerRadiusWithImage:(UIImage *)image
                   imageFrame:(CGRect)imageFrame
                 cornerRadius:(CGFloat)cornerRadius
                   cornerType:(UIRectCorner)cornerType;

/**  颜色转图片   */
+ (UIImage *)imageWithColor:(UIColor*)color;

/**  创建文本   */
+ (UILabel *)lableWithFrame:(CGRect)labelFrame
                  labelText:(NSString *)labelText
                 labelColor:(UIColor *)labelColor
                  labelFont:(UIFont *)labelFont
             labelAlignment:(NSTextAlignment)labelAlignment;

/** 创建图片 */
+ (UIImageView *)imageViewWithFrame:(CGRect)imageFrame
                       contentImage:(UIImage *)contentImage;

/** 创建按钮 */
+ (UIButton *)buttonWithFrame:(CGRect)buttonFrame
                  buttonTitle:(NSString *)buttonTitle
              buttonTitleFont:(UIFont *)buttonTitleFont
             buttonTitleColor:(UIColor *)buttonTitleColor
                  buttonImage:(UIImage *)buttonImage
        buttonBackgroundImage:(UIImage *)buttonBackgroundImage
     buttonTitleAndImageStyle:(BAButtonImageStyle)buttonTitleAndImageStyle
      buttonTitleToImageSpace:(CGFloat)buttonTitleToImageSpace ;

/** 创建输入框 */
+ (UITextField *)textFieldWithFrame:(CGRect)textFieldFrame
                      textFieldText:(NSString *)textFieldText
                      textFieldFont:(UIFont *)textFieldFont
                 textFieldTextColor:(UIColor *)textFieldTextColor
               textFieldPlaceholder:(NSString *)textFieldPlaceholder
             TextFieldTextAlignment:(NSTextAlignment)TextFieldTextAlignment;

/** 创建日期选择 */
+ (UIDatePicker *)datePickerWithFrame:(CGRect)datePickerFrame;

/** 创建进度条 */
+ (UIProgressView *)progressViewWithFrame:(CGRect)progressViewFrame;

/** 创建开关 */
+ (UISwitch *)switchWithFrame:(CGRect)switchFrame;

/** 创建滑块 */
+ (UISlider *)sliderWithFrame:(CGRect)sliderFrame
                  sliderValue:(CGFloat)sliderValue
           sliderMinimumValue:(CGFloat)sliderMinimumValue
           sliderMaximumValue:(CGFloat)sliderMaximumValue
      sliderMinimumValueImage:(UIImage *)sliderMinimumValueImage
      sliderMaximumValueImage:(UIImage *)sliderMaximumValueImage
             sliderContinuous:(BOOL)sliderContinuous
  sliderMinimumTrackTintColor:(UIColor *)sliderMinimumTrackTintColor
  sliderMaximumTrackTintColor:(UIColor *)sliderMaximumTrackTintColor
         sliderThumbTintColor:(UIColor *)sliderThumbTintColor;

/** 创建分段器 */
+ (UIStepper *)stepperWithFrame:(CGRect)stepperFrame;

@end
