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

#define themeColorCode @"4A939F"


@interface MainViewController ()
{
    NSArray* foodInfos;
}
@end


@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = lightBlue;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.chooseFromLocalButton = [self customizeButton:self.chooseFromLocalButton];
    [self.chooseFromLocalButton setTitle:NSLocalizedString(@"KStringChooseButtonTitle", nil) forState:UIControlStateNormal];
    
    self.chooseFromRemoteButton = [self customizeButton:self.chooseFromRemoteButton];
    [self.chooseFromRemoteButton setTitle:@"Choose from remote" forState:UIControlStateNormal];
    
    self.addButton = [self customizeButton:self.addButton];
    [self.addButton setTitle:NSLocalizedString(@"KStringAddButtonTitle", nil) forState:UIControlStateNormal];
    
    
    // Do any additional setup after loading the view.
}

- (FUIButton *)customizeButton:(FUIButton *)button
{
    button.buttonColor = [UIColor colorFromHexCode:themeColorCode];
    button.shadowColor = [UIColor grayColor];
    button.shadowHeight = 3.0f;
    button.cornerRadius = 6.0f;
    button.titleLabel.font = [UIFont boldFlatFontOfSize:17];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    foodInfos = [[CoreDataManager sharedInstance] getFoodInfos];
    self.chooseFromLocalButton.enabled = NO;
    if ([foodInfos count]==0) {
        self.chooseFromLocalButton.enabled = NO;
        self.chooseFromLocalButton.alpha = 0.5;
    } else {
        self.chooseFromLocalButton.enabled = YES;
        self.chooseFromLocalButton.alpha = 1.0;
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
