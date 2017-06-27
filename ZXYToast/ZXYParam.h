//
//  ZXYParam.h
//  ZXYToast
//
//  Created by Linyou-IOS-1 on 17/6/26.
//  Copyright © 2017年 TGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXYParam : NSObject
@property(nonatomic,assign)BOOL isVer;
@property(nonatomic,strong)NSString *content;
+(ZXYParam*)shareInterface;
-(BOOL)isiPadDevice;
@end
