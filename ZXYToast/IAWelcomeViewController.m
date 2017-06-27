//
//  IAWelcomeViewController.m
//  iiappleSDK
//
//  Created by stefan on 14-7-14.
//  Copyright (c) 2014年 stefan. All rights reserved.
//

#import "IAWelcomeViewController.h"
#import "ZXYParam.h"
#define  windowWidth ([UIScreen mainScreen].bounds.size.width)
#define  windowHight ([UIScreen mainScreen].bounds.size.height)
@interface IAWelcomeViewController ()

@end

@implementation IAWelcomeViewController
@synthesize welcomeView=_welcomeView;
@synthesize welcomeLabel;

- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization

    }
    return self;
}

-(void)updateWelcomeLabel
{
    self.welcomeLabel.text=[ZXYParam shareInterface].content;
    
    CGFloat labelWidth=[[ZXYParam shareInterface] isiPadDevice]?300:200;
    CGFloat labelHeight=[[ZXYParam shareInterface] isiPadDevice]?55:40;
    CGRect welcomeRect=_welcomeView.frame;
    welcomeRect.origin.x=(windowWidth-labelWidth)/2.0;
    welcomeRect.origin.y=0;
    
    if (![ZXYParam shareInterface].isVer) {
            if ([UIApplication sharedApplication].statusBarOrientation ==3) {
                welcomeRect.origin.y=windowHight-labelHeight;
            }
    }
    
    welcomeRect.size.width=labelWidth;
    welcomeRect.size.height=labelHeight;
    _welcomeView.frame=welcomeRect;
    welcomeLabel.frame=CGRectMake(0, 0, _welcomeView.frame.size.width, labelHeight);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.welcomeView=[[UIView alloc]initWithFrame:CGRectZero];

    _welcomeView.backgroundColor=[UIColor blackColor];
    
    _welcomeView.layer.cornerRadius=6;
    _welcomeView.clipsToBounds=YES;
    
    CGFloat font=[[ZXYParam shareInterface] isiPadDevice]?20:13;
    self.welcomeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    welcomeLabel.backgroundColor=[UIColor clearColor];
    //welcomeLabel.textColor=[UIColor whiteColor];
    welcomeLabel.textColor=[UIColor whiteColor];
    welcomeLabel.textAlignment=NSTextAlignmentCenter;
    welcomeLabel.font=[UIFont systemFontOfSize:font];
    [_welcomeView addSubview:welcomeLabel];
    
    CGFloat labelWidth=[[ZXYParam shareInterface] isiPadDevice]?300:200;
    CGFloat labelHeight=[[ZXYParam shareInterface] isiPadDevice]?55:40;
    
    CGRect welcomeRect=_welcomeView.frame;
    welcomeRect.origin.x=(windowWidth-labelWidth)/2.0;
    welcomeRect.origin.y=0;
    welcomeRect.size.width=labelWidth;
    welcomeRect.size.height=labelHeight;
    _welcomeView.frame=welcomeRect;
    welcomeLabel.frame=CGRectMake(0, 0, _welcomeView.frame.size.width, labelHeight);
    [self.view addSubview:_welcomeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)prefersStatusBarHidden
{
    return YES;
}



-(NSUInteger)supportedInterfaceOrientations
{
    if ([ZXYParam shareInterface].isVer) {
        
        return UIInterfaceOrientationMaskPortrait;
    }
    
    return UIInterfaceOrientationMaskLandscape;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if ([ZXYParam shareInterface].isVer) {
        return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
    }
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}


@end
