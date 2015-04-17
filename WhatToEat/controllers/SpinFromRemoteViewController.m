//
//  SpinViewController.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "SpinFromRemoteViewController.h"
#import "CoreDataManager.h"
#import "UIConstants.h"
#import <UIColor+FlatUI.h>
#import <UIFont+FlatUI.h>
#import <FlatUIKit/FUIButton.h>
#import <FlatUIKit/FUIAlertView.h>
#import "Utils.h"

@interface SpinFromRemoteViewController ()
{
    NSArray* foodInfos;
}
@end

@implementation SpinFromRemoteViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    foodInfos = [[CoreDataManager sharedInstance] getFoodInfos];
    if ([foodInfos count]==0) {
        self.spinButton.enabled = NO;
    }
    /*for (FoodInfo *foodInfo in foodInfos) {
     NSLog(@"list print %@",foodInfo.name);
     }
     */
    self.foodPicker.dataSource = self;
    self.foodPicker.delegate = self;
    
    self.spinButton = [[Utils sharedInstance] customizeButton:self.spinButton];
    [self.spinButton setTitle:NSLocalizedString(@"KStringSpinButtonTitle", nil) forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSLocalizedString(@"KStringSpinViewTitle", nil);
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
        return NSLocalizedString(@"KStringSpinViewBeginSpin", nil);
    } else{
        FoodInfo *info = [foodInfos objectAtIndex:row-1];
        return info.name;
    }
}

- (IBAction)spinFoodPicker:(id)sender
{
    self.spinButton.enabled = NO;
    //generate random number except the instruction line
    NSUInteger row = arc4random_uniform((uint32_t)foodInfos.count) + 1;
    [self.foodPicker selectRow:row inComponent:0 animated:YES];
    NSNumber *selectedRow = [NSNumber numberWithInteger:row];
    //A hacky way to show alert after selection, apple may need to update picker to support completion block
    [self performSelector:@selector(didSelectRow:)
               withObject:selectedRow
               afterDelay:0.4];
    
    
}

- (void) didSelectRow:(NSNumber *)index
{
    self.spinButton.enabled = YES;
    FoodInfo *info = [foodInfos objectAtIndex:index.intValue-1];
    NSString *msg = [NSString stringWithFormat:NSLocalizedString(@"KStringChooseCompleteMessage", nil) ,info.name];
    [self showMessage:msg  withTitle:NSLocalizedString(@"KStringChooseCompleteTitle", nil) ];
    
}

- (void) showMessage:(NSString *)msg withTitle: (NSString *)title
{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:title
                                                          message:msg
                                                         delegate:self
                                                cancelButtonTitle:NSLocalizedString(@"KStringConfirm", nil)
                                                otherButtonTitles:nil];
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:14];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor colorFromHexCode:@"4A939F"];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
    [alertView show];
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.foodPicker selectRow:0 inComponent:0 animated:YES];
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
