//
//  IAWindowManager.h
//  iiappleSDK
//
//  Created by stefan on 14-7-9.
//  Copyright (c) 2014年 stefan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IAWindowManager : NSObject

@property(nonatomic,strong)UIWindow* welcomeWindow;

@property(nonatomic,assign)BOOL isWCAnimationing;

@property(nonatomic,assign)UIWindow* currentShowWindow;

@property(nonatomic,assign)UIInterfaceOrientation currentOrientation;

+(IAWindowManager*)shareInterface;

-(void)pushWelcomeView;

-(void)reSetWelcomeWinFrame:(BOOL)isStart;


@end
