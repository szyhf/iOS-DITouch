//
//  DIScrollView.m
//  DITouch
//
//  Created by Back on 16/6/9.
//  Copyright © 2016年 Back. All rights reserved.
//

#import "DIScrollView.h"
@interface DIScrollView()
@property (nonatomic, strong) UIView* view;
@end
@implementation DIScrollView
- (instancetype)init
{
	self = [super init];
	if (self) {
		self.view = [[UIView alloc]init];
		[self super_addSubview:self.view];
		[self.view mas_makeConstraints:^(MASConstraintMaker *make)
		{
			make.edges.equalTo(self);
			make.width.equalTo(self).priority(999);
		}];
	}
	return self;
}

-(void)super_addSubview:(UIView*)view
{
	[super addSubview:view];
}

-(void)addSubview:(UIView *)view
{
	[self.view addSubview:view];
}
@end
