//
//  ViewUtility.m
//  LiveStream
//
//  Created by 马彦春 on 2019/5/21.
//  Copyright © 2019 intj. All rights reserved.
//

#import "ViewUtility.h"

@implementation ViewUtility

+ (void)modifyNaviBarBackgroundColor {
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:frame];
    UIGraphicsBeginImageContext(imgview.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGContextScaleCTM(context, frame.size.width, frame.size.height);
    CGFloat colors[] = {
        152.0/255.0, 38.0/255.0, 245.0/255.0, 1.0,
        85.0/255.0, 93.0/255.0, 238.0/255.0, 1.0,
    };
    
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(0, 0), CGPointMake(1.0, 0), kCGGradientDrawsBeforeStartLocation);
    
}

+ (id)cornerRadiusWithImage:(UIImage *)image
                   imageFrame:(CGRect)imageFrame
                 cornerRadius:(CGFloat)cornerRadius
                   cornerType:(UIRectCorner)cornerType {
    CGSize size = imageFrame.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = SIZE(cornerRadius, cornerRadius);
    __block id processedImageRef;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, YES, scale);
        if (nil == UIGraphicsGetCurrentContext()) return;
        
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:imageFrame
                                                         byRoundingCorners:cornerType
                                                               cornerRadii:cornerRadii];
        [cornerPath addClip];
        [image drawInRect:imageFrame];
        processedImageRef = (__bridge id _Nullable)(UIGraphicsGetImageFromCurrentImageContext().CGImage);
        UIGraphicsEndImageContext();
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.layer.contents = processedImageRef;
//        });
    });
    return processedImageRef;
}

+ (UIImage*)imageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UILabel *)lableWithFrame:(CGRect)labelFrame
                labelText:(NSString *)labelText
               labelColor:(UIColor *)labelColor
                labelFont:(UIFont *)labelFont
           labelAlignment:(NSTextAlignment)labelAlignment {
    
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.text = labelText;
    label.textColor = labelColor;
    label.font = labelFont;
    label.textAlignment = labelAlignment;
    
    return label;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)imageFrame
                       contentImage:(UIImage *)contentImage {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = contentImage;
    
    return imageView;
}

+ (UIButton *)buttonWithFrame:(CGRect)buttonFrame
                  buttonTitle:(NSString *)buttonTitle
              buttonTitleFont:(UIFont *)buttonTitleFont
             buttonTitleColor:(UIColor *)buttonTitleColor
                  buttonImage:(UIImage *)buttonImage
        buttonBackgroundImage:(UIImage *)buttonBackgroundImage
     buttonTitleAndImageStyle:(BAButtonImageStyle)buttonTitleAndImageStyle
      buttonTitleToImageSpace:(CGFloat)buttonTitleToImageSpace {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    /** 设置title */
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    button.titleLabel.font = buttonTitleFont;
    /** 设置image */
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
    
    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
    /** 设置image和title间距，以及位置关系 */
    [button buttonWithImageStyle:buttonTitleAndImageStyle imageToSpaceTitle:buttonTitleToImageSpace];
    
    return button;
}

+ (UITextField *)textFieldWithFrame:(CGRect)textFieldFrame
                      textFieldText:(NSString *)textFieldText
                      textFieldFont:(UIFont *)textFieldFont
                 textFieldTextColor:(UIColor *)textFieldTextColor
               textFieldPlaceholder:(NSString *)textFieldPlaceholder
             TextFieldTextAlignment:(NSTextAlignment)TextFieldTextAlignment {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldFrame];
    textField.text = textFieldText;
    textField.font = textFieldFont;
    textField.textColor = textFieldTextColor;
    textField.placeholder = textFieldPlaceholder;
    textField.textAlignment = TextFieldTextAlignment;
    
    return textField;
}

+ (UIDatePicker *)datePickerWithFrame:(CGRect)datePickerFrame {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:datePickerFrame];
    
    return datePicker;
}

+ (UIProgressView *)progressViewWithFrame:(CGRect)progressViewFrame {
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:progressViewFrame];
    
    return progressView;
}

+ (UISwitch *)switchWithFrame:(CGRect)switchFrame {
    UISwitch *swtch = [[UISwitch alloc] initWithFrame:switchFrame];
    
    return swtch;
}

+ (UISlider *)sliderWithFrame:(CGRect)sliderFrame
                  sliderValue:(CGFloat)sliderValue
           sliderMinimumValue:(CGFloat)sliderMinimumValue
           sliderMaximumValue:(CGFloat)sliderMaximumValue
      sliderMinimumValueImage:(UIImage *)sliderMinimumValueImage
      sliderMaximumValueImage:(UIImage *)sliderMaximumValueImage
             sliderContinuous:(BOOL)sliderContinuous
  sliderMinimumTrackTintColor:(UIColor *)sliderMinimumTrackTintColor
  sliderMaximumTrackTintColor:(UIColor *)sliderMaximumTrackTintColor
         sliderThumbTintColor:(UIColor *)sliderThumbTintColor {
    
    UISlider *slider = [[UISlider alloc] initWithFrame:sliderFrame];
    slider.value = sliderValue;
    slider.minimumValue = sliderMinimumValue;
    slider.maximumValue = sliderMaximumValue;
    slider.minimumValueImage = sliderMinimumValueImage;
    slider.maximumValueImage = sliderMaximumValueImage;
    slider.continuous = sliderContinuous;
    slider.minimumTrackTintColor = sliderMinimumTrackTintColor;
    slider.maximumTrackTintColor = sliderMaximumTrackTintColor;
    slider.thumbTintColor = sliderThumbTintColor;
    
    return slider;
}

+ (UIStepper *)stepperWithFrame:(CGRect)stepperFrame {
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:stepperFrame];
    
    return stepper;
}

@end
