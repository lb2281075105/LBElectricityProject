//
//  LBEPFirstTVCell.h
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBEPPurchaseModel.h"

@interface LBEPFirstTVCell : UITableViewCell
///图片
@property (strong, nonatomic) UIImageView *iconImage;
///国旗
@property (strong, nonatomic) UIImageView *countryImage;
///标题
@property (strong, nonatomic) UILabel *titleLabel;
///内容
@property (strong, nonatomic) UILabel *contentLabel;
///价格
@property (strong, nonatomic) UILabel *pricLabel;
///购物车按钮
@property (strong, nonatomic) UIButton *buyCarBtn;
///模型
@property (strong, nonatomic) LBEPPurchaseModel *purchaseModel;

@end
