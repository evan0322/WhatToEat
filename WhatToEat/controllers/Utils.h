//
//  Utils.h
//  WhatToEat
//
//  Created by WEI XIE on 2015-04-16.
//  Copyright (c) 2015 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <FlatUIKit/FUIButton.h>

@interface Utils : NSObject

+ (Utils *)sharedInstance;

- (FUIButton *)customizeButton: (FUIButton *)button;

@end
