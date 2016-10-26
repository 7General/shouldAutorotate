//
//  MainViewController.m
//  AutorotateScreen
//
//  Created by 王会洲 on 16/10/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "TestViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIWebView * videoWebView;
@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.view.backgroundColor = [UIColor grayColor];

    //退出全屏
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endFullScreen) name:UIWindowDidBecomeHiddenNotification object:nil];
    //将要进入全屏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startFullScreen) name:UIWindowDidResignKeyNotification object:nil];

}
-(void)startFullScreen {
    UIApplication *application=[UIApplication sharedApplication];
    [application setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI/2);
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    application.keyWindow.bounds = CGRectMake(0, 0, frame.size.height, frame.size.width);
}

-(void)endFullScreen {
    UIApplication *application=[UIApplication sharedApplication];
    [application setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI * 2);
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    application.keyWindow.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
}


-(void)initView {
    self.videoWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.videoWebView];
    self.videoWebView.allowsInlineMediaPlayback = YES;
    NSString * url =  [[NSBundle mainBundle] pathForResource:@"video.html" ofType:nil];
    [self.videoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 500, 200, 50);
    btn.backgroundColor= [ UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(ActionClick) forControlEvents:UIControlEventTouchUpInside];
   
}
-(void)ActionClick {
    //TestViewController * test = [[TestViewController alloc] init];
    //[self.navigationController pushViewController:test animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)videoStarted {
    NSLog(@"---------------rrrrrrrrrrrrrrrrrrrrrrr");
}



//***********************************
- (BOOL)shouldAutorotate{
    return YES;
}





@end
