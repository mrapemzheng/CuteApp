//
//  SideViewController.m
//  CuteApp
//
//  Created by apple on 15/3/16.
//  Copyright (c) 2015年 apem. All rights reserved.
//

#import "SideViewController.h"
#import "PersonalInfoViewController.h"
#import "AppDelegate.h"

@interface SideViewController ()

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint maxPoint;
@property (weak, nonatomic) IBOutlet UIView *hudView;

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)sideDidPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.startPoint = point;
        self.maxPoint = point;
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        
        if ( point.x >= self.maxPoint.x ) {
            self.maxPoint = point;
        }
        
        if (point.x - self.startPoint.x > 0) {
            CGRect rect = self.hudView.frame;
            rect.origin.x = (point.x - self.startPoint.x);
            self.hudView.frame = rect;
        }
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        //取消
        if (point.x - self.maxPoint.x < 0) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect rect = self.hudView.frame;
                rect.origin.x = 0;
                self.hudView.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        } else {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect rect = self.hudView.frame;
                rect.origin.x = self.view.frame.size.width;
                self.hudView.frame = rect;
            } completion:^(BOOL finished) {
                [self.view removeFromSuperview];
            }];
        }
        
    }
}

- (IBAction)personInfoDidClick:(id)sender {
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PersonalInfoViewController *personalInfoViewController =  [main instantiateViewControllerWithIdentifier:@"PersonalInfoViewController"];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UINavigationController *nav = (UINavigationController *)appDelegate.window.rootViewController;
    [nav pushViewController:personalInfoViewController animated:YES];
}

@end
