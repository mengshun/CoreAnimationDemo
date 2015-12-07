//
//  PlayAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/2.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "PlayAnimationViewController.h"

@interface PlayAnimationViewController (){
    CAAnimationGroup *_group;
}

@property (weak, nonatomic) IBOutlet UIView *animationView;


@property (weak, nonatomic) IBOutlet UIView *centerPositionView;


@end

@implementation PlayAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.centerPositionView.layer.masksToBounds = YES;//中心绿色小圆
    self.centerPositionView.layer.cornerRadius = 5.0f;
    
    
    
    self.animationView.layer.masksToBounds = YES;//灰色背景圆
    self.animationView.layer.cornerRadius = 45.0f;
    
    [self animationWithLayer:self.animationView.layer];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)animationWithLayer:(CALayer *)layer{
    
    CAKeyframeAnimation * scaleAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]
                       ];
    scaleAnim.keyTimes = @[@(0),@(0.3),@(0.7),@(1)];
    scaleAnim.autoreverses = NO;
    scaleAnim.fillMode = kCAFillModeForwards;
    scaleAnim.removedOnCompletion = NO;
    
    
    
    
    CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    posAnim.values = @[[NSValue valueWithCGPoint:layer.position],
                       [NSValue valueWithCGPoint:layer.position],
                       [NSValue valueWithCGPoint:CGPointMake(layer.position.x+200, 400)],
                       [NSValue valueWithCGPoint:CGPointMake(layer.position.x+200, 400)]
                       ];
    posAnim.keyTimes = @[@(0),@(0.3),@(0.7),@(1)];
    posAnim.autoreverses = NO;
    posAnim.fillMode = kCAFillModeForwards;
    posAnim.removedOnCompletion = NO;
    
    
    _group = [CAAnimationGroup animation];
    _group.animations = @[scaleAnim,posAnim];
    _group.duration = 5.0f;
    _group.autoreverses = NO;
    _group.fillMode = kCAFillModeForwards;
    _group.removedOnCompletion = NO;
    _group.delegate = self;
    [layer addAnimation:_group forKey:nil];

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.animationView.layer removeAllAnimations];
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    DDLogInfo(@"%s",__func__);
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    DDLogInfo(@"%s",__func__);
    _group.delegate = nil;
}

@end
