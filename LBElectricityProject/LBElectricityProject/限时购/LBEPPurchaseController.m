//
//  LBEPPurchaseController.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/5/3.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPPurchaseController.h"
#import "SDCycleScrollView.h"
#import "LBEPTwoBtnView.h"
#import "LBEPDownTableView.h"
#import "LBEPPurchaseModel.h"
///mj数据转模型
#import "MJExtension.h"

@interface LBEPPurchaseController ()<UIScrollViewDelegate>
///最底层滑动视图
@property (strong, nonatomic) UIScrollView *downScrollView;
///轮播图
@property (strong, nonatomic) SDCycleScrollView *topScrollView;
///中间切换列表的按钮
@property (strong, nonatomic) LBEPTwoBtnView *twoBtnView;
///单品团购
@property (strong, nonatomic) LBEPDownTableView *firstTableView;
///品牌团购
@property (strong, nonatomic) LBEPDownTableView *secondTableView;
///存放新品数据模型的数组
@property (strong, nonatomic) NSArray *firstModelArray;
///存放团购数据模型的数组
@property (strong, nonatomic) NSArray *secondModelArray;
@end

@implementation LBEPPurchaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cz_colorWithRed:242 green:242 blue:242];
    [self addSubViews];
    [self addFirstTVData];
}

- (void)addSubViews{
    ///最底层滑动视图
    _downScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], [UIScreen cz_screenHeight] - 64 - 49)];
    _downScrollView.contentSize = CGSizeMake(0, 1980);
    _downScrollView.delegate = self;
    
    ///轮播图
    _topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], 230) delegate:nil placeholderImage:[UIImage imageNamed:@"图标1"]];
    _topScrollView.backgroundColor = [UIColor orangeColor];
    _topScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _topScrollView.currentPageDotColor = [UIColor whiteColor];
    _topScrollView.imageURLStringsGroup = @[@"图标1",@"图标2",@"图标3",@"图标4"];
    ///单品团购
    _firstTableView = [[LBEPDownTableView alloc]initWithFrame:CGRectMake(0, 280, [UIScreen cz_screenWidth], 1700) style:(UITableViewStylePlain)];
    _firstTableView.bounces = NO;
    _firstTableView.isFirst = YES;
    
    ///品牌团购
    _secondTableView = [[LBEPDownTableView alloc]initWithFrame:CGRectMake([UIScreen cz_screenWidth], 280, [UIScreen cz_screenHeight], 1700) style:(UITableViewStylePlain)];
    _secondTableView.bounces = NO;
    _secondTableView.isFirst = NO;
    
    ///中间切换列表的视图
    _twoBtnView = [[LBEPTwoBtnView alloc]initWithFrame:CGRectMake(0, 230, [UIScreen cz_screenWidth], 50)];
    _twoBtnView.backgroundColor = [UIColor whiteColor];
    [_twoBtnView.btn2 addTarget:self action:@selector(twoBtnViewFrameMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [_twoBtnView.btn1 addTarget:self action:@selector(twoBtnViewFrameMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.downScrollView];
    [self.downScrollView addSubview:self.topScrollView];
    [self.downScrollView addSubview:self.firstTableView];
    [self.downScrollView addSubview:self.secondTableView];
    [self.downScrollView addSubview:self.twoBtnView];
}
- (void)addFirstTVData{

    _firstModelArray = [LBEPPurchaseModel mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LBEPFirstTablePlist" ofType:@"plist"]]];
    
    self.firstTableView.firstModelArray = _firstModelArray;
    
    NSLog(@"%@",_firstModelArray);
}
- (void)twoBtnViewFrameMethod:(UIButton *)button{
    
    if (button == _twoBtnView.btn1) {
        
        button.selected = YES;
        _twoBtnView.btn2.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect1 = _firstTableView.frame;
            rect1.origin.x = 0;
            _firstTableView.frame = rect1;
            
            CGRect rect2 = _secondTableView.frame;
            rect2.origin.x = [UIScreen cz_screenWidth];
            _secondTableView.frame = rect2;
            _downScrollView.contentSize = CGSizeMake(0, 4 * 170 + 280);
        }];
    }else {
        
        button.selected = YES;
        _twoBtnView.btn1.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect1 = _firstTableView.frame;
            rect1.origin.x = - [UIScreen cz_screenWidth];
            _firstTableView.frame = rect1;
            
            CGRect rect2 = _secondTableView.frame;
            rect2.origin.x = 0;
            _secondTableView.frame = rect2;
            _downScrollView.contentSize = CGSizeMake(0, 4 * 200 + 280);
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 230){
        CGRect rect = _twoBtnView.frame;
        rect.origin.y = scrollView.contentOffset.y;
        _twoBtnView.frame = rect;
    }else{
        CGRect rect = _twoBtnView.frame;
        rect.origin.y = 230;
        _twoBtnView.frame = rect;
    }
}


@end
