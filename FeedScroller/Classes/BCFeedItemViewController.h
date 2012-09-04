//
//  BCFeedItemViewController.h
//  FeedScroller
//
//  Created by Danilo Priore on 01/09/12.
//  Copyright (c) 2012 Prioregroup.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCFeedItemView.h"

@protocol BCFeedItemDelegate;

@interface BCFeedItemViewController : UIViewController

@property (nonatomic, assign) NSTimeInterval presentationInterval;
@property (nonatomic, assign) NSTimeInterval animateWithDuration;

// return or set the animation type (UIViewAnimationOptionTransitionFlipFromRight, UIViewAnimationOptionTransitionFlipFromLeft also UIViewAnimationOptionTransitionCrossDissolve)
@property (nonatomic, assign) UIViewAnimationOptions animationOptions;

@property (nonatomic, assign) id<BCFeedItemDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

// loading feed and start animation
- (void)startWithFeedURL:(NSURL*)url;

@end

@protocol BCFeedItemDelegate <NSObject>

@optional

// call when a feed is selected
- (void)bcFeedItem:(BCFeedItemViewController*)bcFeedItem openURL:(NSURL*)url;

// call before the feed is displayed
- (void)bcFeedItem:(BCFeedItemViewController*)bcFeedItem itemView:(BCFeedItemView*)view;

@end
