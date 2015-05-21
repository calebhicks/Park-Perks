//
//  ParkSearchViewController.m
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import "ParkSearchViewController.h"
#import "ParkController.h"

@interface ParkSearchViewController () <UITableViewDataSource>

@end

@implementation ParkSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    Perk *perk = [ParkController sharedInstance].perks;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"perkCell"];
    
    cell.textLabel.text = perk.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CategoryPicnic +1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
