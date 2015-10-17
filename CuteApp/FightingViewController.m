//
//  FightingViewController.m
//  CuteApp
//
//  Created by apple on 15/3/16.
//  Copyright (c) 2015年 apem. All rights reserved.
//

#import "FightingViewController.h"
#import "SideViewController.h"

@interface FightingViewController ()

@property (retain, nonatomic) SideViewController *sideViewController;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint minPoint;

@property (nonatomic, assign) CGPoint bigBallstartPoint;
@property (nonatomic, assign) CGPoint bigBallMaxPoint;
@property (nonatomic, assign) CGPoint temporaryBigBallPoint;

@end

@implementation FightingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SideViewController *)sideViewController
{
    if(_sideViewController == nil) {
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        self.sideViewController = [main instantiateViewControllerWithIdentifier:@"SideViewController"];
    }
    return _sideViewController;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)topBallTap:(UITapGestureRecognizer *)sender {
    if (sender.view.tag == 11) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

- (IBAction)littleBallRedTap:(UITapGestureRecognizer *)sender {
    [self littleBallTap:sender];
    
}
- (IBAction)littleBallBlueTap:(UITapGestureRecognizer *)sender {
    [self littleBallTap:sender];
}

- (void)littleBallTap:(UITapGestureRecognizer *)sender {
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect rect = sender.view.frame;
        rect.size = CGSizeMake(102, 102);
        sender.view.frame = rect;
        
        if (sender.view.tag == 1) {
            UIView *v = [self.view viewWithTag:3];
            CGRect rect = v.frame;
            rect.size = CGSizeMake(33, 33);
            v.frame = rect;
        } else if(sender.view.tag == 3) {
            UIView *v = [self.view viewWithTag:1];
            CGRect rect = v.frame;
            rect.size = CGSizeMake(33, 33);
            v.frame = rect;
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)planeTap:(UITapGestureRecognizer *)sender {
    CGRect rect = self.sideViewController.view.frame;
    rect.origin.x = self.view.frame.size.width;
    self.sideViewController.view.frame = rect;
    [self.view addSubview:self.sideViewController.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect2 = self.sideViewController.view.frame;
        rect2.origin.x = 0;
        self.sideViewController.view.frame = rect2;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)viewDidPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.startPoint = point;
        self.minPoint = point;
        
        CGRect rect = self.sideViewController.view.frame;
        rect.origin.x = self.view.frame.size.width;
        self.sideViewController.view.frame = rect;
        [self.view addSubview:self.sideViewController.view];
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        
        if ( point.x <= self.minPoint.x ) {
            self.minPoint = point;
        }
        
        if (point.x - self.startPoint.x < 0) {
            CGRect rect = self.sideViewController.view.frame;
            rect.origin.x = self.view.frame.size.width - (self.startPoint.x - point.x);
            self.sideViewController.view.frame = rect;
        }
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        //取消
        if (point.x - self.minPoint.x < 0) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect rect = self.sideViewController.view.frame;
                rect.origin.x = self.view.frame.size.width;
                self.sideViewController.view.frame = rect;
            } completion:^(BOOL finished) {
                [self.view removeFromSuperview];
            }];
        } else {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect rect = self.sideViewController.view.frame;
                rect.origin.x = 0;
                self.sideViewController.view.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        }
        
    }
}

@end
