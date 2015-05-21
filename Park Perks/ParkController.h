//
//  ParkController.h
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Park.h"
#import "Perk.h"

@interface ParkController : NSObject

+ (ParkController *)sharedInstance;
+ (void)setUpSamplePark;

@property (strong, nonatomic) NSArray *parks;
@property (strong, nonatomic) NSArray *perks;

@end
