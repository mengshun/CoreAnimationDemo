//
//  TransitionAnimationTransition.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/3.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "TransitionAnimationTransition.h"

@interface TransitionAnimationTransition ()

@property (nonatomic,strong) UIImageView *transitionView;

@end

@implementation TransitionAnimationTransition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.transitionView = [[UIImageView alloc]init];
    self.transitionView.bounds = self.view.bounds;
    self.transitionView.center = self.view.center;
    self.transitionView.image = [UIImage imageNamed:@"IMG_0997.JPG"];
    self.transitionView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.transitionView];
    
    
    [self addTransitionViewAnimationWithLayer:self.transitionView.layer];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.transitionView.layer removeAllAnimations];
    
    
}
- (void)addTransitionViewAnimationWithLayer:(CALayer *)layer{
    CGRect rect = layer.bounds;
    layer.position = CGPointMake(CGRectGetWidth(rect)*1.5, CGRectGetHeight(rect)/2.0);
    
    CAKeyframeAnimation *positionKeyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionKeyAnimation.values = @[[NSValue valueWithCGPoint:layer.position],
                       [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(rect)/2.0, layer.position.y)],
                       ];
    positionKeyAnimation.autoreverses = NO;
    positionKeyAnimation.fillMode = kCAFillModeForwards;
    positionKeyAnimation.removedOnCompletion = NO;
    
    
    
    
    
    CAKeyframeAnimation *rotationKeyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationKeyAnimation.values = @[@0,
                                    @(M_PI*2),
                                    ];
    rotationKeyAnimation.autoreverses = NO;
    rotationKeyAnimation.fillMode = kCAFillModeForwards;
    rotationKeyAnimation.removedOnCompletion = NO;
    

    
    
    
    CAKeyframeAnimation *scaleKeyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleKeyAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 1)],
                                    [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],
                                    ];
    
    scaleKeyAnimation.autoreverses = NO;
    scaleKeyAnimation.fillMode = kCAFillModeForwards;
    scaleKeyAnimation.removedOnCompletion = NO;
    
    

    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[positionKeyAnimation,rotationKeyAnimation,scaleKeyAnimation];
    groupAnimation.duration = 2.0f;
    groupAnimation.autoreverses = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    
    
    [layer addAnimation:groupAnimation forKey:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
