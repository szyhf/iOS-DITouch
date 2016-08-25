//
//  DICell.m
//  Fakeshion
//
//  Created by Back on 16/5/11.
//  Copyright © 2016年 Back. All rights reserved.
//

#import "DICell.h"

@implementation DICell

/**
 *  默认用于当前类型的单元格的重用辨识符
 */
@synthesize Identify;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		//默认使用当前类名作为辨识名
		[self setIdentify:NSStringFromClass([self class])];
		// Fix the bug in iOS7 - initial constraints warning
		self.contentView.bounds = [UIScreen mainScreen].bounds;
	}
	return self;
}

+(NSString*)Identify
{
	return NSStringFromClass([self class]);
}
@end
