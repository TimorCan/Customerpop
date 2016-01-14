//
//  ViewController.m
//  CustomerPopView
//
//  Created by juxi-ios on 16/1/14.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "ViewController.h"
#import "CustomerBottomView.h"
@interface ViewController ()
@property(nonatomic,strong)CustomerBottomView * popView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _popView = [[CustomerBottomView alloc]initWithArray:@[@"3",@"4",@"14",@"7",@"11",@"16",@"1",@"19"]];
    [self.view addSubview:_popView];
}
- (IBAction)popView:(id)sender {
    
   
    [_popView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
