//
//  TestUIWebViewAppDelegate.m
//  TestUIWebView
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import "TestUIWebViewAppDelegate.h"

#import "TestUIWebViewViewController.h"

@implementation TestUIWebViewAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    viewController = [[TestUIWebViewViewController alloc] initWithNibName:nil bundle:nil];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end

