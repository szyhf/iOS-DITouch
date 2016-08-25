//
//  DITableViewController.h
//  Fakeshion
//
//  Created by Back on 16/5/6.
//  Copyright © 2016年 Back. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DITableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end
