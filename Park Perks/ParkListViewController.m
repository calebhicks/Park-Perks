//
//  ParkListViewController.m
//  Park Perks
//
//  Created by Caleb Hicks on 5/20/15.
//  Copyright (c) 2015 Skyler Clark. All rights reserved.
//

#import "ParkListViewController.h"
#import "ParkController.h"

@interface ParkListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ParkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self observeNotifications];
}

- (void)observeNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(parksLoadedNotification:) name:@"parksLoaded" object:nil];
}

- (void)parksLoadedNotification:(NSNotification *)sender {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *parkCell = [tableView dequeueReusableCellWithIdentifier:@"parkCell"];
    
    Park *park = [ParkController sharedInstance].parks[indexPath.row];
    
    parkCell.textLabel.text = park.name;
    
    NSMutableString *perkString = [NSMutableString new];
    
    for (Perk *perk in park.perks) {
        [perkString appendString:[NSString stringWithFormat:@"%@,", perk.name]];
    }
    
    parkCell.detailTextLabel.text = perkString;
    
    return parkCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ParkController sharedInstance].parks.count;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
