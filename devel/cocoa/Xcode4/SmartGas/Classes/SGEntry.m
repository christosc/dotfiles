//
//  CCGasStationInfo.m
//  CheapGas
//
//  Created by Christos Chryssochoidis on 26/07/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "SGEntry.h"


@implementation SGEntry

//@synthesize literPrice;
@synthesize prices = _prices;
@synthesize brand = _brand;
@synthesize address = _address;



-(id) initWithBrand:(NSString *)brand address:(NSString *)address prices:(NSDictionary *)prices 
{
	self = [super init];
	if(self != nil) {
		self.brand = brand;
		self.address = address;
		self.prices = prices;
	}
	
	return self;
}

-(void)dealloc {
	[_prices release];
	[_brand release];
	[_address release];
	[super dealloc];
}

-(NSString *) description {
	NSString *descr = [NSString stringWithFormat:@"Brand:%@, address: %@, prices = ", self.brand, self.address, self.prices];
	return descr;
}

@end
