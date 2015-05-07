//
//  BCFeedItemViewController.m
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
#define CGRectSetPos(r,x,y) CGRectMake(x,y,r.frame.size.width,r.frame.size.height)

#import "BCFeedItemViewController.h"
#import "MWFeedParser.h"

@interface BCFeedItemViewController () <MWFeedParserDelegate> {
    
    int feedIndex;
    CGRect viewFrame;
    
    BCFeedItemView *view_1;
    BCFeedItemView *view_2;
    
    NSMutableArray *parsedItems;
    MWFeedParser *feedParser;
}

@end

@implementation BCFeedItemViewController

@synthesize animationOptions, presentationInterval, animateWithDuration;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super init]) {
        
        feedIndex = -1;
        presentationInterval = 8;
        animateWithDuration = 1.5;
        
        viewFrame = frame;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.frame = viewFrame;
    self.view.backgroundColor = [UIColor clearColor];

    // view init and positioned out of main view
    CGSize size = viewFrame.size;
    view_1 = [[BCFeedItemView alloc] initWithFrame:CGRectMake(size.width, 0, size.width, size.height)];
    view_2 = [[BCFeedItemView alloc] initWithFrame:CGRectMake(size.width, 0, size.width, size.height)];
    
    // view add
    [self.view addSubview:view_1];
    [self.view addSubview:view_2];
    
    // enable gesture (tap) for view 1
    UITapGestureRecognizer *tapGesture_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didFeedItemSelected:)];
    [view_1 addGestureRecognizer:tapGesture_1];

    // enable gesture (tap) for view 2
    UITapGestureRecognizer *tapGesture_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didFeedItemSelected:)];
    [view_2 addGestureRecognizer:tapGesture_2];
    
    // buffer for parser
    parsedItems = [[NSMutableArray alloc] init];
}

- (void)startWithFeedURL:(NSURL*)url {
    // init and start parser
    feedParser = [[MWFeedParser alloc] initWithFeedURL:url];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeItemsOnly;
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];
}

#pragma mark - MWFeedParser.h Delegate

- (void)feedParserDidStart:(MWFeedParser *)parser {
    [parsedItems removeAllObjects];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    if (item.title != nil)
        [parsedItems addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {
    if (parsedItems.count > 0) {
        
        // animation start
        [self didNextFeedItem];
        NSTimer *timer = [NSTimer timerWithTimeInterval:presentationInterval target:self selector:@selector(didNextFeedItem) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
}

- (void)didNextFeedItem {
    
    // increase counter
    feedIndex++;
    if (feedIndex >= parsedItems.count - 1)
        feedIndex = 0;
    
    // feed data
    MWFeedItem *feedItem = [parsedItems objectAtIndex:feedIndex];
    
    // views flip
    BCFeedItemView *viewIn = view_1.frame.origin.x != 0 ? view_1 : view_2;
    BCFeedItemView *viewOut = view_1.frame.origin.x != 0 ? view_2 : view_1;
    
    // position out of view
    CGSize size = self.view.frame.size;
    viewIn.frame = CGRectSetPos(viewIn, size.width, 0);
    viewIn.tag = feedIndex;
    viewIn.alpha = 1;
    
    // title and description
    viewIn.textLabel.text = feedItem.title;
    viewIn.descriptionLabel.text = feedItem.summary;
    
    // format the data
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    NSString *dataS = [formatter stringFromDate:feedItem.date];
    NSArray *dataA = [dataS componentsSeparatedByString:@" "];
    
    // day, month, year
    viewIn.monthLabel.text = [[dataA objectAtIndex:1] substringToIndex:3];
    viewIn.yearLabel.text = [dataA objectAtIndex:2];
    viewIn.dayLabel.text = [dataA objectAtIndex:0];
    
    // generate delegate if defined
    if (delegate != nil && [delegate respondsToSelector:@selector(bcFeedItem:itemView:)])
        [delegate bcFeedItem:self itemView:viewIn];
    
    // resize description height
    [self fitHeightLabel:viewIn.descriptionLabel maxHeight:viewIn.descriptionMaxHeight];

    // start position
    switch (animationOptions) {
            
        case UIViewAnimationOptionTransitionFlipFromRight:
            viewIn.frame = CGRectSetPos(viewIn, size.width, 0);
            break;
            
        case UIViewAnimationOptionTransitionFlipFromLeft:
            viewIn.frame = CGRectSetPos(viewIn, -size.width, 0);
            break;
            
        default:
            viewIn.alpha = 0;
            viewIn.frame = CGRectSetPos(viewIn, 0, 0);
            break;
    }
    
    // show with animation
    [UIView animateWithDuration:animateWithDuration animations:^{
        
        switch (animationOptions) {
                
            case UIViewAnimationOptionTransitionFlipFromRight:
                viewIn.frame = CGRectSetPos(viewIn, 0, 0);
                if (viewOut.frame.origin.x == 0)
                    //viewOut.alpha = 0;
                    viewOut.frame = CGRectSetPos(viewOut, -size.width, 0);
                break;
                
            case UIViewAnimationOptionTransitionFlipFromLeft:
                viewIn.frame = CGRectSetPos(viewIn, 0, 0);
                if (viewOut.frame.origin.x == 0)
                    //viewOut.alpha = 0;
                    viewOut.frame = CGRectSetPos(viewOut, size.width, 0);
                break;
                
            default:
                viewIn.alpha = 1;
                viewOut.alpha = 0;
                break;
        }
        
    }];
}

#pragma mark - Gesture (Tap)

- (void)didFeedItemSelected:(UIViewController*)viewController
{
    MWFeedItem *feedItem = [parsedItems objectAtIndex:feedIndex];
    NSURL *url = [NSURL URLWithString:feedItem.link];
    
    // generate delegate if defined
    if (delegate != nil && [delegate respondsToSelector:@selector(bcFeedItem:openURL:)]) {
        [delegate bcFeedItem:self openURL:url];
        return;
    }
        
    // show the feed page with standard browser
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - Utility

- (void)fitHeightLabel:(UILabel*)label maxHeight:(CGFloat)maxHeight
{
    CGRect frame = label.frame;
	NSString *text = [label.text copy];
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.numberOfLines = 999;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize labelSize = [text sizeWithFont:label.font
                        constrainedToSize:constraintSize
                            lineBreakMode:0];
    
    frame.size.height = maxHeight;
    if (labelSize.height < maxHeight)
        frame.size.height = labelSize.height;
    label.frame = frame;
    label.text = text;
}

@end
