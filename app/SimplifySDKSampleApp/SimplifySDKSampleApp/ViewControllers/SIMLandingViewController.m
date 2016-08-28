//
//  SIMLandingViewController.m
//  SimplifySDKSampleApp
//
//  Created by Kevin Fang on 8/28/16.
//  Copyright © 2016 MasterCard. All rights reserved.
//

#import "SIMLandingViewController.h"

@interface SIMLandingViewController (){
    
    
    __weak IBOutlet UIButton *purchase;
    __weak IBOutlet UIButton *browse;
}

@end

@implementation SIMLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    purchase.backgroundColor = [UIColor whiteColor];
    purchase.layer.cornerRadius = 5;
    purchase.layer.masksToBounds = YES;
    
    browse.backgroundColor = [UIColor whiteColor];
    browse.layer.cornerRadius = 5;
    browse.layer.masksToBounds = YES;

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
