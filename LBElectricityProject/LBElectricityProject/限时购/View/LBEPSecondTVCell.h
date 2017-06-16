//
//  LBEPSecondTVCell.h
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBEPPurchaseModel.h"
@interface LBEPSecondTVCell : UITableViewCell
///团购展示图片
@property (strong, nonatomic) UIImageView *groupImage;
///模型
@property (strong, nonatomic) LBEPPurchaseModel *purchaseModel;
@end
