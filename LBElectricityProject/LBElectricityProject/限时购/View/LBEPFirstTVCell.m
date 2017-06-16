//
//  LBEPFirstTVCell.m
//  LBElectricityProject
//
//  Created by 云媒 on 2017/6/14.
//  Copyright © 2017年 刘博. All rights reserved.
//

#import "LBEPFirstTVCell.h"

@implementation LBEPFirstTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addLayoutSubviews];
    }
    return self;
}
///不通过懒加载处理
- (void)addLayoutSubviews{
    //[super layoutSubviews];
    __weak typeof (self) weakSelf = self;
    _iconImage = [[UIImageView alloc]init];
    [self addSubview:self.iconImage];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140, 140));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(5);
    }];
    
    _countryImage = [[UIImageView alloc]init];
    [self addSubview:self.countryImage];
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.iconImage.mas_left).offset(8);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(8);
    }];

    _titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    _titleLabel.textColor = [UIColor cz_colorWithRed:81 green:81 blue:81];
    _titleLabel.text = @"你好";
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.height.equalTo(@15);
    }];

    _contentLabel = [[UILabel alloc]init];
    [self addSubview:self.contentLabel];
    _contentLabel.textColor = [UIColor cz_colorWithRed:35 green:35 blue:35];
    _contentLabel.font = [UIFont systemFontOfSize:13.0];
    _contentLabel.numberOfLines = 3;
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(7);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.height.equalTo(@60);
    }];
    
    _buyCarBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
     [self addSubview:self.buyCarBtn];
    [_buyCarBtn setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:(UIControlStateNormal)];
    [_buyCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(37, 37));
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
    }];
    
    _pricLabel = [[UILabel alloc]init];
    [self addSubview:self.pricLabel];
    [_pricLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.right.equalTo(weakSelf.buyCarBtn.mas_left).offset(-20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-23);
    }];
    
}

-(void)setPurchaseModel:(LBEPPurchaseModel *)purchaseModel{
    _purchaseModel = purchaseModel;
    _titleLabel.text = _purchaseModel.Title;
    _contentLabel.text = _purchaseModel.GoodsIntro;
    [_countryImage sd_setImageWithURL:[NSURL URLWithString:purchaseModel.CountryImg]];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:purchaseModel.CountryImg]];
        _pricLabel.text = [NSString stringWithFormat:@"¥%@%@",purchaseModel.DomesticPrice,purchaseModel.Price];
    [self priceAttributedString];
}

- (void)priceAttributedString{
    
    //当前价格
    NSString *currentPrice = [NSString stringWithFormat:@"¥%@ ",_purchaseModel.DomesticPrice];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:currentPrice attributes:@{NSForegroundColorAttributeName:[UIColor cz_colorWithRed:230 green:51 blue:37],
                                                                                                               NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0]}];
    //过去价格
    NSString *pastString = [NSString stringWithFormat:@"%@ ",_purchaseModel.Price];
    NSMutableAttributedString *pastPrice = [[NSMutableAttributedString alloc]initWithString:pastString attributes:@{NSForegroundColorAttributeName:[UIColor cz_colorWithRed:132 green:132 blue:132],NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                                                                                                  NSStrikethroughStyleAttributeName:@(2)}];
    [string insertAttributedString:pastPrice atIndex:string.length];
    _pricLabel.attributedText = string;
}


@end
