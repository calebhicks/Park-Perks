//
//  ParkController.m
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import "ParkController.h"

@implementation ParkController

+ (ParkController *)sharedInstance {
    static ParkController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ParkController new];
        
        [sharedInstance loadParks];
        [sharedInstance loadPerks];
    });
    return sharedInstance;
}

- (void)setUpSamplePark {
    Park *park = [Park new];
    
    NSInteger randomParkNumber = arc4random() % 100;
    
    NSInteger randomActivity = arc4random() % self.perks.count;
    NSInteger randomActivity2 = arc4random() % self.perks.count;
    NSInteger randomActivity3 = arc4random() % self.perks.count;
    
    park.name = [NSString stringWithFormat:@"Sample Park #%ld", (long)randomParkNumber];
    park.city = @"Lehi, Utah";
    park.phoneNumber = @"801-555-5555";
    
    park.perks = @[[ParkController sharedInstance].perks[randomActivity], [ParkController sharedInstance].perks[randomActivity2], [ParkController sharedInstance].perks[randomActivity3]];
    
    [park saveInBackground];
}

- (void)loadParks {
    PFQuery *query = [PFQuery queryWithClassName:@"Park"];
    [query includeKey:@"perks"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        self.parks = objects;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"parksLoaded" object:nil];
        
        NSLog(@"Parks Loaded!");
    }];
}

- (void)loadPerks {
    PFQuery *query = [PFQuery queryWithClassName:@"Perk"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        self.perks = objects;
        
        [[ParkController sharedInstance] setUpSamplePark];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"perksLoaded" object:nil];
        
        NSLog(@"Perks Loaded!");
    }];
}

@end
