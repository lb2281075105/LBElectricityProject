//
//  LBEPNavController.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/5/3.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPNavController.h"

@interface LBEPNavController ()

@end

@implementation LBEPNavController
+(void)initialize{
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/// MARK --- pushViewController
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    
    [super pushViewController:viewController animated:animated];
}


@end
