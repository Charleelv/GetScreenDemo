//
//  ToolClass.m
//  MakeScreenImageDemo
//
//  Created by CharlieLv on 2019/1/23.
//  Copyright © 2019 charlie. All rights reserved.
//

#import "ToolClass.h"


@implementation ToolClass

+(UIImage *)getScreenImage:(UIView*)view{
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    
    //    UIGraphicsBeginImageContext(CGSizeMake(width, height));  // 适用于iOS6
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), true, [[UIScreen mainScreen] scale]); // iOS7及以后
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return image;
}

+ (void)cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block{
    //1、开启上下文
    //    UIGraphicsBeginImageContext(view.bounds.size);  // ios 6
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, [[UIScreen mainScreen] scale]); // iOS7及以后
    
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.截屏
    [view.layer renderInContext:ctx];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    //7.回调
    block(newImage,data);
}


@end
