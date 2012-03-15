//
//  SlidingInfoView.h
//  InfoTest
//
//  Created by Martin Lübcke on 2012-03-15.
//  Copyright (c) 2012 Kondensator. All rights reserved.
//

@interface SlidingInfoView : NSObject

- (void)setHostView:(UIView *)hostView onSubView:(NSUInteger)index;
- (void)displayInfo:(NSString *)info for:(NSTimeInterval)time;
+ (SlidingInfoView *)sharedSlidingInfoView;

@end
