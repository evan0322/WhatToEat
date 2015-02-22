//
//  FoodListTableViewController.h
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit/FUIAlertView.h>

@interface FoodListTableViewController : UITableViewController <FUIAlertViewDelegate>

- (IBAction)clear:(id)sender;
- (IBAction)Edit:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButton;

@end
