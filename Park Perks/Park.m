//
//  Park.m
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import "Park.h"

@implementation Park

@dynamic name;
@dynamic city;
@dynamic location;
@dynamic phoneNumber;

@dynamic perks;

+ (NSString *)parseClassName {
    return @"Park";
}

@end
