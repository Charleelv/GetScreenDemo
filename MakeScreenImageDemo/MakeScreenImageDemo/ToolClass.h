//
//  ToolClass.h
//  MakeScreenImageDemo
//
//  Created by CharlieLv on 2019/1/23.
//  Copyright © 2019 charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolClass : NSObject

+ (void)cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;

+ (UIImage *)getScreenImage:(UIView*)view;



@end

NS_ASSUME_NONNULL_END
