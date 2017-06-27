//
//  IAWindowManager.m
//  iiappleSDK
//
//  Created by stefan on 14-7-9.
//  Copyright (c) 2014年 stefan. All rights reserved.
//

#import "IAWindowManager.h"
#import "IAWelcomeViewController.h"
#import "ZXYParam.h"
#define  windowWidth ([UIScreen mainScreen].bounds.size.width)
#define  windowHight ([UIScreen mainScreen].bounds.size.height)
#define KEYWINDOW [[UIApplication sharedApplication].windows objectAtIndex:0]
@interface IAWindowManager ()


@property(nonatomic,strong)IAWelcomeViewController* welcomeController;

@end

@implementation IAWindowManager


#pragma mark-单例
+(IAWindowManager*)shareInterface
{
    static IAWindowManager* _shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager=[[IAWindowManager alloc]init];
    });
    return _shareManager;
}


-(void)pushWelcomeView
{
    if (!_welcomeWindow) {
        self.welcomeWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }

    //    _welcomeWindow.hidden=YES;
    [self reSetWelcomeWinFrame:NO];
    _welcomeWindow.userInteractionEnabled=YES;
    _welcomeWindow.backgroundColor=[UIColor clearColor];
    _welcomeWindow.windowLevel = UIWindowLevelStatusBar + 7;
    
    if (!self.welcomeController) {
        self.welcomeController=[[IAWelcomeViewController alloc]init];
    }
    _welcomeWindow.rootViewController=_welcomeController;
    [_welcomeWindow makeKeyAndVisible];
    [_welcomeController updateWelcomeLabel];
    [self pushWelcomeWindows];
}
-(void)pushWelcomeWindows
{
    self.isWCAnimationing=YES;
    [self welcomeViewAnimation:YES];
}

-(void)reSetWelcomeWinFrame:(BOOL)isStarts
{
    CGFloat height=[[ZXYParam shareInterface] isiPadDevice]?55:40;
    
    UIInterfaceOrientation tempOrientation;
    if (self.currentOrientation) {
        tempOrientation=self.currentOrientation;
    }else{
        tempOrientation=[UIApplication sharedApplication].statusBarOrientation;
    }
    if ([[UIDevice currentDevice].systemVersion floatValue]<8.0) {
        if ([ZXYParam shareInterface].isVer)
        {
            if (isStarts) {
                _welcomeWindow.frame=CGRectMake(0,0,windowWidth,height);
            }else{
                _welcomeWindow.frame=CGRectMake(0, -height*2,windowWidth,height);
            }
        }else{
            if (isStarts) {
                if (tempOrientation ==UIDeviceOrientationLandscapeLeft) {
                    _welcomeWindow.frame=CGRectMake(windowHight-height, 0, height,windowWidth);
                }
                if (tempOrientation ==UIDeviceOrientationLandscapeRight) {
                    _welcomeWindow.frame=CGRectMake(0,0,height,windowWidth);
                }
            }else{
                if (tempOrientation ==UIDeviceOrientationLandscapeLeft) {
                    _welcomeWindow.frame=CGRectMake(windowHight,0,height,windowWidth);
                }
                if (tempOrientation ==UIDeviceOrientationLandscapeRight) {
                    _welcomeWindow.frame=CGRectMake(-height, 0, height, windowWidth);
                }
            }
        }
    }else{
        if ([ZXYParam shareInterface].isVer||tempOrientation ==UIDeviceOrientationLandscapeRight) {
            if (isStarts) {
                _welcomeWindow.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,height);
            }else{
                _welcomeWindow.frame=CGRectMake(0, -height, [UIScreen mainScreen].bounds.size.width,height);
            }
        }else{
            if (tempOrientation ==UIDeviceOrientationLandscapeLeft) {
                if (isStarts) {
                    _welcomeWindow.frame=CGRectMake(0,-windowHight+height,height,windowWidth);
                }else{
                    _welcomeWindow.frame=CGRectMake(0,-windowHight, height, windowWidth);
                }
            }
            if (tempOrientation ==UIDeviceOrientationLandscapeRight) {
                if (isStarts) {
                    _welcomeWindow.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,height);
                }else{
                    _welcomeWindow.frame=CGRectMake(0, -height, [UIScreen mainScreen].bounds.size.width,height);
                }
            }
        }
    }
}

-(void)welcomeViewAnimation:(BOOL)isStart
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    if (isStart) {
        _welcomeWindow.hidden=NO;
        
        [UIView setAnimationDidStopSelector:@selector(welcomeAnimationStop)];
    }
    else{
        [UIView setAnimationDidStopSelector:@selector(welcomeStop)];
    }
    [self reSetWelcomeWinFrame:isStart];
    
    [UIView commitAnimations];
}
-(void)welcomeAnimationStop
{
    [self performSelector:@selector(welcomeAnimationStopAction) withObject:nil afterDelay:3];
}

-(void)welcomeStop
{
    _welcomeWindow.hidden=YES;
    self.isWCAnimationing=NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
    
}

-(void)welcomeAnimationStopAction
{
    [self welcomeViewAnimation:NO];
}

-(void)showWindow:(UIWindow*)window
{
    [window makeKeyAndVisible];
    [window makeKeyWindow];
}

@end
