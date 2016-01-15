//
//  BannerView.m
//  TUIWA
//
//  Created by 安笑 on 15/8/29.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import "BannerView.h"

#import "DataManager.h"

#import <UIButton+WebCache.h>


@interface BannerView ()<UIScrollViewDelegate> {
  
    
//    UILabel *bannerTitleLabel;
//    UILabel *bannerSubTitleLabel;
    
}

@property (strong, nonatomic) UIScrollView *bannerScroll;
@property (strong, nonatomic) UIPageControl *pageControl; //!<分页控制器
@property (assign, nonatomic) NSInteger currentPage; //!<当前页
@property (strong, nonatomic) NSTimer* autoScrollTimer; //!<计时器

@property (strong, nonatomic) UIButton *leftButton; //!<上一张展示的图像
@property (strong, nonatomic) UIButton *rightButton; //!<下一张展示的图像

@end

@implementation BannerView


-(instancetype)init{
    self = [super init];
    if (self) {
        
        [self addSubview:self.bannerScroll];
        [self addSubview:self.pageControl];
        [self.bannerScroll addSubview:self.leftButton];
        [self.bannerScroll addSubview:self.currentButton];
        [self.bannerScroll addSubview:self.rightButton];
        
        [self makeConstraint];
    }
    return self;
}
- (void)makeConstraint {
    
    WS(weakSelf);
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.width.and.height.equalTo(weakSelf.bannerScroll);
    }];
    
    [self.currentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftButton.mas_right);
        make.width.and.height.equalTo(weakSelf.bannerScroll);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.currentButton.mas_right);
        make.width.and.height.equalTo(weakSelf.bannerScroll);
        make.trailing.equalTo(@0);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-5);
        make.centerX.equalTo(@0);
    }];
}



#pragma mark 自动滚动
- (void)setIsAutoShow:(BOOL)isAutoShow{
    _isAutoShow = isAutoShow;
    if (_isAutoShow)  //开启自动翻页
    {
        if (!_autoScrollTimer) {
            _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
        }
    }
    else   //关闭自动翻页
    {
        if (_autoScrollTimer.isValid) {
            [_autoScrollTimer invalidate];
            _autoScrollTimer = nil;
        }
    }
    
    
}

- (void)autoShowNextImage{
    _currentPage = [self validPageValue:_currentPage+1];
    [_bannerScroll setContentOffset:CGPointMake(2*(isPortraitPad ? MAIN_SCREEN_WIDTH : MAIN_SCREEN_HEIGHT), 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [_autoScrollTimer invalidate];
    _autoScrollTimer = nil;
    _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
    
    int x = scrollView.contentOffset.x;
    
    //往下翻一张
    if(x >= (2*MAIN_SCREEN_WIDTH)) {
        _currentPage = [self validPageValue:_currentPage+1];
        [self refrashIamgeView];
    }
    
    //往上翻
    if(x <= 0) {
        _currentPage = [self validPageValue:_currentPage-1];
        [self refrashIamgeView];
    }
    
    _bannerScroll.contentOffset = CGPointMake((isPortraitPad ? MAIN_SCREEN_WIDTH : MAIN_SCREEN_HEIGHT), 0);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (_autoScrollTimer) {
        [self refrashIamgeView];
        _bannerScroll.contentOffset = CGPointMake((isPortraitPad ? MAIN_SCREEN_WIDTH : MAIN_SCREEN_HEIGHT), 0);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.isAutoShow = NO;
    
}

- (void)refrashIamgeView{

    //必须得3张图才行.
    if (_dataArr.count > 2) {
        _pageControl.currentPage = _currentPage;
        
        NSInteger leftIndex = [self validPageValue:_currentPage-1];
        NSInteger currentIndex = [self validPageValue:_currentPage];
        NSInteger rightIndex = [self validPageValue:_currentPage+1];
        
//        [_leftButton sd_setBackgroundImageWithURL:[NSURL URLWithString:_dataArr[leftIndex][@"url"]] forState:UIControlStateNormal placeholderImage:nil];
//        
//       
//        [_currentButton sd_setBackgroundImageWithURL:_dataArr[currentIndex][@"url"] forState:UIControlStateNormal placeholderImage:nil];
//        
//        [_rightButton sd_setBackgroundImageWithURL:_dataArr[rightIndex][@"url"] forState:UIControlStateNormal placeholderImage:nil];
        [_leftButton setImage:[UIImage imageNamed:_dataArr[leftIndex]] forState:UIControlStateNormal];


        [_currentButton setImage:[UIImage imageNamed:_dataArr[currentIndex]] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:_dataArr[rightIndex]] forState:UIControlStateNormal];
    }
}

- (NSInteger)validPageValue:(NSInteger)value {
    
    if(value == -1) value = self.pageControl.numberOfPages - 1;
    if(value == self.pageControl.numberOfPages) value = 0;
    
    return value;
    
}


#pragma mark - getters and setters

- (void)setDataArr:(NSArray *)dataArr {
    
    _dataArr = dataArr;
    _currentPage = 0;
    
    self.pageControl.numberOfPages = dataArr.count;
    [self refrashIamgeView];
    if (_pageControl.numberOfPages > 0) {
        self.isAutoShow = YES;
    }
}

- (UIScrollView *)bannerScroll {
    if (!_bannerScroll) {
        _bannerScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,MAIN_SCREEN_WIDTH , MAIN_SCREEN_WIDTH/16.0*9.0)];
        _bannerScroll.contentSize = CGSizeMake(3*MAIN_SCREEN_WIDTH, MAIN_SCREEN_WIDTH*9.0/16.0);
        _bannerScroll.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH, 0);
        _bannerScroll.backgroundColor = [UIColor colorWithHex:RGBBGColor];
        _bannerScroll.showsHorizontalScrollIndicator = NO;
        _bannerScroll.pagingEnabled = YES;
        _bannerScroll.delegate = self;
        _bannerScroll.bounces = NO;
    }
    
    return _bannerScroll;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithHex:RGBSeparatorColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHex:RGBMainColor];
    }
    
    return _pageControl;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor colorWithHex:RGBBGColor];
    }
    
    return _leftButton;
}


- (UIButton *)currentButton {
    if (!_currentButton) {
        _currentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _currentButton.backgroundColor = [UIColor colorWithHex:RGBBGColor];
    }
    
    return _currentButton;
}


- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor colorWithHex:RGBBGColor];
    }
    
    return _rightButton;
}

@end
