//
//  TestViewController.m
//  AutorotateScreen
//
//  Created by 王会洲 on 16/10/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TestViewController.h"
#import "MainViewController.h"

#import <CoreMotion/CoreMotion.h> 

@interface TestViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, strong) UIButton * btnClick;

//@property (nonatomic, strong) UIAccelerometer *accelerometer;
@end

@implementation TestViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
//    [self.navigationController.navigationBar  setHidden:NO];
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
                     self.btnClick.backgroundColor =[UIColor blueColor];
                     
                 }
                 if(x<= -1){
                     //Left
                     NSLog(@"Left");
                     self.btnClick.backgroundColor =[UIColor yellowColor];
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
    
    
    [self startUpdateAccelerometerResult];
    
    
//    self.accelerometer  = [UIAccelerometer sharedAccelerometer];
    //然后制定委托的对象是自己，设置检测频率
//    self.accelerometer.delegate = self;
//    self.accelerometer.updateInterval  = 1.0f / 30.0f ;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    btn.backgroundColor= [ UIColor redColor];
    
    [btn setTitle:@"浏览器" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    self.btnClick = btn;
    [btn addTarget:self action:@selector(popFunc) forControlEvents:UIControlEventTouchUpInside];
}
-(void)popFunc {
//    [self.navigationController popViewControllerAnimated:YES];
    MainViewController * main = [[MainViewController alloc] init];
    [self.navigationController pushViewController:main animated:YES];

}


//重力的值存在acceleration里面，例：GFloat a ＝ acceleration.x;
//如果要检测摇晃
//-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
//    if (fabsf (acceleration.x) > 1.0) {
//        //表示 X 軸方向大於 1 的時候就會發生某事
//        NSLog(@"accelerometer----:%f",acceleration.x);
//    }
//}

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
