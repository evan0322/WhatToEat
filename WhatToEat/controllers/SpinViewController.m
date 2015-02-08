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
    //extra line for instruction
    int count = (int)[foodInfos count];
    return count+1;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return @"Choose Your Food ....";
    } else{
        FoodInfo *info = [foodInfos objectAtIndex:row-1];
        return info.name;
    }
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    FoodInfo *info = [foodInfos objectAtIndex:row];
    NSLog(@"%@ is chosen !", info.name);
    [self showMessage:@"%@ is selected!"  withTitle:@"Enjoy"];
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

- (IBAction)spinFoodPicker:(id)sender
{
   //generate random number except the instruction line
    NSUInteger row = arc4random_uniform((uint32_t)foodInfos.count) + 1;
    [self.foodPicker selectRow:row inComponent:0 animated:YES];
    NSNumber *selectedRow = [NSNumber numberWithInteger:row];
    [self performSelector:@selector(didSelectRow:)
               withObject:selectedRow
               afterDelay:0.4];
   //A hacky way to show alert after selection, apple may need to update picker to support completion block

}

- (void) didSelectRow:(NSNumber *)index
{
    FoodInfo *info = [foodInfos objectAtIndex:index.intValue-1];
    NSString *msg = [NSString stringWithFormat:@"%@ is selected!",info.name];
    [self showMessage:msg  withTitle:@"Enjoy"];

}

- (void) showMessage:(NSString *)msg withTitle: (NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
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
