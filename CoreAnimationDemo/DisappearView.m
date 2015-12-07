//
//  DisappearView.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/1.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "DisappearView.h"

@interface DisappearView (){
    DisappearViewType _type;
}

@end

@implementation DisappearView


- (instancetype)initWithType:(DisappearViewType) type{
    if (self = [super initWithFrame:CGRectZero]) {
        _type = type;
        [self initViewWithType:type];
    }
    return self;
}

- (void)initViewWithType:(DisappearViewType) type{
    switch (type) {
        case DisappearViewTypeLable:
        {
            
        }
            break;
        case DisappearViewTypeButton:
        {
            
        }
            break;
        default:
            break;
    }
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    
    
}


@end
