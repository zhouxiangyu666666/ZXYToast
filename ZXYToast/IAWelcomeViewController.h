//
//  IAWelcomeViewController.h
//  iiappleSDK
//
//  Created by stefan on 14-7-14.
//  Copyright (c) 2014年 stefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAWelcomeViewController : UIViewController

@property(nonatomic,retain)UIView* welcomeView;
@property(nonatomic,retain)UILabel* welcomeLabel;

- (id)init;
-(void)updateWelcomeLabel;

@end
