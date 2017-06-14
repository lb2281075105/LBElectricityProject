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

//- (void)setSingleModelArray:(NSArray *)singleModelArray{
//    _singleModelArray = singleModelArray;
//    [self reloadData];
//}
//
//- (void)setGroupModelArray:(NSArray *)groupModelArray{
//    _groupModelArray = groupModelArray;
//    [self reloadData];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isFirst) {
        //return self.firstModelArray.count;
        return 5;
    }else
        //return self.secondModelArray.count;
    return 4;
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
        }
//        cell.singleModel = self.singleModelArray[indexPath.row];
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%li",indexPath.row];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondCell"];
        }
//        cell.ImageUrl = [self.groupModelArray[indexPath.row] ImgView];
        cell.textLabel.text = [NSString stringWithFormat:@"%li",indexPath.row];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_isFirst) {
        if (_goodsIDBlock) {
//            _goodsIDBlock([self.singleModelArray[indexPath.row] GoodsId]);
        }
    }else{
        
    }
    
}

@end
