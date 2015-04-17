//
//  Utils.m
//  WhatToEat
//
//  Created by WEI XIE on 2015-04-16.
//  Copyright (c) 2015 WEI.XIE. All rights reserved.
//

#import "Utils.h"
#import <UIColor+FlatUI.h>
#import <UIFont+FlatUI.h>
#import "UIConstants.h"

@implementation Utils

#define themeColorCode @"4A939F"


+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (FUIButton *)customizeButton:(FUIButton *)button
{
    button.buttonColor = [UIColor colorFromHexCode:themeColorCode];
    button.shadowColor = [UIColor grayColor];
    button.shadowHeight = 3.0f;
    button.cornerRadius = 6.0f;
    button.titleLabel.font = [UIFont boldFlatFontOfSize:17];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    return button;
}

@end
