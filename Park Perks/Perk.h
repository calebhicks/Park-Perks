//
//  Perk.h
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import <Parse/Parse.h>

typedef enum CategoryType : NSUInteger
{
    CategoryPlayground,
    CategoryExercise,
    CategoryNature,
    CategoryWater,
    CategorySports,
    CategoryHistory,
    CategoryFacilities,
    CategoryPicnic
} CategoryType;

@interface Perk : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSString *iconName; // icon name vs img

@end
