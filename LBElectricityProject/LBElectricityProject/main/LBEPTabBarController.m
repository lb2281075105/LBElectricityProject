//
//  LBEPTabBarController.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/5/3.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPTabBarController.h"
#import "LBEPNavController.h"
#import "LBEPPurchaseController.h"
#import "LBEPClassifyController.h"
#import "LBEPShopCarController.h"
#import "LBEPMineController.h"
@interface LBEPTabBarController ()

@end

@implementation LBEPTabBarController
+(void)initialize{

    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor cz_colorWithHex:0x1FB7F2]} forState:UIControlStateSelected];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
}
    
- (void)addChildViewControllers{
    ///限时购
    [self addChildViewController:[[LBEPPurchaseController alloc]init] withNormalImage:@"菜单栏限时特卖按钮未选中状态" withSelectImage:@"菜单栏限时特卖按钮选中状态" withTitle:@"限时购"];
    ///分类
    [self addChildViewController:[[LBEPPurchaseController alloc]init] withNormalImage:@"菜单栏分类按钮未选中状态" withSelectImage:@"菜单栏分类按钮选中状态" withTitle:@"分类"];
    ///购物车
    [self addChildViewController:[[LBEPPurchaseController alloc]init] withNormalImage:@"菜单栏购物车按钮未选中状态" withSelectImage:@"菜单栏购物车按钮选中状态" withTitle:@"购物车"];
    ///我的
    [self addChildViewController:[[LBEPPurchaseController alloc]init] withNormalImage:@"菜单栏我的按钮未选中状态" withSelectImage:@"菜单栏我的按钮选中状态" withTitle:@"我的"];
}
///添加子控制器
- (void)addChildViewController:(UIViewController *)childController withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage withTitle:(NSString *)title{

    childController.tabBarItem.image = [UIImage imageNamed:normalImage];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    childController.title = title;
    
    LBEPNavController *nav = [[LBEPNavController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}
@end
