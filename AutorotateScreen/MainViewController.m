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


#import <CoreMotion/CoreMotion.h> 

@interface MainViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView * videoWebView;

@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(CMMotionManager *)motionManager {
    if (_motionManager == nil) {
        _motionManager = [[CMMotionManager alloc] init];
    }
    return _motionManager;
}


- (void)startUpdateAccelerometerResult{
    if ([self.motionManager isAccelerometerAvailable] == YES) {
        [self.motionManager setAccelerometerUpdateInterval:0.06];
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
         {
             double x = accelerometerData.acceleration.x;
             double y = accelerometerData.acceleration.y;
             if (fabs(y) >= fabs(x))
             {
                 if (y >= 1){
                     //Down
                     NSLog(@"Down");
                 }
                 if(y<= -1){
                     //Portrait
                     NSLog(@"Portrait");
                 }
             }
             else
             {
                 if (x >= 1){
                     //Right
                     NSLog(@"Right");
                     
                     
                 }
                 if(x<= -1){
                     //Left
                     NSLog(@"Left");
                     [self ActionClick];
                 }
             }
         }];
    }
}

- (void)stopUpdate
{
    if ([self.motionManager isAccelerometerActive] == YES)
    {
        [self.motionManager stopAccelerometerUpdates];
    }
}

- (void)dealloc
{
    _motionManager = nil;
}







- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.view.backgroundColor = [UIColor whiteColor];

    [self startUpdateAccelerometerResult];
    
    
    
    //退出全屏
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endFullScreen) name:UIWindowDidBecomeHiddenNotification object:nil];
    //将要进入全屏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startFullScreen) name:UIWindowDidResignKeyNotification object:nil];

}
-(void)startFullScreen {
    NSLog(@"---------startFullScreen");
    UIApplication *application=[UIApplication sharedApplication];
    [application setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI/2);
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    application.keyWindow.bounds = CGRectMake(0, 0, frame.size.height , frame.size.width);
    
    
    
    
    
    
}

-(void)endFullScreen {
    NSLog(@"---------endFullScreenXXXXXXX");
    UIApplication *application=[UIApplication sharedApplication];
    [application setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI * 2);
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    application.keyWindow.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
}


-(void)initView {
    self.videoWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.videoWebView.backgroundColor = [UIColor redColor];
    self.videoWebView.delegate = self;
    [self.view addSubview:self.videoWebView];
    self.videoWebView.allowsInlineMediaPlayback = YES;
    //NSString * url = @"http://192.168.1.146:3000/video.html";
    NSString * url = [[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil];
    
    [self.videoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 500, 200, 50);
    btn.backgroundColor= [ UIColor redColor];
//    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(ActionClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//-(void)nslayout {
//    // Width constraint
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.videoWebView
//                                                          attribute:NSLayoutAttributeWidth
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeWidth
//                                                         multiplier:1
//                                                           constant:0]];
//    
//    // Height constraint
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.videoWebView
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:1
//                                                           constant:0]];
//    
//    // Center horizontally
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.videoWebView
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
//    // Center vertically
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.videoWebView
//                                                          attribute:NSLayoutAttributeCenterY
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterY
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//}




-(void)customFullScreen {
    UIApplication *application=[UIApplication sharedApplication];
    [application setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];
    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI/2);
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    application.keyWindow.bounds = CGRectMake(0, 0,frame.size.height, frame.size.width);

}


/**播放*/
-(void)ActionClick {
    /**接受完传值之后，oc给js传入函数值，带参数的*/
    NSString * func = [NSString stringWithFormat:@"requestFullScreen();"];
    [self.videoWebView stringByEvaluatingJavaScriptFromString:func];
}








//***********************************
- (BOOL)shouldAutorotate{
    return YES;
}
/**获取当前window*/
- (UIWindow *)getCurrentWindowView {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    return window;
}




@end
