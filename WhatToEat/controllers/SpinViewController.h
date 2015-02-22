//
//  SpinViewController.h
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit/FUIButton.h>

@interface SpinViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet FUIButton *spinButton;
@property (weak, nonatomic) IBOutlet UIPickerView *foodPicker;

- (IBAction)spinFoodPicker:(id)sender;

@end
