//
//  mainViewController.h
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import <UIColor+FlatUI.h>
#import <FlatUIKit/FUIButton.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet FUIButton *chooseButton;
@property (weak, nonatomic) IBOutlet FUIButton *addButton;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;


@end
