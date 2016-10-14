//
//  ZFPageControl.h
//  ZFPageControl
//
//  Created by anxindeli on 16/10/8.
//  Copyright © 2016年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFPageControl : UIView
@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to
@property(nonatomic) BOOL hidesForSinglePage;          // hide the the indicator if there is only one page. default is NO
@property(nullable, nonatomic, strong) UIColor *pageIndicatorTintColor;
@property(nullable, nonatomic, strong) UIColor *currentPageIndicatorTintColor;

@end
