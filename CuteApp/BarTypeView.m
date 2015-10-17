//
//  BarTypeView.m
//  NSTimerDemo
//
//  Created by CHENG DE LUO on 15-3-18.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import "BarTypeView.h"

@implementation BarTypeView

- (instancetype)initWithFrame:(CGRect)frame showTitle:(NSString *)title showColor:(UIColor *)color
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _showTitle =title;
        _showColor = color;
        [self setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGPathRef path1 = CGPathCreateWithRect(rect, NULL);
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.fillColor = self.showColor.CGColor;
    shapeLayer1.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer1.lineWidth = 0.5;
    shapeLayer1.path = path1;
    
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    basicAnimation1.duration = 2;
    basicAnimation1.fromValue = [NSNumber numberWithFloat:0];
    basicAnimation1.toValue = [NSNumber numberWithFloat:1];
    
    [shapeLayer1 addAnimation:basicAnimation1 forKey:@"basicAnimation1"];
    [self.layer addSublayer:shapeLayer1];
    
    UIFont *font = [UIFont systemFontOfSize:13];
    CGSize fontSize = [self.showTitle sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName]];
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(rect.size.width-fontSize.width, (rect.size.height-fontSize.height)/2, fontSize.width, fontSize.height);
    CFStringRef cfstr = (__bridge CFStringRef)font.fontName;
    textLayer.font = CGFontCreateWithFontName(cfstr);
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.fontSize = 13;
    textLayer.string = self.showTitle;
    [shapeLayer1 addSublayer:textLayer];
}

#pragma mark - private methods

- (void)setup
{
    
}

@end
