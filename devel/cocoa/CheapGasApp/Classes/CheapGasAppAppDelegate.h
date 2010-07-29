//
//  CheapGasAppAppDelegate.h
//  CheapGasApp
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//


#import <UIKit/UIKit.h>

@class CheapGasAppViewController;

@interface CheapGasAppAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    CheapGasAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet CheapGasAppViewController *viewController;

@end

