//
//  CheapGasAppDelegate.m
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import "SmartGasAppDelegate.h"





@implementation SmartGasAppDelegate


@synthesize window;
@synthesize navController;

//@synthesize priceViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	FuelType fuelType = [userDefaults integerForKey:@"fuel_type"];
	if(fuelType == 0) 
		fuelType = UNLEADED95;  // if default is missing, choose arbitrarily Unleaded 95
	int fuelAmount = [userDefaults integerForKey:@"fuel_amount"];
	if(fuelAmount == 0)
		fuelAmount = 1; // if default is missing, 1 liter default fuel amount
	CLLocationDistance distance = [userDefaults doubleForKey:@"update_distance"];
	if(distance == 0.0)
		distance = 500.0;  // if default is missing, 500m distance for issuing updates on data
	NSLog(@"%s fuelType=%d, fuelAmount=%d, distance=%f", __PRETTY_FUNCTION__, fuelType, fuelAmount, distance);	
    //	NSLog(@"%s %@", __PRETTY_FUNCTION__, [[NSRunLoop currentRunLoop] currentMode]);
    //	NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSRunLoop mainRunLoop]);
    //	NSLog(@"%s %@", __PRETTY_FUNCTION__, [[NSRunLoop mainRunLoop] currentMode]);
	
    
	SGRootViewController  *rootViewController = [[SGRootViewController alloc] initWithFuelType:fuelType fuelAmount:fuelAmount updateDistance:distance];
	self.navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	[window addSubview:navController.view];
	[rootViewController release];
	[window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	SGRootViewController *rootViewController = [[navController viewControllers] objectAtIndex:0];
	[defaults setInteger:[rootViewController fuelType] forKey:@"fuel_type"];
	[defaults setInteger:[rootViewController fuelAmount] forKey:@"fuel_amount"];
	[defaults setInteger:[rootViewController updateDistance] forKey:@"update_distance"];
}

- (void)dealloc {
    
    [window release];
    [navController release];
    //	[dataController release];
    [super dealloc];
}

@end

