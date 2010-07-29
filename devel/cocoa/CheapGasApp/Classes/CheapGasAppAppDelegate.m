//
//  CheapGasAppAppDelegate.m
//  CheapGasApp
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import "CheapGasAppAppDelegate.h"

#import "CheapGasAppViewController.h"

@implementation CheapGasAppAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
     
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

