//
//  SpinViewController.h
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit/FUIButton.h>
#import <FlatUIKit/FUIAlertView.h>
#import <CoreLocation/CoreLocation.h>



@interface SpinFromRemoteViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate, FUIAlertViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet FUIButton *spinButton;
@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;

- (IBAction)spinFoodPicker:(id)sender;

@end
