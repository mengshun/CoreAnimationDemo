//
//  LineAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/11/30.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "LineAnimationViewController.h"

@interface LineAnimationViewController ()

@end

@implementation LineAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self addsubviews];
    
    // Do any additional setup after loading the view.
}

- (void)addsubviews{
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    
    
    
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(200, 200, 80, 80);
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:layer];
    layer.anchorPoint = CGPointMake(1, 1);
    
    layer.cornerRadius = 5;
    layer.masksToBounds = YES;
    
    
    layer.borderColor = [UIColor greenColor].CGColor;
    layer.borderWidth = 10;
    
    
    layer.shadowRadius = 10;
    layer.shadowColor = [UIColor redColor].CGColor;
    
    /*
     CAScrollLayer //是CALayer 的子类， 简化显示图层的一部分内容。
     CAScrollLayer 对象的滚动区域的范围在它的子图层里面定义。CAScrollLaye 不
     提供键盘或鼠标事件处理，也不提供可见的滚动条。
     CATextLayer //是CALayer 的子类， 简化显示图层的一部分内容。
     CAScrollLayer 对象的滚动区域的范围在它的子图层里面定义。CAScrollLaye 不
     提供键盘或鼠标事件处理，也不提供可见的滚动条。
     CATiledLayer //是CALayer 的子类， 简化显示图层的一部分内容。
     CAScrollLayer 对象的滚动区域的范围在它的子图层里面定义。CAScrollLaye 不
     提供键盘或鼠标事件处理，也不提供可见的滚动条。
     CAEAGLLayer //提供了一个OpenGLES 渲染环境
     
     
     
     CAAnimationGroup //允许一系列动画效果组合在一起，并行显示动
     CAPropertyAnimation //是一个抽象的子类，它支持动画的显示图层的关键路
     径中指定的属性
     CABasicAnimation //简单的为图层的属性提供修改。
     CAKeyframeAnimation //支持关键帧动画，你可以指定的图层属性的关键路径
     动画，包括动画的每个阶段的价值，以及关键帧时间和计时功能的一系列值。在
     动画运行时，每个值被特定的插入值替代。
     */
    

    
    
}




@end
