//
//  PriceWebView.h
//  Smart_Gas
//
//  Created by Christos Chryssochoidis on 13/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGRootViewController.h"

@class SGRootViewController;

@interface SGRootView : UIWebView {
	SGRootViewController *_rootViewController;
	UIActivityIndicatorView *_spinner;
}

@property (readwrite, assign) SGRootViewController *rootViewController;
@property (readwrite, retain) UIActivityIndicatorView *spinner;
@end
