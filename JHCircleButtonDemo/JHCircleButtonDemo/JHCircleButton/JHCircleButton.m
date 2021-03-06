//
//  JHCircleButton.m
//  JHCircleButtonDemo
//
//  Created by li.jiahan on 13-12-11.
//  Copyright (c) 2013年 codingcoder. All rights reserved.
//

#import "JHCircleButton.h"
#import <UIColor+Colours.h>

@implementation JHCircleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
        _fillColor = [UIColor greenColor];
        _marginColor = [UIColor purpleColor];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (self.highlighted) {
        _fillColor = [UIColor clearColor];
        _marginColor = [UIColor honeydewColor];
    } else {
        _fillColor = [UIColor limeColor];
        _marginColor = [UIColor honeydewColor];
    }
    
    CGRect circleRect = CGRectInset(rect, 5, 5);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    circlePath.lineWidth = 8.0;
    [self.marginColor setStroke];
    [circlePath stroke];
    
    [self.fillColor setFill];
    [circlePath fill];
}
@end
