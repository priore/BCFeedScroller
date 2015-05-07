//
//  ViewController.m
//  FeedScroller
//
//  Created by Danilo Priore on 03/09/12.
//  Copyright (c) 2012 Danilo Priore. All rights reserved.
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

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // feed size and url
    CGRect rect = CGRectMake(0, 100, 320, 110);
    NSURL *url = [NSURL URLWithString:@"http://www.prioregroup.com/hotnews.rss"];
    
    // init feed viewcontroller
    feedViewController = [[BCFeedItemViewController alloc] initWithFrame:rect];
    feedViewController.delegate = self;
    feedViewController.presentationInterval = 4;
    feedViewController.animateWithDuration = 1.5;
    feedViewController.animationOptions = UIViewAnimationOptionTransitionFlipFromRight;
    [self.view addSubview:feedViewController.view];
    
    // loading feed and start animation
    [feedViewController startWithFeedURL:url];
}

#pragma mark - BCFeedItemViewController Delegate

- (void)bcFeedItem:(BCFeedItemViewController *)bcFeedItem openURL:(NSURL *)url {
    // call when a feed is selected (optional)
    // show the feed page with standard browser
    [[UIApplication sharedApplication] openURL:url];
}

- (void)bcFeedItem:(BCFeedItemViewController *)bcFeedItem itemView:(BCFeedItemView *)view {
    // call before the feed is displayed (optional)
    if (view.tag%2 == 0)
        [view.backgroundImageView setImage:[UIImage imageNamed:@"background1.png"]];
    else
        [view.backgroundImageView setImage:[UIImage imageNamed:@"background2.png"]];
}

@end
