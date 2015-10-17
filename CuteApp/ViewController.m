//
//  ViewController.m
//  CuteApp
//
//  Created by apple on 15/3/16.
//  Copyright (c) 2015年 apem. All rights reserved.
//

#import "ViewController.h"
#import "SideViewController.h"
#import "FightingViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *god;
@property (weak, nonatomic) IBOutlet UIImageView *helo;
@property (weak, nonatomic) IBOutlet UIImageView *somethingLonglongAgo;
@property (weak, nonatomic) IBOutlet UIImageView *topBall;

@property (retain, nonatomic) SideViewController *sideViewController;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint minPoint;

@property (nonatomic, assign) CGPoint bigBallstartPoint;
@property (nonatomic, assign) CGPoint bigBallMaxPoint;
@property (nonatomic, assign) CGPoint temporaryBigBallPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

#pragma mark - IBAction
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

- (IBAction)planeDidTap:(UITapGestureRecognizer *)sender {
   
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

- (IBAction)topBallTap:(UITapGestureRecognizer *)sender {
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    FightingViewController *fightingViewController =  [main instantiateViewControllerWithIdentifier:@"FightingViewController"];
    [self.navigationController pushViewController:fightingViewController animated:YES];
    
}

- (IBAction)bigBallDidPan:(UIPanGestureRecognizer *)sender {
//    NSLog(@"%s", __func__);
    UIView *v = sender.view;
    CGPoint point = [sender locationInView:self.view];
    
    
    if(sender.state == UIGestureRecognizerStateChanged) {
        if (point.y > self.bigBallMaxPoint.y) {
            self.bigBallMaxPoint = point;
        }
        
        CGRect rect = v.frame;
        rect.origin.y = point.y;
        v.frame = rect;
    } else if(sender.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGRect rect = v.frame;
            rect.origin.y = self.temporaryBigBallPoint.y;
            v.frame = rect;
        } completion:^(BOOL finished) {
            //取消
            if (point.y < self.bigBallMaxPoint.y) {
                
            } else {
                [self topBallTap:nil];
            }
        }];
        
    } else if(sender.state == UIGestureRecognizerStateBegan) {
        self.bigBallstartPoint = point;
        self.bigBallMaxPoint = point;
        self.temporaryBigBallPoint = v.frame.origin;
    }
    
    
}

@end
