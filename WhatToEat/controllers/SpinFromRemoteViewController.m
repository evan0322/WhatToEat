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
#import "NSURLRequest+OAuth.h"
#import "yepApiManager.h"

@interface SpinFromRemoteViewController ()
{
    NSMutableArray* foodInfos;
}
@end

@implementation SpinFromRemoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    foodInfos = [[NSMutableArray alloc] init];
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
    [self fetchBusinessInfo:^(BOOL success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.foodPicker reloadAllComponents];
            });
        }
    }];
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
    if ((int)[foodInfos count]==0) {
        return 1;
    }
    else return (int)[foodInfos count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([foodInfos count]==0) {
        return NSLocalizedString(@"KStringSpinViewLoading", nil);
    } else{
        NSDictionary *foodInfo = [foodInfos objectAtIndex:row];
        NSString *name = foodInfo[@"name"];
        return name;
    }
}

- (IBAction)spinFoodPicker:(id)sender
{
    self.spinButton.enabled = NO;
    //generate random number except the instruction line
    NSUInteger row = arc4random_uniform((uint32_t)foodInfos.count);
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
    NSDictionary *foodInfo = [foodInfos objectAtIndex:index.intValue];
    NSString *name = foodInfo[@"name"];
    NSString *msg = [NSString stringWithFormat:NSLocalizedString(@"KStringChooseCompleteMessage", nil) ,name];
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

- (void) fetchBusinessInfo:(void (^)(BOOL success))completionHandler
{
    NSString *defaultTerm = @"dinner";
    NSString *defaultLocation = @"Ottawa, ON";
    
    //Get the term and location from the command line if there were any, otherwise assign default values.
    NSString *term = [[NSUserDefaults standardUserDefaults] valueForKey:@"term"] ?: defaultTerm;
    NSString *location = [[NSUserDefaults standardUserDefaults] valueForKey:@"location"] ?: defaultLocation;
    
    yepApiManager *apiManager = [[yepApiManager alloc] init];
    [apiManager queryTopBusinessInfoForTerm:term location:location completionHandler:^(NSArray *businessInfos, NSError *error) {
        if (error) {
            completionHandler(NO);
        } else {
            for (NSDictionary *businessJSON in businessInfos) {
                if (businessJSON) {
                    if (error) {
                        NSLog(@"An error happened during the request: %@", error);
                    } else if (businessJSON) {
                        NSString *mobileURL = businessJSON[@"mobile_url"];
                        //NSLog(@"the mobile url for %@ is %@",name,mobileURL);
                        [foodInfos addObject:businessJSON];
                    } else {
                        NSLog(@"No business was found");
                    }
                }
            }
        }
        completionHandler(YES);
    }];
}





@end
