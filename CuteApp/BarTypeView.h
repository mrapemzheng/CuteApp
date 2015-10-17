//
//  BarTypeView.h
//  NSTimerDemo
//
//  Created by CHENG DE LUO on 15-3-18.
//  Copyright (c) 2015年 CHENG DE LUO. All rights reserved.
//

#import <UIKit/UIKit.h>

//条形视图

@interface BarTypeView : UIView

@property (nonatomic, strong) UIColor *showColor;
@property (nonatomic, strong) NSString *showTitle;

- (instancetype)initWithFrame:(CGRect)frame showTitle:(NSString *)title showColor:(UIColor *)color;

@end
