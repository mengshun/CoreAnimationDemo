//
//  RulerDemoViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/12/4.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "RulerDemoViewController.h"

@interface RulerDemoViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UILabel *showRulerValueLabel;
@property (nonatomic,strong)UIView *rulerView;

@end

@implementation RulerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    self.showRulerValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 100, 100, 30)];
    self.showRulerValueLabel.text = @"0.00 cm";
    [self.view addSubview:self.showRulerValueLabel];
    
    
    
    
    
    
    
    self.rulerView = [[UIView alloc]init];
    self.rulerView.backgroundColor = [UIColor lightGrayColor];
    self.rulerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.rulerView];
    

    
    UIScrollView *rulerScrollView = [[UIScrollView alloc]init];
    rulerScrollView.delegate = self;
    rulerScrollView.showsVerticalScrollIndicator = NO;
    rulerScrollView.backgroundColor = [UIColor whiteColor];
    rulerScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rulerView addSubview:rulerScrollView];
    
    
    UIView *pointView = [[UIView alloc]init];
    pointView.backgroundColor = [UIColor blackColor];
    pointView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rulerView addSubview:pointView];
    
    /*
     0 1 2 3 4 为 10像素
     中间的 为 7 像素
     最小的为4像素
     */
    
    int count = 1000;
    for (int i = 0; i<=count; i++) {
        UIView *tempView = [[UIView alloc]init];
        tempView.backgroundColor = [UIColor blackColor];
        if (i%10 == 0) {
            tempView.frame = CGRectMake(70, 10+5*i, 10, 1);
            
            UILabel *countLable = [[UILabel alloc]initWithFrame:CGRectMake(35, 10+5*i-6, 30, 12)];
            countLable.textAlignment = NSTextAlignmentRight;
            countLable.font = [UIFont systemFontOfSize:12];
            countLable.textColor = [UIColor blackColor];
            countLable.text = [NSString stringWithFormat:@"%d",(i+1)/10];
            [rulerScrollView addSubview:countLable];
            
        } else if (i%5 == 0) {
            tempView.frame = CGRectMake(73, 10+5*i, 7, 1);
        } else {
            tempView.frame = CGRectMake(76, 10+5*i, 4, 1);
        }
        [rulerScrollView addSubview:tempView];
    }
    
    rulerScrollView.contentSize = CGSizeMake(80, count*5+20);
    
    
    
    
    id topGuide = self.topLayoutGuide;
    
    
    NSMutableArray *layoutArray = [NSMutableArray array];
    
    NSArray *rulerVArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-0-[_rulerView]-0-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(_rulerView,topGuide)];
    
    NSArray *rulerHArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_rulerView(100)]"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:NSDictionaryOfVariableBindings(_rulerView,topGuide)];
    
    
    
    NSArray *rulerScrollViewVArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rulerScrollView]-0-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:NSDictionaryOfVariableBindings(rulerScrollView)];
    
    NSArray *rulerScrollViewHArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[rulerScrollView(80)]-0-[pointView]-0-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:NSDictionaryOfVariableBindings(rulerScrollView,pointView)];
    
    NSLayoutConstraint *pointViewHeight = [NSLayoutConstraint constraintWithItem:pointView
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeHeight
                                                                      multiplier:0
                                                                        constant:1];
    NSLayoutConstraint *pointViewTopY = [NSLayoutConstraint constraintWithItem:pointView
                                                                        attribute:NSLayoutAttributeTop
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.rulerView
                                                                        attribute:NSLayoutAttributeTop
                                                                       multiplier:1
                                                                         constant:10];
    
    
    [layoutArray addObjectsFromArray:rulerHArray];
    [layoutArray addObjectsFromArray:rulerVArray];
    
    
    [layoutArray addObjectsFromArray:rulerScrollViewVArray];
    [layoutArray addObjectsFromArray:rulerScrollViewHArray];
    
    [layoutArray addObject:pointViewHeight];
    [layoutArray addObject:pointViewTopY];
    
    
    [self.view addConstraints:layoutArray];
    
    
    // Do any additional setup after loading the view.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    float value = point.y/5.0/10.0 <0 ? 0 : point.y/5.0/10.0;
    self.showRulerValueLabel.text = [NSString stringWithFormat:@"%.2f cm",value];
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
