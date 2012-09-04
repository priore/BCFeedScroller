//
//  ViewController.m
//  FeedScroller
//
//  Created by Danilo Priore on 03/09/12.
//  Copyright (c) 2012 Danilo Priore. All rights reserved.
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

- (void)dealloc {
    [feedViewController release];
    [super dealloc];
}

@end
