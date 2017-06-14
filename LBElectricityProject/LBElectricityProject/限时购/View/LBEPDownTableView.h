//
//  LBEPDownTableView.h
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LBEPDownTableViewBlock)(NSString *goodsID);
@interface LBEPDownTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
///是不是新品团购
@property (assign, nonatomic) BOOL isFirst;
///存放新品数据模型的数组
@property (strong, nonatomic) NSArray *firstModelArray;
///存放团购数据模型的数组
@property (strong, nonatomic) NSArray *secondModelArray;
///返回商品ID的block
@property (copy, nonatomic) LBEPDownTableViewBlock goodsIDBlock;
@end
