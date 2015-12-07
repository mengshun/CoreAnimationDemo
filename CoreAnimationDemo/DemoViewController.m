//
//  DemoViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/1.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "DemoViewController.h"

@implementation CALayer (Additions)
- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end




@interface DemoViewController ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *twiceTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;
@property (weak, nonatomic) IBOutlet UIView *buttonActionView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;

- (IBAction)panGestureAction:(id)sender;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.forgetButton.hidden = YES;
    
    UIView *firstWhiteView = [[UIView alloc]initWithFrame:self.titleLabel.bounds];
    firstWhiteView.backgroundColor = [UIColor whiteColor];
    [self.titleLabel addSubview:firstWhiteView];
    
    UIView *twiceWhiteView = [[UIView alloc]initWithFrame:self.twiceTitleLabel.bounds];
    twiceWhiteView.backgroundColor = [UIColor whiteColor];
    [self.twiceTitleLabel addSubview:twiceWhiteView];

    
    UIView *thirdWhiteView = [[UIView alloc]initWithFrame:self.thirdLabel.bounds];
    thirdWhiteView.backgroundColor = [UIColor whiteColor];
    [self.thirdLabel addSubview:thirdWhiteView];
    
    
    
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect = self.titleLabel.bounds;
        rect.origin.x = CGRectGetWidth(self.titleLabel.frame);
        firstWhiteView.frame = rect;
        
    } completion:^(BOOL finished) {
        [firstWhiteView removeFromSuperview];
        
        [UIView animateWithDuration:0.5f animations:^{
            CGRect rect = self.twiceTitleLabel.bounds;
            rect.origin.x = CGRectGetWidth(self.twiceTitleLabel.frame);
            twiceWhiteView.frame = rect;
            
        } completion:^(BOOL finished) {
            [twiceWhiteView removeFromSuperview];
            
            [UIView animateWithDuration:0.5f animations:^{
                CGRect rect = self.thirdLabel.bounds;
                rect.origin.x = CGRectGetWidth(self.thirdLabel.frame);
                thirdWhiteView.frame = rect;
                
            } completion:^(BOOL finished) {
                [thirdWhiteView removeFromSuperview];
                
                [self animationButton];
                
                
            }];
            
            
            
        }];
        
        
    }];


    
    // Do any additional setup after loading the view from its nib.
}
- (void)animationButton{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.bottomLayout.constant = 0;
        [self.view layoutIfNeeded];

        
    } completion:^(BOOL finished) {
        self.forgetButton.hidden = NO;
    }];
    
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

- (IBAction)panGestureAction:(id)sender {
    UIPanGestureRecognizer *action = sender;
    static CGPoint startCenterPoint;
    if (action.state == UIGestureRecognizerStateBegan) {
        DDLogInfo(@"began");
        startCenterPoint = action.view.center;
        [action.view.layer removeAnimationForKey:@"changeAnimation"];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
        animation.duration = 0.5;
        animation.autoreverses = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [action.view.layer addAnimation:animation forKey:@"changeAnimation"];
        
        
    } else if (action.state == UIGestureRecognizerStateEnded) {
         DDLogInfo(@"end");
         [action.view.layer removeAnimationForKey:@"changeAnimation"];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.duration = 0.5;
        animation.autoreverses = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [action.view.layer addAnimation:animation forKey:@"changeAnimation"];
    } else {
        
    }
    CGPoint changePoint = [action translationInView:self.view];
    action.view.center = CGPointMake(startCenterPoint.x+changePoint.x, startCenterPoint.y);
    
}
@end
