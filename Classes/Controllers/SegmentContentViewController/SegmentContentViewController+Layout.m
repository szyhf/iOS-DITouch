//
//  SegmentContentViewController+Layout.m
//  Fakeshion
//
//  Created by Back on 16/5/12.
//  Copyright © 2016年 Back. All rights reserved.
//

#import "SegmentContentViewController.h"
@interface SegmentContentViewController()
{
	NSArray<UIViewController*>* _contentsArray;
}
@end
@implementation SegmentContentViewController (Layout)

-(void)viewDidLoad
{
	[super viewDidLoad];
	if(self.contentsArray.count>0)
	{
		[self initliazeSegment];
		[self initliazeContent];
	}
}

-(void)initliazeSegment
{
	NSArray* titles = [self.contentsArray valueForKeyPath:@"title"];
	[self setSegmentControl:[[HMSegmentedControl alloc]initWithSectionTitles:titles]];
	[self.view addSubview:self.segmentControl];
	
	self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
	
	//背景色
	self.segmentControl.backgroundColor = [UIColor colorWithRed:60/255. green:83/255. blue:113/255. alpha:1];
	
	//指示标的颜色
	self.segmentControl.selectionIndicatorColor = [UIColor whiteColor];
	
	//指示标高度
	self.segmentControl.selectionIndicatorHeight = 2;
	
	//指示标下方留个一个像素的空档
	self.segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -1, 0);
	
	//指示标位置
	self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
	
	//self.segmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleDynamic;
	
	//标题字体
	self.segmentControl.titleTextAttributes =
  		@{
		  NSFontAttributeName:[UIFont systemFontOfSize:14],
		  NSForegroundColorAttributeName:[UIColor whiteColor],
		  };
	[self.segmentControl setIndexChangeBlock:self.segmentIndexChanged];
}

-(void)initliazeContent
{
	[self setContentView:[[UIScrollView alloc]init]];
	[self.view addSubview:self.contentView];
	
	self.contentView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
	self.contentView.pagingEnabled = YES;
	//	self.contentView.showsHorizontalScrollIndicator = NO;
	self.contentView.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

-(void)viewWillLayoutSubviews
{
	[self layoutSegment];
	[self layoutContent];
	[super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	CGFloat contentWidth = self.contentView.bounds.size.width*[self.contentsArray count];
	CGFloat contentHeight = self.contentView.bounds.size.height;
	[self.contentView setContentSize:CGSizeMake(contentWidth, contentHeight)];
}

-(void)layoutSegment
{
	[self.segmentControl mas_remakeConstraints:^(MASConstraintMaker *make)
	{
		make.top.equalTo(self.mas_topLayoutGuide);
		make.centerX.equalTo(self.segmentControl.superview);
		//make.left.equalTo(self.segmentControl.superview);
		//make.right.equalTo(self.segmentControl.superview);
		make.width.equalTo([NSNumber numberWithInteger:(103+8*8)]);
		make.height.lessThanOrEqualTo(@32);
	}];
}

-(void)layoutContent
{
	[self.contentView mas_makeConstraints:^(MASConstraintMaker *make)
	{
		make.top.equalTo(self.segmentControl.mas_bottom);
		make.bottom.equalTo(self.view.mas_bottom);
		make.left.equalTo(self.view.mas_left);
		make.right.equalTo(self.view.mas_right);
	}];
	
	for (int i = 0; i < [self.contentsArray count]; i++)
	{
		UIViewController* viewCtl = [self.contentsArray objectAtIndex:i];
		[self addChildViewController:viewCtl];
		[self.contentView addSubview:viewCtl.view];
		
		[viewCtl.view mas_makeConstraints:^(MASConstraintMaker *make)
		 {
			 make.top.equalTo(self.contentView);
			 make.width.equalTo(self.contentView);
			 make.height.equalTo(self.contentView);
		 }];
	}
	
	UIViewController* firstViewCtl = [self.contentsArray objectAtIndex:0];
	[firstViewCtl.view mas_makeConstraints:^(MASConstraintMaker *make)
	{
		make.left.equalTo(self.contentView);
	}];
	
	for(int i = 1; i < [self.contentsArray count]; i++)
	{
		UIViewController* lastViewCtl = [self.contentsArray objectAtIndex:i-1];
		UIViewController* viewCtl = [self.contentsArray objectAtIndex:i];
		
		[lastViewCtl.view mas_updateConstraints:^(MASConstraintMaker *make)
		 {
			 make.right.equalTo(viewCtl.view.mas_left);
		 }];
	}
}

-(void(^)(NSInteger))segmentIndexChanged
{
	WS(weakSelf)
	return ^void(NSInteger index)
	{
		[weakSelf.contentView setContentOffset:
		 CGPointMake(index*self.contentView.frame.size.width, 0) animated:YES];
	};
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	CGFloat pageWidth = scrollView.frame.size.width;
	NSInteger page = scrollView.contentOffset.x / pageWidth;
	
	[self.segmentControl setSelectedSegmentIndex:page animated:YES];
}
@end
