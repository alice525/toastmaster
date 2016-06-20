//
//  ViewController.m
//  toastmaster
//
//  Created by apple on 16/6/11.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import <AFNetworking/AFHTTPSessionManager.h>
//#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.backgroundColor = [UIColor redColor];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.uimaker.com/uploads/allimg/120416/1_120416091247_2.png"]];
    
    [self.view addSubview:imageView];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
