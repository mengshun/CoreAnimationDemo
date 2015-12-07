//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by MS on 15/11/30.
//  Copyright © 2015年 孟顺. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.titleArray = @[@"LineAnimationViewController",
                        @"DemoViewController",
                        @"TestViewController",
                        @"PlayAnimationViewController",
                        @"TransitionAnimationTransition",
                        @"RulerDemoViewController",
                        ];
    
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSArray *tableViewHConstraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(_tableView)];
    id topGuide = self.topLayoutGuide;
    NSArray *tableViewVConstraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-0-[_tableView]-0-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(_tableView,topGuide)];
    
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObjectsFromArray:tableViewHConstraintsArray];
    [constraintArray addObjectsFromArray:tableViewVConstraintsArray];
    [self.view addConstraints:constraintArray];

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[NSClassFromString(self.titleArray[indexPath.row]) new] animated:YES];
    
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _tableView;
}

@end
