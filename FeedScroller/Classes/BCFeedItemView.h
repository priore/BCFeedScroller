//
//  BCFeedItemView.h
//  FeedScroller
//
//  Created by Danilo Priore on 01/09/12.
//  Copyright (c) 2012 Prioregroup.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCFeedItemView : UIView

@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UILabel *descriptionLabel;

@property (nonatomic, retain) UILabel *dayLabel;
@property (nonatomic, retain) UILabel *monthLabel;
@property (nonatomic, retain) UILabel *yearLabel;

@property (nonatomic, retain) UIImageView *backgroundImageView;
@property (nonatomic, readonly) NSInteger descriptionMaxHeight;

@end
