//
//  AppDelegate.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/5/3.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "AppDelegate.h"
#import "LBEPTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[LBEPTabBarController alloc]init];
    return YES;
}
@end
