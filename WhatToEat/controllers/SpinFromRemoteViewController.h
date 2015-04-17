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

@interface SpinFromRemoteViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate, FUIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet FUIButton *spinButton;
@property (weak, nonatomic) IBOutlet UIPickerView *foodPicker;

- (IBAction)spinFoodPicker:(id)sender;

@end
