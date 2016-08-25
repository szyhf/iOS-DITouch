//
//  CircleContentScroll.m
//  Fakeshion
//
//  Created by Back on 16/5/11.
//  Copyright © 2016年 Back. All rights reserved.
//


#import "SegmentContentViewController.h"
@interface SegmentContentViewController()
typedef void(^IndexChangedBlock)(NSInteger);
@property(nonatomic)IndexChangeBlock indexChangeBlock;
@end

@implementation SegmentContentViewController
@synthesize segmentControl;
@synthesize contentView;
@synthesize indexChangeBlock;

-(void)setSelectIndexChangedBlock:(IndexChangeBlock)changedBlock
{
	indexChangeBlock = changedBlock;
}

-(UIViewController*)viewAtIndex:(NSInteger)index
{
	return [self.contentsArray objectAtIndex:index];
}

- (instancetype)initWithViewControllers:(NSArray<UIViewController*>*)viewControllers
{
	self = [super init];
	if (self)
	{
		[self.contentsArray addObjectsFromArray:viewControllers];
		
		[self.view setBackgroundColor:[UIColor redColor]];
	}
	return self;
}

- (NSMutableArray<UIViewController*> *)contentsArray {
	if(_contentsArray == nil) {
		_contentsArray = [[NSMutableArray<UIViewController*> alloc] init];
	}
	return _contentsArray;
}

@end
