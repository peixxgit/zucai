//
//  GuideVC.m
//  TUIWA
//
//  Created by 安笑 on 15/8/25.
//  Copyright (c) 2015年 安笑. All rights reserved.
//

#import "GuideVC.h"

#import "AppDelegate.h"
#import "CYLHttpRequest.h"

@interface GuideVC ()

@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITapGestureRecognizer *singleRecognizer;

@end

@implementation GuideVC

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    if (_pageIndex == self.images.count-1) {
        self.imageView.userInteractionEnabled = YES;
        [self.imageView addGestureRecognizer:self.singleRecognizer];
    }
    
    _imageView.image = self.images[_pageIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)singleTap:(UITapGestureRecognizer*)recognizer {
    [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"isNotFistLaunchAPP"];
    
    if ([DataManager sharedManager].isLogin) {
        [[NSUserDefaults standardUserDefaults] setObject:@(time(NULL)) forKey:@"lastSlide"];
        
//        [CYLHttpRequest get:NetWorkSlideHost params:@{@"qian" : @0.8} onComplete:^(NSDictionary *json, BOOL isSuccess) {
//            
//            
//            if (isSuccess) {
//                
//                if ([json[@"Result"] boolValue]) {
//                    
//                }else {
//                [appdel showHudwithTitle:nil detail:@"恭喜每日划屏赚取0.8元"];
//                }
//            }
//            
//        }];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    appdel.window.rootViewController = appdel.tabBarController;
}




#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(GuideVC *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(GuideVC *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.images count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



#pragma mark - private methods

- (NSUInteger)indexOfViewController:(GuideVC *)viewController {
    // Return the index of the given data view controller.

    return viewController.pageIndex;
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.images count] == 0) || (index >= [self.images count])) {
        return nil;
    }
    GuideVC *gVC = [[GuideVC alloc]init];
    gVC.pageIndex = index;
    return gVC;
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

- (NSArray *)images {
    if (!_images) {
        NSMutableArray *tempArr = [[NSMutableArray alloc]init];
        for (int i = 1; i < 5; i++) {
            
            [tempArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"guideImage%d", i]]];
        }
        _images = [tempArr copy];
    }
    
    return _images;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    
    return _imageView;
}

- (UITapGestureRecognizer *)singleRecognizer {
    if (!_singleRecognizer) {
        _singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        //点击的次数
        _singleRecognizer.numberOfTapsRequired = 1; // 单击
    }
    
    return _singleRecognizer;
}

@end
