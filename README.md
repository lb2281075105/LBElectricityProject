# LBElectricityProject 电商项目

> * 本文为 刘博 所创，转载请保留出处，链接地址：`https://github.com/lb2281075105/LBElectricityProject.git`
> * 本人github会不断更新一些Demo，方便大家交流指正，谢谢！
> * 公众号【liubo920205】，会不断更新公众号文章，请关注！


# 一、前言

# 二、项目架构分析

    ## 限时购
       ### 限时购界面整体思想结构：最底层是一个UIScrollView，上面是两个UIView，下面是一个UITableView,如果实现表视图和中间两个按钮的父视图同步移动，就要使的表视图的高度等于单元格的高度x单元格个数，并且表视图bounce=false,滑动视图高度也需要改变contentSize属性。
       ### 悬浮两个按钮：
             * 具体代码如下：
                `核心代码
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
               `
               
       ### 中间两个按钮的切换：

       ### 请求数据(为了实现加载框)方法：创建一个控制器，只在这个控制器里面实现请求数据方法，并且其他请求数据的控制器可以继承自此控制器。
     
       ### 把所有的UITableView都分离抽取出来，把需要的视图都可以分离出来
       
       ### 商品详情界面：
           1.复杂的页面可以把每一部分单独分离出来，然后把每一个部分的高度用block传到控制器里面，再次给UIScrollView的高度赋值。
           有约束更新的时候，不要把控件写在layoutSubViews里面。
           2.利用MVVM模式来计算每一个控件的高度，然后判断控件是否存在，再添加到cell上面。

       ### 计算文本的高度：
           `CGFloat height = [text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size.height`,设置文本换行时，但是没有出现换行的效果，
            那就设置字号大一些。

       ###  `mas_remakeConstraints`把之前控件(对象)约束去掉，来设置新的控件(对象)约束。

            `核心代码
            - (void)fourBtnTouchMethod:(UIButton *)selectBtn{
                    selectBtn.selected = YES;
                    _oldBtn.selected = NO;
                    _oldBtn = selectBtn;
                    __weak typeof (self) weakSelf = self;

                    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.size.mas_offset(CGSizeMake(40, 2));
                        make.bottom.equalTo(weakSelf.mas_bottom);
                        make.centerX.equalTo(selectBtn.mas_centerX);
                    }];

                    [self setNeedsUpdateConstraints];
                    [self updateConstraintsIfNeeded];

                    [UIView animateWithDuration:0.3 animations:^{
                        [self layoutIfNeeded];
                    }];

            }
            `

       ### 自定义集合视图注意地方：
            `核心代码
            - (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
                    self = [super initWithFrame:frame collectionViewLayout:layout];
                    if (self) {
                        self.delegate = self;
                        self.dataSource = self;
                        [self registerClass:[LBEPClassListCollectionCell class] forCellWithReuseIdentifier:@"LBEPClassListCollectionCell"];
                    }
                    return self;
            }
            `
       ### 购物车商品加减以及商品选中计算：
           1. 给cell加上tag，使加减按钮点击可实现加减效果，并刷新reloadData；单元格选中并刷新表视图，block回调循环数组，模型对象选中属性选中就计算商品。
            `核心代码
                - (void)addButtonMethod:(UIButton *)sender{
                    UIView *cell = [sender superview];
                    NSInteger cellTag = cell.tag - 1000;
                    LBEPBuyCarListModel *cellModel = _buyCarList[cellTag];
                    [cellModel setGoodsCount:cellModel.GoodsCount + 1];
                    [self changeDataMethod];
                }

                - (void)cutButtonMethod:(UIButton *)sender{
                    UIView *cell = [sender superview];
                    NSInteger cellTag = cell.tag - 1000;
                    LBEPBuyCarListModel *cellModel = _buyCarList[cellTag];
                    if (cellModel.GoodsCount > 1) {
                       [cellModel setGoodsCount:cellModel.GoodsCount - 1];
                    }
                    [self changeDataMethod];
                }

                - (void)selectBtnMethod:(UIButton *)sender{
                    UIView *cell = [sender superview];
                    LBEPBuyCarListModel *cellModel = _buyCarList[cell.tag - 1000];
                    if (sender.selected) {
                       sender.selected = NO;
                       [cellModel setIsSelectButton:NO];
                    }else{
                       sender.selected = YES;
                       [cellModel setIsSelectButton:YES];
                    }
                    [self changeDataMethod];
                }

                - (void)changeDataMethod{
                    [self reloadData];
                    if (_changeDataBlock) {
                       _changeDataBlock();
                    }
                }

                - (void)countPriceMoney{
                    CGFloat priceMoney = 0.0;
                    for (LBEPBuyCarListModel *model in _tableViewArray) {
                    if (model.isSelectButton) {
                       priceMoney += model.Price * model.GoodsCount;
                    }
                    }
                    [self priceAttributedText:priceMoney];
                    [self changeBuyCarData];
                }

            `
           2. 第二中购物车计算方法：给模型设置`选中`和`数量`属性，给加号、减号和选中按钮设置回调，在控制器中`返回cell`的方法中设置回调。
            `Swift中核心代码(和OC逻辑是一样的)
            ///选中block
            selectGoodCell?.selectGoodBlock = { select in
                    print(select)
                    selectGoodModel.isSelectRow = select
                    ///添加数据模型
                    if select {
                         self.selectGoodArray.append(selectGoodModel)
                         //YMSingle.shared.goodArray.append(selectGoodModel)
                    }else {
                         let index = self.selectGoodArray.index(of: selectGoodModel)
                         self.selectGoodArray.remove(at: index!)
                         ///把选中的商品保存到本地
                         //let downIndex = YMSingle.shared.goodArray.index(of: selectGoodModel)
                         //YMSingle.shared.goodArray.remove(at: downIndex!)
                    }

                    print("选中了 \(self.selectGoodArray.count,YMSingle.shared.goodArray.count) 个")
            }    
            `
       ### 字典(数组)转模型问题：PayList、GoodsList字典(数组)里面的属性是`数组`的处理，数组里面字典也转模型。其实不转模型也行，一级一级往下取也行。
            `核心代码
            + (NSDictionary *)mj_objectClassInArray
            {
                    return @{
                        @"PayList" : @"SXTOrderPayListModel",
                        @"GoodsList" : @"SXTOrderListModel"
                    };
            }

           `

       ### 支付宝支付流程：看支付宝Demo就可以集成支付宝支付

    ## 分类


    ## 购物车


    ## 我的
       1. 友盟第三方登录、第三方分享
 

# 三、截图预览



# 四、技术框架

- pod 'SDWebImage', '~> 3.8.1'
- pod 'AFNetworking', '~> 3.1.0'
- pod 'MJExtension', '~> 3.0.13'
- pod 'Masonry', '~> 1.0.1'
- pod 'SVProgressHUD', '~> 2.0.3'
- pod 'SDCycleScrollView', '~> 1.65'


# 五、仓库地址：[LBElectricityProject](https://github.com/lb2281075105/LBElectricityProject.git)



# 六、项目心得



Welcome issue me, Thank your star.

如有更好的建议请联系:<2281075105@qq.com>

想看更多开源项目请点击：[Github地址](https://github.com/lb2281075105/LBElectricityProject.git)

## License

[**The MIT License**](http://opensource.org/licenses/MIT).
