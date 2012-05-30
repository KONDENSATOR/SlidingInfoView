//
//  SlidingInfoView.m
//  InfoTest
//
//  Created by Martin Lübcke on 2012-03-15.
//  Copyright (c) 2012 Kondensator. All rights reserved.
//

#import "SlidingInfoView.h"
#import "AppDelegate.h"

static CGFloat InfoViewHeight = 50;
static SlidingInfoView *sharedInstance;

@implementation SlidingInfoView {
    // _measureView is transparent and resized with sole purpose to keep track of size changes (rotations)
    UIView *_measureView, *_sibling;
    UIImageView *_infoView;
    UITextView *_textView;
    BOOL openStatus;
}

- (void)setInfoViewOpen:(BOOL)isOpen {
    CGFloat height = isOpen ? InfoViewHeight : 0;
    CGRect frame = _measureView.frame;
    _infoView.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height-height, frame.size.width, height);
}

- (void)setSiblingOpen:(BOOL)isOpen {
    CGFloat height = isOpen ? InfoViewHeight : 0;
    CGRect frame = _measureView.frame;
    _sibling.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height-height);
}

- (void) generateInfoView {
    
    _infoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fotifier_background.png"]];
    [self setInfoViewOpen:NO];
    _infoView.backgroundColor = [UIColor grayColor];
    
    _infoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, _infoView.frame.size.width-20, InfoViewHeight)];
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont boldSystemFontOfSize:24]; //[UIFont boldSystemFontOfSize:InfoViewHeight/2];
    _textView.textColor = [UIColor darkGrayColor];
    [_infoView addSubview:_textView];
}

- (void)setHostView:(UIView *)hostView onSubView:(NSUInteger)index {
    _sibling = [hostView.subviews objectAtIndex:index];
    _measureView = [[UIView alloc] initWithFrame:_sibling.frame];
    _measureView.backgroundColor = [UIColor clearColor];
    _measureView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _measureView.userInteractionEnabled = NO;
    [hostView addSubview:_measureView];
    [self generateInfoView];
    [hostView addSubview:_infoView];
}

- (void)setIsOpen:(BOOL)isOpen {
    if (isOpen != openStatus) {
        openStatus = isOpen;
        [UIView beginAnimations:@"ToggleInfoView" context:nil];
        [self setSiblingOpen:isOpen];
        [self setInfoViewOpen:isOpen];
        [UIView commitAnimations];
    }
}

- (void)closeInfoView {
    [self setIsOpen:NO];
}

- (void)displayInfo:(NSString *)info for:(NSTimeInterval)time {
    _textView.text = info;
    [self setIsOpen:YES];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(closeInfoView) object:nil];
    
    if(time > 0) {
        [self performSelector:@selector(closeInfoView) withObject:nil afterDelay:time];    
    }
}

+ (SlidingInfoView *)sharedSlidingInfoView {
    if (!sharedInstance)
        sharedInstance = [[SlidingInfoView alloc] init];
    return sharedInstance;
}

@end
