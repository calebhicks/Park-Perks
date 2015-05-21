//
//  Park.h
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@import CoreLocation;

@interface Park : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) NSString *phoneNumber;

@property (strong, nonatomic) NSArray *perks;

@end
