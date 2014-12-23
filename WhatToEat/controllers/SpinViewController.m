//
//  SpinViewController.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "SpinViewController.h"
#import "CoreDataManager.h"

@interface SpinViewController ()

@end

@implementation SpinViewController
NSArray* foodInfos;


- (void)viewDidLoad {
    [super viewDidLoad];
    foodInfos = [[CoreDataManager sharedInstance] getFoodInfos];
    for (FoodInfo *foodInfo in foodInfos) {
        NSLog(@"list print %@",foodInfo.name);
    }
    self.foodPicker.dataSource = self;
    self.foodPicker.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [foodInfos count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    FoodInfo *info = [foodInfos objectAtIndex:row];
    return info.name;
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    FoodInfo *info = [foodInfos objectAtIndex:row];
    NSLog(@"%@ is chosen !", info.name);
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

- (IBAction)spinFoodPicker:(id)sender
{
   
    NSUInteger number = arc4random_uniform((uint32_t)foodInfos.count);
    [self.foodPicker selectRow:number inComponent:0 animated:YES];
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
