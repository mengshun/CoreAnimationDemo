//
//  TestViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/1.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UIView *firstView;

@property (weak, nonatomic) IBOutlet UIView *centerBackGroundView;
@property (weak, nonatomic) IBOutlet UIView *animationView;

- (IBAction)stopAction:(id)sender;
- (IBAction)startAction:(id)sender;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centerBackGroundView.layer.borderColor = [UIColor greenColor].CGColor;
    self.centerBackGroundView.layer.borderWidth = 2.0f;
    
    self.firstView.layer.cornerRadius = 7;
    self.firstView.layer.masksToBounds = YES;
    
    //    [self addAnimationGroup];
    [self addNewAnimationGroup];
    
    [self addAnimationViewWithLayer:self.animationView.layer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)addAnimationViewWithLayer:(CALayer *)layer{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    [bezierPath addQuadCurveToPoint:CGPointMake(0, 568) controlPoint:CGPointMake(600, 300)];
    [bezierPath addLineToPoint:CGPointMake(200, 480)];
    [bezierPath addLineToPoint:CGPointMake(200, 480)];
       [bezierPath addLineToPoint:CGPointMake(0, 0)];

    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.path = bezierPath.CGPath;
    positionAnimation.removedOnCompletion = NO;
    [positionAnimation setDuration:5];
    [positionAnimation setRepeatCount:100];
    
    
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 1)];
    scaleAnim.repeatCount = 100;
    scaleAnim.removedOnCompletion = YES;
    scaleAnim.duration = 2.0f;
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:positionAnimation, scaleAnim, nil];
    group.duration = 5;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [group setRepeatCount:100];
    
    
    
    
    [layer addAnimation:group forKey:nil];
    
    
    
    
}

- (void)addAnimationGroup{
    
    /*
     CAAnimation
     CAAnimationGroup
     */
    //贝塞尔曲线路径
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:CGPointMake(10.0, 10.0)];
    [movePath addQuadCurveToPoint:CGPointMake(100, 300) controlPoint:CGPointMake(300, 100)];
    
    //关键帧动画（位置）
    CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    posAnim.path = movePath.CGPath;
    posAnim.removedOnCompletion = YES;
    
    //缩放动画
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    
    //透明动画
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    //动画组
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:posAnim, scaleAnim, opacityAnim, nil];
    animGroup.duration = 5;
    
    [self.firstView.layer addAnimation:animGroup forKey:nil];
    
    
}


- (void)addNewAnimationGroup{
    
    [self.view bringSubviewToFront:self.centerBackGroundView];
    
    CGRect rect  = self.centerBackGroundView.frame;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,CGRectGetMinX(rect)-5,CGRectGetMinY(rect)-5);
    CGPathAddLineToPoint(path,NULL,CGRectGetMaxX(rect)+5,CGRectGetMinY(rect)-5);
    CGPathAddLineToPoint(path,NULL,CGRectGetMaxX(rect)+5,CGRectGetMaxY(rect)+5);
    CGPathAddLineToPoint(path,NULL,CGRectGetMinX(rect)-5,CGRectGetMaxY(rect)+5);
    CGPathAddLineToPoint(path,NULL,CGRectGetMinX(rect)-5,CGRectGetMinY(rect)-5);



    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    [pathAnimation setValues:@[[NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(rect)-5,CGRectGetMinY(rect)-5)],
//                               [NSValue valueWithCGPoint:CGPointMake(CGRectGetMaxX(rect)+5,CGRectGetMinY(rect)-5)],
//                               [NSValue valueWithCGPoint:CGPointMake(CGRectGetMaxX(rect)+5,CGRectGetMaxY(rect)+5)],
//                               [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(rect)-5,CGRectGetMaxY(rect)+5)],
//                               [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(rect)-5,CGRectGetMinY(rect)-5)]
//                               ]];
    [pathAnimation setPath:path];
    CGPathRelease(path);
    [pathAnimation setDuration:5.0f];
//    [pathAnimation setCalculationMode:kCAAnimationLinear];
    [pathAnimation setKeyTimes:@[[NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.1],
                                 [NSNumber numberWithFloat:0.3],
                                 [NSNumber numberWithFloat:0.6],
                                 [NSNumber numberWithFloat:1],
                                 ]];
//    [pathAnimation setAutoreverses:YES];
    [pathAnimation setRepeatCount:100];
    [self.firstView.layer addAnimation:pathAnimation forKey:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startAction:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopAction:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    
    
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

- (IBAction)stopAction:(id)sender {
    CFTimeInterval pauseTime = [self.firstView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.firstView.layer.speed = 0;
    self.firstView.layer.timeOffset = pauseTime;
    
}

- (IBAction)startAction:(id)sender {
    CFTimeInterval pauseTime = [self.firstView.layer timeOffset];
    self.firstView.layer.speed = 1;
    self.firstView.layer.timeOffset = 0;
    self.firstView.layer.beginTime = 0;
    CFTimeInterval pauseSinceTime = [self.firstView.layer convertTime:CACurrentMediaTime() fromLayer:nil]-pauseTime;
    self.firstView.layer.beginTime = pauseSinceTime;
    
}
@end
