//
//  BCFeedItemView.h
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

@interface BCFeedItemView : UIView

@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UILabel *descriptionLabel;

@property (nonatomic, retain) UILabel *dayLabel;
@property (nonatomic, retain) UILabel *monthLabel;
@property (nonatomic, retain) UILabel *yearLabel;

@property (nonatomic, retain) UIImageView *backgroundImageView;
@property (nonatomic, readonly) NSInteger descriptionMaxHeight;

@end
