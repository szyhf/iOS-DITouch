//
//  SegmentSuspendScrollView.h
//  Fakeshion
//
//  Created by Back on 16/5/13.
//  Copyright © 2016年 Back. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentSuspendScrollViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic)UIView* infoView;
@property(nonatomic)UIView* suspendView;
@property(nonatomic)UITableView* tableView;
@end
