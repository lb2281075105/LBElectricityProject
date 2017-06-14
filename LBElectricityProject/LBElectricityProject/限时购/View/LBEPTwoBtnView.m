//
//  LBEPTwoBtnView.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPTwoBtnView.h"

@implementation LBEPTwoBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBtns];
    }
    return self;
}

- (void)addBtns{
    ///添加第一个按钮
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame = CGRectMake(0, 0, [UIScreen cz_screenWidth] / 2.0 , 50);
    [_btn1 setTitle:@"  新品团购" forState:UIControlStateNormal];
    [_btn1 setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标未选中"] forState:(UIControlStateNormal)];
    [_btn1 setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标"] forState:(UIControlStateSelected)];
    [_btn1 setTitleColor:[UIColor cz_colorWithRed:56 green:166 blue:243] forState:(UIControlStateNormal)];
    [_btn1 setTitleColor:[UIColor cz_colorWithRed:213 green:48 blue:34] forState:(UIControlStateSelected)];
    _btn1.selected = YES;
    
    ///添加第二个按钮
    _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame = CGRectMake([UIScreen cz_screenWidth] / 2.0, 0, [UIScreen cz_screenWidth] / 2.0, 50);
    [_btn2 setTitle:@"  品牌团购" forState:UIControlStateNormal];
    [_btn2 setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标"] forState:(UIControlStateNormal)];
    [_btn2 setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标选中"] forState:(UIControlStateSelected)];
    [_btn2 setTitleColor:[UIColor cz_colorWithRed:56 green:166 blue:243] forState:(UIControlStateNormal)];
    [_btn2 setTitleColor:[UIColor cz_colorWithRed:213 green:48 blue:34] forState:(UIControlStateSelected)];
    _btn2.selected = NO;
    
    [self addSubview:_btn1];
    [self addSubview:_btn2];
}
@end
