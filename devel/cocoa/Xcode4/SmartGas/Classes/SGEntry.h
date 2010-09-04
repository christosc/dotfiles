//
//  CCGasStationInfo.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 26/07/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import <Foundation/Foundation.h>


/** Class representing an entry of a gas station information. */
@interface SGEntry : NSObject {
	
	NSDictionary *_prices;
	NSString *_brand;
	NSString *_address;
}


-(id) initWithBrand:(NSString *)brand address:(NSString *)address prices:(NSDictionary *)prices;

//@property (assign) float literPrice;
@property (readwrite, retain) NSDictionary *prices;
@property (readwrite, retain) NSString *brand;
@property (readwrite, retain) NSString *address;
@end
