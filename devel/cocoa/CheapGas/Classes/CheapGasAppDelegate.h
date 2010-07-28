//
//  CheapGasAppDelegate.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import <UIKit/UIKit.h>

@class CheapGasViewController;

@interface CheapGasAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    CheapGasViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet CheapGasViewController *viewController;

@end

