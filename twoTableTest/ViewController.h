//
//  ViewController.h
//  twoTableTest
//
//  Created by Matt Propst on 1/7/13.
//  Copyright (c) 2013 Matt Propst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    int selectedRow;
}
@property (strong) IBOutlet UITableView *table1;
@property (strong) IBOutlet UITableView *table2;

@end
