//
//  MSFileLogger.h
//  CoreAnimationDemo
//
//  Created by MS on 15/12/7.
//  Copyright © 2015年 孟顺. All rights reserved.
//


/*
 
 LOG_LEVEL_VERBOSE  显示打印输出
 LOG_LEVEL_OFF      关闭DDLOG 的打印输出
 */

#define ddLogLevel LOG_LEVEL_VERBOSE


#import <Foundation/Foundation.h>
#import "DDLog.h"


@interface MSFileLogger : NSObject


+ (instancetype)configureLogger;

@end
