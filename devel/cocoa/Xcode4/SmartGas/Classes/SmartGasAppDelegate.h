//
//  CheapGasAppDelegate.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import <UIKit/UIKit.h>
//#import "DataController.h"
#import "SGRootViewController.h"



@interface SmartGasAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    //   PriceViewController *priceViewController;
	UINavigationController *navController;
}

@property (nonatomic, retain) UIWindow *window;


//@property (nonatomic, retain) PriceViewController *priceViewController;
@property (readwrite, retain) UINavigationController *navController;
@end

