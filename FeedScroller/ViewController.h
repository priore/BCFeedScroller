//
//  ViewController.h
//  FeedScroller
//
//  Created by Danilo Priore on 03/09/12.
//  Copyright (c) 2012 Danilo Priore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCFeedItemViewController.h"

@interface ViewController : UIViewController <BCFeedItemDelegate>
{
    BCFeedItemViewController *feedViewController;
}

@end
