//
//  ViewController.m
//  ZFPageControl
//
//  Created by anxindeli on 16/10/8.
//  Copyright © 2016年 anxindeli. All rights reserved.
//

#import "ViewController.h"
#import "ZFPageControl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    //测试一下github更新是否有问题？
    ZFPageControl *zfControl = [[ZFPageControl alloc] initWithFrame:CGRectMake(0, 100, screenWidth, 20)];
    zfControl.numberOfPages = 5;
    [self.view addSubview:zfControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
