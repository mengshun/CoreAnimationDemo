//
//  DisappearView.h
//  CoreAnimationDemo
//
//  Created by MS on 15/12/1.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DisappearViewType) {
    DisappearViewTypeLable,
    DisappearViewTypeButton,
};


@interface DisappearView : UIView


- (instancetype)initWithType:(DisappearViewType) type;


@property (nonatomic,strong)NSString *title;

@end
