//
//  BACameraController.m
//  LiveStream
//
//  Created by 马彦春 on 2019/6/14.
//  Copyright © 2019 intj. All rights reserved.
//

#import "BACameraController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/Photos.h>

#import "SwitchMenuView.h"

@interface BACameraController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *openCamera;
@property (nonatomic, strong) UIButton *openPicture;
@end

@implementation BACameraController

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:RECT(20, 100, SCREEN_WIDTH-40, 200)];
        _imageView.image = [UIImage imageNamed:@"livestream"];
    }
    return _imageView;
}

- (UIButton *)openCamera {
    if (_openCamera == nil) {
        _openCamera = [UIButton buttonWithType:UIButtonTypeCustom];
        _openCamera.frame = RECT(MIN_X(self.imageView.frame), MAX_Y(self.imageView.frame)+20, GET_WIDTH(self.imageView.frame), 60);
        [_openCamera setTitle:@"open camera" forState:UIControlStateNormal];
        [_openCamera setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openCamera.tag = 1;
        _openCamera.backgroundColor = TOAST_VIEW_BACKGROUNDCOLOR;
    }
    return _openCamera;
}

- (UIButton *)openPicture {
    if (_openPicture == nil) {
        _openPicture = [UIButton buttonWithType:UIButtonTypeCustom];
        _openPicture.frame = RECT(MIN_X(self.openCamera.frame), MAX_Y(self.openCamera.frame)+20, GET_WIDTH(self.openCamera.frame), 60);
        [_openPicture setTitle:@"open picture" forState:UIControlStateNormal];
        [_openPicture setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openPicture.tag = 2;
        _openPicture.backgroundColor = TOAST_VIEW_BACKGROUNDCOLOR;
    }
    return _openPicture;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //隐藏底部tabBar
    if (![self.rdv_tabBarController isTabBarHidden]) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if ([self.rdv_tabBarController isTabBarHidden]) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"相机胶卷";
    [self addBackBarButtonItem];
    
    
    self.view.backgroundColor = MASTERCOLOR;
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.openCamera];
    [self.view addSubview:self.openPicture];
    
    [self.openCamera addTarget:self action:@selector(openSuccWith:) forControlEvents:UIControlEventTouchUpInside];
    [self.openPicture addTarget:self action:@selector(openSuccWith:) forControlEvents:UIControlEventTouchUpInside];
    
    SwitchMenuView *menu = [[SwitchMenuView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 200) itemCounts:@[@"sdf", @"sdfsddd"]];
    [menu setClickBlock:^(int index) {
        NSLog(@"%d", index);
    }];
    [self.view addSubview:menu];
    
}

// 打开相机/相册
- (void)openSuccWith:(UIButton *)btnFlag {
    // 初始化
    UIImagePickerController *photoPicker = [UIImagePickerController new];
    photoPicker.delegate = self;
    photoPicker.allowsEditing = YES;
    
    // 是否具有权限
    BOOL cameraUseable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    BOOL libraryUseable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    
    /*
     style1:
     AVAuthorizationStatus avStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
     
     avStatus 的4中类型:
     AVAuthorizationStatusNotDetermined  //
     AVAuthorizationStatusRestricted //  禁用
     AVAuthorizationStatusDenied //
     AVAuthorizationStatusAuthorized // 开通权限
     
     
     style2:
     PHAuthorizationStatus phStatus = [PHPhotoLibrary authorizationStatus];
     
     phStatus 有4中类型:
     PHAuthorizationStatusNotDetermined = 0
     PHAuthorizationStatusRestricted
     PHAuthorizationStatusDenied
     PHAuthorizationStatusAuthorized
     */
    
    switch (btnFlag.tag) {
        case 1:
        {
            if (cameraUseable) {
                photoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:photoPicker animated:YES completion:nil];
            }
        }
            break;
        case 2:
        {
            if (libraryUseable) {
                photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:photoPicker animated:YES completion:nil];
            }
        }
            break;
        default:
            break;
    }
    
}

- (void)guideUserOpenAuth{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请打开访问权限" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 引导用户设置
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    [alertC addAction:alertA];
    [alertC addAction:act];
    [self presentViewController:alertC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage * image;
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            //获取用户编辑之后的图像
            image = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            // 照片的元数据参数
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        // 压缩图片
        //        UIImage *compressImg = [self compressPictureWith:image];
        UIImage *compressImg = image;
        self.imageView.image = compressImg;
        //        NSLog(@"%@",NSStringFromCGSize(compressImg.size));
        // 用于上传
        NSData *tmpData = UIImageJPEGRepresentation(compressImg, 0.5);
        
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 压缩图片
- (UIImage *)compressPictureWith:(UIImage *)originnalImage{
    CGFloat ruleWidth = 600;
    if (originnalImage.size.width < ruleWidth) {
        return originnalImage;
    }
    
    CGFloat hight = ruleWidth/originnalImage.size.width * originnalImage.size.height;
    CGRect rect = CGRectMake(0, 0, ruleWidth, hight);
    // 开启图片上下文
    UIGraphicsBeginImageContext(rect.size);
    // 将图片渲染到图片上下文
    [originnalImage drawInRect:rect];
    // 获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    return img;
}

@end
