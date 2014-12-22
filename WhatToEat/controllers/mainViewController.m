//
//  mainViewController.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()



@end


@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    CoreDataManager *dataManager = [CoreDataManager sharedInstance];
    [dataManager createContextForEntity:@"FoodInfo"];
    [dataManager setValue:@"pizza" forKey:@"name"];
    
    // Do any additional setup after loading the view.
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
