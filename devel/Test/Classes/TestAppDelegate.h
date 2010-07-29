//
//  TestAppDelegate.h
//  Test
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import <UIKit/UIKit.h>

@class TestViewController;

@interface TestAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    TestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet TestViewController *viewController;

@end

