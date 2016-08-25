//
//  DITableViewController+Proxy.m
//  Fakeshion
//
//  Created by Back on 16/5/13.
//  Copyright © 2016年 Back. All rights reserved.
//

#import "DITableViewController+Proxy.h"
@interface DITableViewController()
@property(atomic) NSDictionary* delegates;
@end

@implementation DITableViewController (Proxy)

/**
 *  有多少个分组
 *
 *  @param tableView
 *
 *  @return 分组数量
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [[self delegates]count];
}

/*** UITableViewDataSource Delegate ***/

/*** Require ***/
//-  (NSString*)tableView:(UITableView *)tableView
//titleForHeaderInSection:(NSInteger)section
//{
//	NSString* index =   [NSString stringWithFormat: @"%ld", (long)section];
//	id<UITableViewDataSource> delegate = [[self delegates]objectForKey:index];
//	return [delegate tableView:tableView titleForHeaderInSection:section];
//}
//
///**
// *  indexPath位置的单元格
// *
// *  @param tableView
// *  @param indexPath
// *
// *  @return
// */
//- (UITableViewCell *)tableView:(UITableView *)tableView
//		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	NSString* index =   [NSString stringWithFormat: @"%ld", (long)indexPath.section];
//	id<UITableViewDataSource> delegate = [[self delegates]objectForKey:index];
//	return [delegate tableView:tableView cellForRowAtIndexPath:indexPath];
//}
//
///*** end require ***/
//
///**
// *  指定分组有多少行
// *
// *  @param tableView
// *  @param section
// *
// *  @return
// */
//- (NSInteger)tableView:(UITableView *)tableView
// numberOfRowsInSection:(NSInteger)section
//{
//	NSString* index =   [NSString stringWithFormat: @"%ld", (long)section];
//	id<UITableViewDataSource> delegate = [[self delegates]objectForKey:index];
//	return [delegate tableView:tableView numberOfRowsInSection:section];
//}
//
//
//
//-    (CGFloat)tableView:(UITableView *)tableView
//heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	NSString* index =   [NSString stringWithFormat: @"%ld", (long)indexPath.section];
//	id<UITableViewDelegate> delegate = [[self delegates]objectForKey:index];
//	if ([delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
//		return [delegate tableView:tableView heightForRowAtIndexPath:indexPath];
//	}
//	return tableView.rowHeight;
//}
@end
