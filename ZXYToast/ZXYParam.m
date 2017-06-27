//
//  ZXYParam.m
//  ZXYToast
//
//  Created by Linyou-IOS-1 on 17/6/26.
//  Copyright © 2017年 TGSDK. All rights reserved.
//

#import "ZXYParam.h"
#import <UIKit/UIKit.h>
@implementation ZXYParam
#pragma mark-单例
+(ZXYParam*)shareInterface
{
    static ZXYParam* _shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager=[[ZXYParam alloc]init];
    });
    return _shareManager;
}
-(BOOL)isiPadDevice
{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}
@end
