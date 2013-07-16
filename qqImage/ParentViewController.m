//
//  ParentViewController.m
//  qqImage
//
//  Created by zhongwei on 3/28/13.
//  Copyright (c) 2013 zhongwei. All rights reserved.
//

#import "ParentViewController.h"

@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
