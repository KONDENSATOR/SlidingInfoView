//
//  SlidingInfoView.m
//  InfoTest
//
//  Created by Martin Lübcke on 2012-03-15.
//  Copyright (c) 2012 Kondensator. All rights reserved.
//

#import "SlidingInfoView.h"
#import "AppDelegate.h"

static CGFloat InfoViewHeight = 60;

@implementation SlidingInfoView {
    CGRect _frame;
    UIView *_sibling;
    UIView *_infoView;
    UITextView *_textView;
}

- (CGRect)topSlice:(CGFloat)height {
    return CGRectMake(_frame.origin.x, _frame.origin.y, _frame.size.width, _frame.size.height-height);
}

- (CGRect)bottomSlice:(CGFloat)height {
    return CGRectMake(_frame.origin.x, _frame.origin.y+_frame.size.height-height, _frame.size.width, height);
}

- (void) generateInfoView {
    _infoView = [[UIView alloc] initWithFrame:[self bottomSlice:0]];
    _infoView.backgroundColor = [UIColor grayColor];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, _infoView.frame.size.width-20, InfoViewHeight)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont boldSystemFontOfSize:InfoViewHeight/2];
    [_infoView addSubview:_textView];
}

- (void)setHostView:(UIView *)hostView onSubView:(NSUInteger)index {
    _sibling = [hostView.subviews objectAtIndex:index];
    _frame = _sibling.frame;
    [self generateInfoView];
    [hostView addSubview:_infoView];
}

- (void)setIsOpen:(BOOL)isOpen {
    [UIView beginAnimations:@"ToggleInfoView" context:nil];
    _sibling.frame = isOpen ? [self topSlice:InfoViewHeight] : _frame;
    _infoView.frame = isOpen ? [self bottomSlice:InfoViewHeight] : [self bottomSlice:0];
    [UIView commitAnimations];
}

- (void)closeInfoView {
    [self setIsOpen:NO];
}

- (void)displayInfo:(NSString *)info for:(NSTimeInterval)time {
    _textView.text = info;
    [self setIsOpen:YES];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(closeInfoView) object:nil];
    [self performSelector:@selector(closeInfoView) withObject:nil afterDelay:time];
}

+ (void)displayInfo:(NSString *)info for:(NSTimeInterval)time {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.slidingInfoView displayInfo:info for:time];
}

@end
