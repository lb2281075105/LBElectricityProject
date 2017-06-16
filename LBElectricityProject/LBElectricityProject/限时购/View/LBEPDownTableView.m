//
//  LBEPDownTableView.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPDownTableView.h"
#import "LBEPFirstTVCell.h"
#import "LBEPSecondTVCell.h"

@implementation LBEPDownTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate =self;
        self.dataSource =self;
        //self.bounces = NO;
    }
    return self;
}

//-(void)setFirstModelArray:(NSArray *)firstModelArray{
//    _firstModelArray = firstModelArray;
//    [self reloadData];
//}
//-(void)setSecondModelArray:(NSArray *)secondModelArray{
//    _secondModelArray = secondModelArray;
//    [self reloadData];
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isFirst) {
        return self.firstModelArray.count;
    }else
        return self.secondModelArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isFirst) {
        return 170;
    }else{
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_isFirst) {
        LBEPFirstTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        if (!cell) {
            cell = [[LBEPFirstTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
        }
        cell.purchaseModel = self.firstModelArray[indexPath.row];
        return cell;
    }else{
        LBEPSecondTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        if (!cell) {
            cell = [[LBEPSecondTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondCell"];
        }
        LBEPLog(@"%li",self.firstModelArray.count);
        cell.purchaseModel = self.secondModelArray[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if (_isFirst) {
        if (_goodsIDBlock) {
//            _goodsIDBlock([self.singleModelArray[indexPath.row] GoodsId]);
        }
    }else{
        
    }
    
}

@end
