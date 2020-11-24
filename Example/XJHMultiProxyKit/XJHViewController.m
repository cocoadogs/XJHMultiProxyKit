//
//  XJHViewController.m
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import "XJHViewController.h"
#import "XJHSecondViewController.h"
#import "XJHThirdViewController.h"

@interface XJHViewController ()

@end

@implementation XJHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
    btn.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) - 30);
    btn.backgroundColor = [UIColor blackColor];
    btn.tintColor = [UIColor whiteColor];
    [btn setTitle:@"void" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
    btn2.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) + 30);
    btn2.backgroundColor = [UIColor blackColor];
    btn2.tintColor = [UIColor whiteColor];
    [btn2 setTitle:@"return" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(button2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)buttonClicked {
    XJHSecondViewController *secondViewController = [[XJHSecondViewController alloc] init];
    [self presentViewController:secondViewController animated:YES completion:nil];
}

- (void)button2Clicked {
    XJHThirdViewController *thirdViewController = [[XJHThirdViewController alloc] init];
    [self presentViewController:thirdViewController animated:YES completion:nil];
}

@end
