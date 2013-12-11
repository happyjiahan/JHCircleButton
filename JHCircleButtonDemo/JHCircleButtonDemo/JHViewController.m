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
    UILabel *_numberLabel;
    NSTimer *_timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addNumberLabel];
    [self addCircleButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNumberLabel
{
    float width = CGRectGetWidth(self.view.bounds);
    float height = 300;
    _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    _numberLabel.backgroundColor = [UIColor yellowColor];
    _numberLabel.textColor = [UIColor redColor];
    _numberLabel.font = [UIFont boldSystemFontOfSize:150];
    [self setNumber];
    
    [self.view addSubview:_numberLabel];
}

- (void)setNumber
{
    int n = rand() % 10;
    _numberLabel.text = [NSString stringWithFormat:@"%d", n];
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
    [_circleButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchDown];
    [_circleButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    [self.view addSubview:_circleButton];
}

- (void)start
{
    [self addTimer];
}

- (void)stop
{
    [_timer invalidate];
    _timer = nil;
}

- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(setNumber) userInfo:nil repeats:YES];
    [_timer fire];
}

@end
