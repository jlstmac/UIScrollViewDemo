//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by jianglinshan@qiyi.com on 2020/5/8.
//  Copyright © 2020 jlstmac@gmail.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView* scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
    [self addTopView];
    [self addGesture];
//    [self resetScrollViewFrame];
//    [self addGestureToAnotherView];

    // Do any additional setup after loading the view.
}

- (void)initScrollView
{
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.backgroundColor = UIColor.whiteColor;
    [self.scrollView setContentInset:UIEdgeInsetsMake(300, 0, 0, 0)];
    UIView* subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    subView1.backgroundColor = UIColor.redColor;
    UIView* subView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    subView2.backgroundColor = UIColor.yellowColor;
    UIView* subView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 100 + 200, self.view.frame.size.width, 600)];
    subView3.backgroundColor = UIColor.greenColor;
    [self.scrollView addSubview:subView1];
    [self.scrollView addSubview:subView2];
    [self.scrollView addSubview:subView3];
}

- (void)addTopView
{
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    topView.backgroundColor = UIColor.whiteColor;
    UILabel* label = [[UILabel alloc] initWithFrame:topView.bounds];
    label.text = @"用这个view盖住下面的scrollview";
    label.textColor = UIColor.blackColor;
    label.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:label];
    [self.view addSubview:topView];
}

- (void)addGesture
{
    [self.view addGestureRecognizer:self.scrollView.panGestureRecognizer];
}

- (void)resetScrollViewFrame
{
    self.scrollView.frame = CGRectMake(0, 200, self.view.frame.size.width, 200);
}

- (void)addGestureToAnotherView
{
    UIView* touchView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame) + 100, self.view.frame.size.width, 300)];
    touchView.backgroundColor = UIColor.whiteColor;
    UILabel* label = [[UILabel alloc] initWithFrame:touchView.bounds];
    label.text = @"在这里滑动UIScrollView";
    label.textColor = UIColor.blackColor;
    label.textAlignment = NSTextAlignmentCenter;
    [touchView addSubview:label];
    [self.view addSubview:touchView];
    [touchView addGestureRecognizer:self.scrollView.panGestureRecognizer];
}
@end
