//
//  XJHThirdViewController.m
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import "XJHThirdViewController.h"
#import <XJHMultiProxyKit/NSObject+XJHMultiProxyAdditions.h>
#import "DemoSource.h"
#import "Demo1.h"
#import "Demo2.h"

@interface XJHThirdViewController ()

@property (strong, nonatomic) DemoSource *source;
@property (strong, nonatomic) Demo1 *demo1;
@property (strong, nonatomic) Demo2 *demo2;

@end

@implementation XJHThirdViewController

- (void)dealloc
{
    NSLog(@"--- %@ dealloc ---", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *returnId = [[UIButton alloc]initWithFrame:CGRectMake(70, 200, 100, 44)];
    returnId.backgroundColor = [UIColor lightGrayColor];
    [returnId setTitle:@"Return id" forState:UIControlStateNormal];
    [returnId setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [returnId addTarget:self action:@selector(returnId:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnId];
    
    UIButton *returnInt = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 44)];
    returnInt.backgroundColor = [UIColor lightGrayColor];
    [returnInt setTitle:@"Return int" forState:UIControlStateNormal];
    [returnInt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [returnInt addTarget:self action:@selector(returnInt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnInt];
    
    UIButton *getNoReturn = [[UIButton alloc]initWithFrame:CGRectMake(70, 300, 100, 44)];
    getNoReturn.backgroundColor = [UIColor lightGrayColor];
    [getNoReturn setTitle:@"no return" forState:UIControlStateNormal];
    [getNoReturn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [getNoReturn addTarget:self action:@selector(getNoReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getNoReturn];
    
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 100, 44)];
    closeBtn.backgroundColor = [UIColor lightGrayColor];
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    self.source = [[DemoSource alloc]init];
//    self.source.delegate = (id)self.source.xjh_multiProxy;
    
    self.demo1 = [[Demo1 alloc]init];
    self.demo2 = [[Demo2 alloc]init];
    
    [self.source xjh_addDelegate:self.demo1];
    [self.source xjh_addDelegate:self.demo2];
}

- (void)returnId:(id)sender
{
    [self.source getId];
}

- (void)returnInt:(id)sender
{
    [self.source getInt];
}

- (void)getNoReturn:(id)sender
{
    [self.source getNoReturn];
}

- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
