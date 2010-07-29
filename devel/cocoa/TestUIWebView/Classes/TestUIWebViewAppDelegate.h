//
//  TestUIWebViewAppDelegate.h
//  TestUIWebView
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import <UIKit/UIKit.h>

@class TestUIWebViewViewController;

@interface TestUIWebViewAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    TestUIWebViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet TestUIWebViewViewController *viewController;

@end

