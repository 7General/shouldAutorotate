//
//  TestViewController.m
//  AutorotateScreen
//
//  Created by 王会洲 on 16/10/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TestViewController.h"
#import "MainViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
//    [self.navigationController.navigationBar  setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    btn.backgroundColor= [ UIColor redColor];
    
    [btn setTitle:@"浏览器" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(popFunc) forControlEvents:UIControlEventTouchUpInside];
}
-(void)popFunc {
//    [self.navigationController popViewControllerAnimated:YES];
    MainViewController * main = [[MainViewController alloc] init];
    [self.navigationController pushViewController:main animated:YES];

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
