//
//  ZFPageControl.m
//  ZFPageControl
//
//  Created by anxindeli on 16/10/8.
//  Copyright © 2016年 anxindeli. All rights reserved.
//

#import "ZFPageControl.h"
@interface ZFPageControl ()
@property (nonatomic, strong) NSMutableArray *allItems;
@end
@implementation ZFPageControl
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.allItems = [NSMutableArray array];
        self.pageIndicatorTintColor = [UIColor redColor];//默认普通状态是红色
        self.currentPageIndicatorTintColor = [UIColor greenColor];//选中状态是绿色
    }
    return self;
}
//是否隐藏单个page
- (void)hidenSinglePage{
    
    if (_hidesForSinglePage && _numberOfPages == 1) {
        self.hidden = true;
    }else{
        self.hidden = false;
    }
}
#pragma mark - setter && getter 方法
- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    _currentPage = 0;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat allWidth = screenWidth - (numberOfPages-1)*20-20;
    CGFloat leftX = allWidth/2.0;
    for (NSInteger i = 0; i<numberOfPages; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5.0f;
        if (i==0) {
            button.backgroundColor = self.currentPageIndicatorTintColor;
        }else{
            button.backgroundColor = self.pageIndicatorTintColor;
        }
        button.tag = i;
        [button addTarget:self action:@selector(doChangePage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.allItems addObject:button];
    }
    
    
    for (int i =0; i<self.allItems.count; i++) {
        
        UIButton *button1 = self.allItems[i];
        
        UIButton *button2;
        if (i!=0) {
            button2 = self.allItems[i-1];
        }
        [button1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            if (i==0) {
                make.left.equalTo(leftX);
            }else{
                make.left.equalTo(button2.right).offset(10);
            }
            make.width.equalTo(i==0?20:10);
            make.height.equalTo(10);
        }];
        
    }
    
    [self hidenSinglePage];
    
}
- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage{
    _hidesForSinglePage = hidesForSinglePage;
    [self hidenSinglePage];
}
- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
}
#pragma mark - 点击page调用的方法
- (void)doChangePage:(UIButton *)sender{
    
    
    
    UIButton *button1 = self.allItems[_currentPage];
    
    if ([button1 isEqual:sender]) {
        return;
    }
    
    button1.backgroundColor = self.pageIndicatorTintColor;
    sender.backgroundColor = self.currentPageIndicatorTintColor;

    [button1 updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(10);
    }];
    
    [sender updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(20);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
    _currentPage = sender.tag;
    
}


@end
