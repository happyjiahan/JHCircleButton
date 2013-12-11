//
//  JHViewController.m
//  JHCircleButtonDemo
//
//  Created by li.jiahan on 13-12-11.
//  Copyright (c) 2013年 codingcoder. All rights reserved.
//

#import "JHViewController.h"
#import "JHCircleButton.h"

@interface JHViewController ()

@end

@implementation JHViewController
{
    JHCircleButton *_circleButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self addCircleButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addCircleButton
{
    float width = 200;
    _circleButton = [[JHCircleButton alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    float x = CGRectGetMidX(self.view.frame);
    float y = CGRectGetMaxY(self.view.frame) - width * 0.5 - 50;
    CGPoint newCenter = CGPointMake(x, y);
    _circleButton.center = newCenter;
    _circleButton.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_circleButton];
}

@end
