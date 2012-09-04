//
//  BCFeedItemView.m
//  FeedScroller
//
//  Created by Danilo Priore on 01/09/12.
//  Copyright (c) 2012 Prioregroup.com. All rights reserved.
//
#define MARGIN_SIZE     20

#import <QuartzCore/QuartzCore.h>
#import "BCFeedItemView.h"

@implementation BCFeedItemView

@synthesize textLabel, descriptionLabel;
@synthesize dayLabel, monthLabel, yearLabel;
@synthesize backgroundImageView, descriptionMaxHeight;

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        // background
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backgroundImageView.backgroundColor = [UIColor clearColor];
        backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:backgroundImageView];
        
        // month
        int y = MARGIN_SIZE;
        monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_SIZE, y, 50, 10)];
        monthLabel.textColor = [UIColor whiteColor];
        monthLabel.textAlignment = UITextAlignmentCenter;
        monthLabel.backgroundColor = [UIColor clearColor];
        monthLabel.font = [UIFont systemFontOfSize:10];
        monthLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        monthLabel.layer.shadowOffset = CGSizeZero;
        monthLabel.layer.shadowOpacity = 1;
        monthLabel.layer.shadowRadius = 2;
        [self addSubview:monthLabel];
        
        // day
        y += monthLabel.frame.size.height;
        dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_SIZE, y, monthLabel.frame.size.width, 35)];
        dayLabel.textColor = [UIColor greenColor];
        dayLabel.textAlignment = UITextAlignmentCenter;
        dayLabel.backgroundColor = [UIColor clearColor];
        dayLabel.font = [UIFont systemFontOfSize:30];
        dayLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        dayLabel.layer.shadowOffset = CGSizeZero;
        dayLabel.layer.shadowOpacity = 1;
        dayLabel.layer.shadowRadius = 2;
        [self addSubview:dayLabel];

        // title
        int titleXPos = dayLabel.frame.origin.x + dayLabel.frame.size.width;
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleXPos, y, frame.size.width - titleXPos - MARGIN_SIZE, 20)];
        textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont systemFontOfSize:12];
        textLabel.textColor = [UIColor yellowColor];
        textLabel.numberOfLines = 1;
        textLabel.minimumFontSize = 8.0;
        textLabel.adjustsFontSizeToFitWidth = YES;
        textLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        textLabel.layer.shadowOffset = CGSizeZero;
        textLabel.layer.shadowOpacity = 1;
        textLabel.layer.shadowRadius = 2;
        [self addSubview:textLabel];

        // year
        y += dayLabel.frame.size.height;
        yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_SIZE, y, monthLabel.frame.size.width, 10)];
        yearLabel.backgroundColor = [UIColor clearColor];
        yearLabel.font = [UIFont systemFontOfSize:10];
        yearLabel.textColor = [UIColor whiteColor];
        yearLabel.textAlignment = UITextAlignmentCenter;
        yearLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        yearLabel.layer.shadowOffset = CGSizeZero;
        yearLabel.layer.shadowOpacity = 1;
        yearLabel.layer.shadowRadius = 2;
        [self addSubview:yearLabel];
        
        // description
        y = textLabel.frame.origin.y + textLabel.frame.size.height;
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleXPos, y, frame.size.width - titleXPos - MARGIN_SIZE, frame.size.height - y - MARGIN_SIZE)];
        descriptionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        descriptionLabel.backgroundColor = [UIColor clearColor];
        descriptionLabel.font = [UIFont systemFontOfSize:10];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.numberOfLines = descriptionLabel.frame.size.height / descriptionLabel.font.capHeight;
        descriptionLabel.minimumFontSize = 8.0;
        descriptionLabel.adjustsFontSizeToFitWidth = YES;
        descriptionLabel.lineBreakMode = UILineBreakModeWordWrap;
        descriptionLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        descriptionLabel.layer.shadowOffset = CGSizeZero;
        descriptionLabel.layer.shadowOpacity = 1;
        descriptionLabel.layer.shadowRadius = 2;
        [self addSubview:descriptionLabel];
       
        // description max height
        descriptionMaxHeight = descriptionLabel.frame.size.height;
    }
    
    return self;
}

- (void)dealloc {
    
    [textLabel release];
    [descriptionLabel release];
    [dayLabel release];
    [monthLabel release];
    [yearLabel release];
    [backgroundImageView release];
    [super dealloc];
}

@end
