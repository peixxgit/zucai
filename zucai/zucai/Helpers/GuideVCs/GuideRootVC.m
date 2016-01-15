//
//  GuideRootVC.m
//  TUIWA
//
//  Created by 安笑 on 15/8/25.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import "GuideRootVC.h"
#import "GuideVC.h"
#import "UIColor+ColorExtension.h"
#import "DataManager.h"

@interface GuideRootVC ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (readonly, strong, nonatomic) GuideVC *guideVC;

@end

@implementation GuideRootVC

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHex:RGBBGColor];
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    _guideVC = [[GuideVC alloc]init];
    _guideVC.pageIndex = 0;
    [self.pageViewController setViewControllers:@[_guideVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    self.pageViewController.dataSource = self.guideVC;
    
    
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.pageViewController didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - getters and setters


@end
