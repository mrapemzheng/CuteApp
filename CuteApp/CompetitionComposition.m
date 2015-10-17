//
//  CompetitionComposition.m
//  NSTimerDemo
//
//  Created by CHENG DE LUO on 15-3-18.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import "CompetitionComposition.h"

//250x180 视图rect
//145x145 圆形rect
//0.58x0.8 //所占比例

//最小圆 半径 7  0.03%  边宽:0.00%
//倒数第二圆 半径 13 0.09% 变宽: 0.00%


//半径 5  0.07%  边宽:0.02%
//半径36  0.24%  边宽:0.06%
//半径 50 0.34%  边宽:0.09%

//线

#define angelToPIAngel(angelNum) ((angelNum / 360.0) * (2 * M_PI))

@interface CompetitionComposition()

@end

@implementation CompetitionComposition

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//使用drawrect方法默认会添加黑色背景
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat diameter = rect.size.width * 0.58;
    CGPoint centerPoint = CGPointMake((rect.size.width - diameter)/2 + diameter/2, (rect.size.height - diameter)/2 + diameter/2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //最大圆
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathAddArc(path1, NULL, centerPoint.x, centerPoint.y, diameter/2, 0, 2 * M_PI, NO);
    CGContextSetRGBFillColor(context, 1, 1, 0, 0);
    CGContextAddPath(context, path1);
    CGContextFillPath(context);
    
    //倒数第二圆
    CGMutablePathRef path3 = CGPathCreateMutable();
    CGPathAddArc(path3, NULL, centerPoint.x, centerPoint.y, diameter * 0.09, 0, 2 * M_PI, NO);
    CGContextSetRGBFillColor(context, 12/255.0, 140/255.0, 172/255.0, 0.2);
    CGContextAddPath(context, path3);
    CGContextFillPath(context);
    
    //最小圆
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathAddArc(path2, NULL, centerPoint.x, centerPoint.y, diameter * 0.03, 0, 2 * M_PI, NO);
    CGContextSetRGBFillColor(context, 15/255.0, 230/255.0, 255/255.0, 1);
    CGContextAddPath(context, path2);
    CGContextFillPath(context);
    
    //最小圆弧
    CGMutablePathRef path4 = CGPathCreateMutable();
    CGPathAddArc(path4, NULL, centerPoint.x, centerPoint.y, diameter * 0.07, 0, 2 * M_PI, NO);
    CGContextSetRGBStrokeColor(context,15/255.0, 230/255.0, 255/255.0, 1);
    CGContextSetLineWidth(context, diameter * 0.03);
    CGContextAddPath(context, path4);
    CGContextStrokePath(context);
    
    //百分比1 圆弧
    CGMutablePathRef path5 = CGPathCreateMutable();
    CGPathAddArc(path5, NULL, centerPoint.x, centerPoint.y, diameter * 0.20, angelToPIAngel(120), angelToPIAngel(215), NO);
    CGContextSetRGBStrokeColor(context,12/255.0, 140/255.0, 172/255.0, 0.2);
    CGContextSetLineWidth(context, diameter * 0.10);
    CGContextAddPath(context, path5);
    CGContextStrokePath(context);
    
    //百分比2 圆弧
    CGMutablePathRef path6 = CGPathCreateMutable();
    CGPathAddArc(path6, NULL, centerPoint.x, centerPoint.y, diameter * 0.32, angelToPIAngel(215), angelToPIAngel(405), NO);
    CGContextSetRGBStrokeColor(context,12/255.0, 140/255.0, 172/255.0, 0.2);
    CGContextSetLineWidth(context, diameter * 0.12);
    CGContextAddPath(context, path6);
    CGContextStrokePath(context);
    
    //百分比3 圆弧
    CGMutablePathRef path7 = CGPathCreateMutable();
    CGPathAddArc(path7, NULL, centerPoint.x, centerPoint.y, diameter * 0.45, angelToPIAngel(285), angelToPIAngel(505), NO);
    CGContextSetRGBStrokeColor(context, 12/255.0, 140/255.0, 172/255.0, 0.2);
    CGContextSetLineWidth(context, diameter * 0.12);
    CGContextAddPath(context, path7);
    CGContextStrokePath(context);
    
    //百分比1 动态圆弧
    CGMutablePathRef path8 = CGPathCreateMutable();
    CGPathAddArc(path8, NULL, centerPoint.x, centerPoint.y, diameter * 0.205, angelToPIAngel(120), angelToPIAngel(215), NO);

    
    //百分比2 动态圆弧
    CGMutablePathRef path9 = CGPathCreateMutable();
    CGPathAddArc(path9, NULL, centerPoint.x, centerPoint.y, diameter * 0.34, angelToPIAngel(300), angelToPIAngel(470), NO);

    
    //百分比3 动态圆弧
    CGMutablePathRef path10 = CGPathCreateMutable();
    CGPathAddArc(path10, NULL, centerPoint.x, centerPoint.y, diameter * 0.48, angelToPIAngel(320), angelToPIAngel(425), YES);

    
    //百分比3 动态圆弧 动画
    CAShapeLayer *caShapeLayer3 = [CAShapeLayer layer];
    caShapeLayer3.path = path10;
    caShapeLayer3.strokeColor = [UIColor colorWithRed:15/255.0 green:230/255.0 blue:255/255.0 alpha:1].CGColor;
    caShapeLayer3.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer3.lineWidth = diameter * 0.12;
    
    CABasicAnimation *basicAnimation3 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    basicAnimation3.duration = 1.0;
    basicAnimation3.fromValue = [NSNumber numberWithFloat:0.0f];
    basicAnimation3.toValue = [NSNumber numberWithFloat:1.0f];
    [caShapeLayer3 addAnimation:basicAnimation3 forKey:@"basicAnimation3"];
    
    [self.layer addSublayer:caShapeLayer3];
    
    //百分比2 动态圆弧 动画
    CAShapeLayer *caShapeLayer2 = [CAShapeLayer layer];
    caShapeLayer2.path = path9;
    caShapeLayer2.strokeColor = [UIColor colorWithRed:15/255.0 green:230/255.0 blue:255/255.0 alpha:1].CGColor;
    caShapeLayer2.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer2.lineWidth = diameter * 0.12;
    
    CABasicAnimation *basicAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    basicAnimation2.duration = 1.0;
    basicAnimation2.fromValue = [NSNumber numberWithFloat:0.0f];
    basicAnimation2.toValue = [NSNumber numberWithFloat:1.0f];
    [caShapeLayer2 addAnimation:basicAnimation2 forKey:@"basicAnimation2"];
    
    [self.layer addSublayer:caShapeLayer2];
    
    //百分比1 动态圆弧 动画
    CAShapeLayer *caShapeLayer1 = [CAShapeLayer layer];
    caShapeLayer1.path = path8;
    caShapeLayer1.strokeColor = [UIColor colorWithRed:15/255.0 green:230/255.0 blue:255/255.0 alpha:1].CGColor;
    caShapeLayer1.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer1.lineWidth = diameter * 0.10;
    
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    basicAnimation1.duration = 1.0;
    basicAnimation1.fromValue = [NSNumber numberWithFloat:0.0f];
    basicAnimation1.toValue = [NSNumber numberWithFloat:1.0f];
    [caShapeLayer1 addAnimation:basicAnimation1 forKey:@"basicAnimation1"];
    [self.layer addSublayer:caShapeLayer1];
    
    //百分比1 划线
    CGMutablePathRef path13 = CGPathCreateMutable();
    CGPathMoveToPoint(path13, NULL, centerPoint.x - 0.21 * diameter, centerPoint.y);
    CGPathAddLineToPoint(path13, NULL, centerPoint.x - 0.21 * diameter -17,centerPoint.y + 17);
    CGPathAddLineToPoint(path13, NULL, centerPoint.x - 0.21 * diameter - 65, centerPoint.y + 17);
    
    CAShapeLayer *caShapeLayer13 = [CAShapeLayer layer];
    caShapeLayer13.path = path13;
    caShapeLayer13.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor;
    caShapeLayer13.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer13.lineWidth = 2;
    [self.layer addSublayer:caShapeLayer13];
    
    CGContextAddArc(context, centerPoint.x -  0.21 * diameter - 65, centerPoint.y + 17, 2, 0, 2 *M_PI, YES);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
    
    //百分比2 划线
    CGMutablePathRef path12 = CGPathCreateMutable();
    CGPathMoveToPoint(path12, NULL, centerPoint.x + 0.34 * diameter, centerPoint.y);
    CGPathAddLineToPoint(path12, NULL, centerPoint.x +  0.34 * diameter +17,centerPoint.y + 17);
    CGPathAddLineToPoint(path12, NULL, centerPoint.x +  0.34 * diameter + 60, centerPoint.y + 17);
    
    CAShapeLayer *caShapeLayer12 = [CAShapeLayer layer];
    caShapeLayer12.path = path12;
    caShapeLayer12.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor;
    caShapeLayer12.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer12.lineWidth = 2;
    [self.layer addSublayer:caShapeLayer12];
    
    CGContextAddArc(context, centerPoint.x +  0.34 * diameter + 62, centerPoint.y + 17, 2, 0, 2 *M_PI, YES);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
    
    //百分比3 划线
    CGMutablePathRef path11 = CGPathCreateMutable();
    CGPathMoveToPoint(path11, NULL, centerPoint.x, centerPoint.y - diameter/2 + (0.07*diameter)/2);
    CGPathAddLineToPoint(path11, NULL, centerPoint.x - 28, 8);
    CGPathAddLineToPoint(path11, NULL, centerPoint.x- 82, 8);
    
    CAShapeLayer *caShapeLayer11 = [CAShapeLayer layer];
    caShapeLayer11.path = path11;
    caShapeLayer11.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor;
    caShapeLayer11.fillColor = [UIColor clearColor].CGColor;
    caShapeLayer11.lineWidth = 2;
    [self.layer addSublayer:caShapeLayer11];
    
    CGContextAddArc(context, centerPoint.x- 84, 8, 2, 0, 2 *M_PI, YES);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
    
    //百分比1 文字
    [@"胜利" drawAtPoint:CGPointMake(centerPoint.x- 115, 0) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor greenColor], NSForegroundColorAttributeName, nil]];
    [@"80%" drawAtPoint:CGPointMake(centerPoint.x- 115, 13) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    //百分比2 文字
    [@"平局" drawAtPoint:CGPointMake(centerPoint.x- 115, 90) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor colorWithRed:255/255.0 green:143/255.0 blue:99/255.0 alpha:1], NSForegroundColorAttributeName, nil]];
    [@"5%" drawAtPoint:CGPointMake(centerPoint.x- 115, 103) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    //百分比3 文字
    [@"失败" drawAtPoint:CGPointMake(219, 110) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor colorWithRed:255/255.0 green:63/255.0 blue:99/255.0 alpha:1], NSForegroundColorAttributeName, nil]];
    [@"15%" drawAtPoint:CGPointMake(219, 123) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13] ,NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
}

@end
