//
//  ViewController.m
//  MakeScreenImageDemo
//
//  Created by CharlieLv on 2019/1/23.
//  Copyright © 2019 charlie. All rights reserved.
//

#import "ViewController.h"
#import "ToolClass.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-100, HEIGHT/2-15, 200, 30)];
    label.text = @" Hey handsome guy ~";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    //方法1
    UIImage * image = [ToolClass getScreenImage:self.view];
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);  // 存入相册，可以做其他操作
    
    //方法2
//    [ToolClass cutScreenWithView:self.view successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
//        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);  //可以做其他操作
//    }];
}


@end
