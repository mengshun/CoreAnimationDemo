//
//  MSFileLogger.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/7.
//  Copyright © 2015年 孟顺. All rights reserved.
//


#import "MSFileLogger.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"


@interface MSFileLogger (){
    
}

@end


@implementation MSFileLogger

static MSFileLogger *_logger = nil;


- (instancetype)init{
    @synchronized(self){
        if (!_logger) {
            _logger = [super init];
            [self configureLogger];
        }
        return _logger;
    }
}

+ (instancetype)configureLogger{
    @synchronized(self){
        if (!_logger) {
            _logger = [[self alloc]init];
        }
        return _logger;
    }
}

- (void)configureLogger{
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
  
    DDLogInfo(@"Path : %@",NSHomeDirectory());
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
}


void uncaughtExceptionHandler(NSException *exception) {
    DDLogInfo(@"description : %@",[exception description]);
    DDLogInfo(@"Stack trace addr: %@", [exception callStackReturnAddresses]);
    DDLogInfo(@"Stack Trace symbol: %@", [exception callStackSymbols]);
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    DDLogInfo(@"reason:%@ \nname: %@",reason,name);
}

@end
