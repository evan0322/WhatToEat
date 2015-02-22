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
#import <UIColor+FlatUI.h>
#import <UIFont+FlatUI.h>
#import <FlatUIKit/FUIButton.h>


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
    self.chooseButton.buttonColor = [UIColor colorFromHexCode:@"4A939F"];
    self.chooseButton.shadowColor = [UIColor grayColor];
    self.chooseButton.shadowHeight = 3.0f;
    self.chooseButton.cornerRadius = 6.0f;
    self.chooseButton.titleLabel.font = [UIFont boldFlatFontOfSize:9];
    [self.chooseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.chooseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
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
        self.chooseButton.alpha = 0.5;
    } else {
        self.chooseButton.enabled = YES;
        self.chooseButton.alpha = 1.0;
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
