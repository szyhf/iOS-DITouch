/*
  CircleContentScroll.h
  Fakeshion

  Created by Back on 16/5/11.
  Copyright © 2016年 Back. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

@interface SegmentContentViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic)HMSegmentedControl* segmentControl;
@property(nonatomic)UIScrollView* contentView;
- (instancetype)initWithViewControllers:(NSArray<UIViewController*>*)viewControllers;
-(UIViewController*)viewAtIndex:(NSInteger)index;
-(void)setSelectIndexChangedBlock:(void(^)(NSInteger index))changedBlock;
@property (nonatomic, strong) NSMutableArray<UIViewController*>* contentsArray;
@end

@interface SegmentContentViewController (Layout)
@end

@interface SegmentContentViewController (Style)
@property (nonatomic, strong) UIColor* segmentBackgroundColor;
@end