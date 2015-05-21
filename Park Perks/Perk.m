//
//  Perk.m
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import "Perk.h"

@implementation Perk

@dynamic name;
@dynamic categories;
@dynamic iconName;

+ (NSString *)parseClassName {
    return @"Perk";
}

@end
