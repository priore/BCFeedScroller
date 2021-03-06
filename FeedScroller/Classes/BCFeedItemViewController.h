//
//  BCFeedItemViewController.h
//  FeedScroller
//
//  Created by Danilo Priore on 01/09/12.
//  Copyright (c) 2012 Prioregroup.com. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
