//
//  yepApiManager.h
//  WhatToEat
//
//  Created by WEI XIE on 2015-07-12.
//  Copyright (c) 2015 WEI.XIE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface yepApiManager : NSObject

/**
 Query the Yelp API with a given term and location and displays the progress in the log
 
 @param term: The term of the search, e.g: dinner
 @param location: The location in which the term should be searched for, e.g: San Francisco, CA
 */
- (void)queryTopBusinessInfoForTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSArray *businessInfos, NSError *error))completionHandler;

@end
