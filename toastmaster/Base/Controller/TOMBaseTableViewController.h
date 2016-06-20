//
//  TOMBaseTableViewController.h
//  toastmaster
//
//  Created by apple on 16/6/19.
//  Copyright (c) 2016年 toastmaster. All rights reserved.
//

#import "TOMBaseViewController.h"

@interface TOMBaseTableViewController : TOMBaseViewController <UITableViewDataSource, UITableViewDelegate, P_QLDragToRefresh>

@property (nonatomic, strong) UITableView *tableView;

- (void)resetTableViewFrame:(CGRect)frame;

@end
