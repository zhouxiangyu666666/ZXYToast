//
//  ViewController.m
//  ZXYToast
//
//  Created by Linyou-IOS-1 on 17/6/26.
//  Copyright © 2017年 TGSDK. All rights reserved.
//

#import "ViewController.h"
#import "ZXYParam.h"
#import "IAWindowManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  0代表横屏，1代表竖屏
    [ZXYParam shareInterface].isVer=0;
    //  吐丝提示框的内容
    [ZXYParam shareInterface].content=@"zhouxiangyu";
    //  弹出提示框
    [[IAWindowManager shareInterface] pushWelcomeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
