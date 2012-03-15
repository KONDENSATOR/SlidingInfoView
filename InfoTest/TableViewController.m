//
//  TableViewController.m
//  InfoTest
//
//  Created by Martin Lübcke on 2012-03-15.
//  Copyright (c) 2012 Kondensator. All rights reserved.
//

#import "TableViewController.h"
#import "SlidingInfoView.h"

@implementation TableViewController {
    NSArray *_items;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _items = [NSArray arrayWithObjects:@"Apple", @"Banana", @"Cantaloupe", @"Durian", @"Egg plant", @"Fig", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_items objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[SlidingInfoView sharedSlidingInfoView] displayInfo:[_items objectAtIndex:indexPath.row] for:2];
}

@end
