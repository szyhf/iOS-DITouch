//
//  DITableViewController.m
//  Fakeshion
//
//  Created by Back on 16/5/6.
//  Copyright © 2016年 Back. All rights reserved.
//

#import "DITableViewController.h"
#import "Masonry.h"
@interface DITableViewController()
@property(atomic) NSDictionary* delegates;
@end

@implementation DITableViewController
@synthesize delegates;
@synthesize tableView;
- (instancetype)init
{
	self = [super init];
	if (self)
	{
		tableView = [[UITableView alloc]init];
		[tableView setDelegate:self];
		[tableView setDataSource:self];
		[self.view addSubview:tableView];
		[[self view]setBackgroundColor:[UIColor whiteColor]];
		[self.tableView setEstimatedRowHeight:108];
		[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make)
		 {
			 make.top.equalTo(self.mas_topLayoutGuide);
			 make.left.equalTo(self.tableView.superview.mas_left);
			 make.right.equalTo(self.tableView.superview.mas_right);
			 make.bottom.equalTo(self.mas_bottomLayoutGuide);
		 }];
	}
	return self;
}

-(void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];
	[self.tableView setScrollIndicatorInsets:UIEdgeInsetsMake(0,0,0,0)];
	[self.tableView setContentInset:UIEdgeInsetsMake(0,0,0,0)];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 0;
}
@end
