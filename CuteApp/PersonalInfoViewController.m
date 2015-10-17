//
//  PersonalInfoViewController.m
//  CuteApp
//
//  Created by apple on 15/3/16.
//  Copyright (c) 2015年 apem. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "CompetitionComposition.h"
#import "BarTypeView.h"

@interface PersonalInfoViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleV;

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CompetitionComposition *ccV = [[CompetitionComposition alloc] initWithFrame:CGRectMake(0, 150, 250, 180)];
    [self.middleV addSubview:ccV];
    
    BarTypeView *bt1 = [[BarTypeView alloc] initWithFrame:CGRectMake(70, 330, 160, 15) showTitle:@"80%" showColor:[UIColor purpleColor]];
    BarTypeView *bt2 = [[BarTypeView alloc] initWithFrame:CGRectMake(70, 360, 105, 15) showTitle:@"5s" showColor:[UIColor purpleColor]];
    [self.middleV addSubview:bt1];
    [self.middleV addSubview:bt2];
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

@end
