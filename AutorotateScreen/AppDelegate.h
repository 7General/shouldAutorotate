//
//  AppDelegate.h
//  AutorotateScreen
//
//  Created by 王会洲 on 16/10/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
    BOOL _isFull; // 是否全屏
    
}
@property (nonatomic)BOOL isFull;
@property (strong, nonatomic) UIWindow *window;


@end

