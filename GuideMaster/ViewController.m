//
//  ViewController.m
//  GuideMaster
//
//  Created by 田向阳 on 16/10/25.
//  Copyright © 2016年 田向阳. All rights reserved.
//

#import "ViewController.h"
#import "GuideViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showGuideView];
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    UIView *launchView = viewController.view;
    launchView.frame = self.view.frame;
    [self.view addSubview:launchView];
    [UIView animateWithDuration:1.5 animations:^{
        launchView.alpha = 0.0f;
        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)showGuideView
{
    GuideViewController *guideVC = [[GuideViewController alloc] init];
    [self addChildViewController:guideVC];
    [guideVC showGuideViewInView:self.view];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
