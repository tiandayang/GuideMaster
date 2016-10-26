//
//  GuideViewController.m
//  GuideMaster
//
//  Created by 田向阳 on 16/10/25.
//  Copyright © 2016年 田向阳. All rights reserved.
//

#import "GuideViewController.h"
static const NSInteger GUIDECOUNT = 5;

@interface GuideViewController ()
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}
#pragma mark ---- createUI
- (void)createUI
{
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * GUIDECOUNT, CGRectGetHeight(self.view.frame));
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor whiteColor];
        
        for (int i = 0;i<GUIDECOUNT; i++) {
            NSString *imageName = @"LaunchImage";
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)*i, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
            imageView.image = [UIImage imageNamed:imageName];
            imageView.userInteractionEnabled = YES;
            if (i == GUIDECOUNT - 1) {
        
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didExperButton)];
                [imageView addGestureRecognizer:tap];
            }
            [scrollView addSubview:imageView];
        }
    self.scrollView = scrollView;
    [self.view addSubview:self.scrollView];
}

/**
 点击立即体验
 */
- (void)didExperButton
{
    NSLog(@"click");
    [UIView animateWithDuration:1.5 animations:^{
        self.view.alpha = 0.0f;
        self.view.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];

    
}
#pragma mark ---- show guideView
- (void)showGuideViewInView:(UIView *)view
{
    NSString *key = @"CFBundleShortVersionString";
    
        // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
        // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
            // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        
            // 立即存储
        [[NSUserDefaults standardUserDefaults] synchronize];
        [view addSubview:self.view];

    }
   }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
