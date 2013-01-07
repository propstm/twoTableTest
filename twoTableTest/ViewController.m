//
//  ViewController.m
//  twoTableTest
//
//  Created by Matt Propst on 1/7/13.
//  Copyright (c) 2013 Matt Propst. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize table1;
@synthesize table2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    selectedRow = -1;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //POPULATE IF 0 CLIENT IS SELECTED
    NSMutableArray *firstArray = [[NSMutableArray alloc] init];

    
    
    [firstArray addObject:@"First Array 1"];
    [firstArray addObject:@"First Array 2"];
    [firstArray addObject:@"First Array 3"];
    [firstArray addObject:@"First Array 4"];
    [firstArray addObject:@"First Array 5"];
    [firstArray addObject:@"First Array 6"];


    NSMutableArray *secondaryArray = [[NSMutableArray alloc] init];
    
    
    [secondaryArray addObject:@"Sample String 1"];
    [secondaryArray addObject:@"Sample String 2"];
    [secondaryArray addObject:@"Sample String 3"];
    [secondaryArray addObject:@"Sample String 4"];
    [secondaryArray addObject:@"Sample String 5"];
    [secondaryArray addObject:@"Sample String 6"];
    [secondaryArray addObject:@"Sample String 7"];
    [secondaryArray addObject:@"Sample String 8"];
    [secondaryArray addObject:@"Sample String 9"];
    [secondaryArray addObject:@"Sample String 10"];
    [secondaryArray addObject:@"Sample String 11"];
    
    NSMutableArray *thirdArray = [[NSMutableArray alloc] init];
    [thirdArray addObject:@"Sample String 1 third array"];
    [thirdArray addObject:@"Sample String 2 third array"];
    [thirdArray addObject:@"Sample String 3 third array"];
    [thirdArray addObject:@"Sample String 4 third array"];
    [thirdArray addObject:@"Sample String 5 third array"];
    [thirdArray addObject:@"Sample String 6 third array"];
    [thirdArray addObject:@"Sample String 7 third array"];
    [thirdArray addObject:@"Sample String 8 third array"];
    [thirdArray addObject:@"Sample String 9 third array"];
    [thirdArray addObject:@"Sample String 10 third array"];
    [thirdArray addObject:@"Sample String 11 third array"];

    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // allocate the cell:
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 8.0, 300.0, 30.0)];
        [nameLabel setTag:indexPath.row];
        [nameLabel setBackgroundColor:[UIColor clearColor]]; // transparent label background
        [nameLabel setFont:[UIFont boldSystemFontOfSize:17.0]];
        // custom views should be added as subviews of the cell's contentView:
        [cell.contentView addSubview:nameLabel];
    }
    
    if(aTableView == table2){
        switch (selectedRow) {
            case 0:
                cell.textLabel.text = [firstArray objectAtIndex:indexPath.row];
                break;
            case 1:
                cell.textLabel.text = [secondaryArray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [thirdArray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
    }else{
        if(indexPath.row == 0){
            cell.textLabel.text = [secondaryArray objectAtIndex:indexPath.row * selectedRow];
        }
        if(indexPath.row == 1){
            cell.textLabel.text = @"row2";
        }
        if(indexPath.row == 2){
            cell.textLabel.text = @"row3";
        }
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == table1){
        return 4;
    }
    if(selectedRow == -1){
        return 0;
    }
    if(selectedRow != -1){
        return (selectedRow *2)+1;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedRow = indexPath.row;
    [table2 reloadData];
}

@end
