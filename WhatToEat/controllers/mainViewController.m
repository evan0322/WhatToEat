//
//  mainViewController.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "MainViewController.h"
#import "CoreDataManager.h"
#import "UIConstants.h"


@interface MainViewController ()
{
    NSArray* foodInfos;
}
@end


@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleImage.image =[self.titleImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] ;
    self.navigationController.navigationBar.barTintColor = lightBlue;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    foodInfos = [[CoreDataManager sharedInstance] getFoodInfos];
    self.chooseButton.enabled = NO;
    if ([foodInfos count]==0) {
        self.chooseButton.enabled = NO;
    } else {
        self.chooseButton.enabled = YES;
    }
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
