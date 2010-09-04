//
//  main.m
//  SmartGas
//
//  Created by Christos Chryssochoidis on 04/09/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"SmartGasAppDelegate");
    [pool release];
    return retVal;
}
