//
//  NSString+Greek.m
//  Smart_Gas
//
//  Created by Christos Chryssochoidis on 14/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "NSString+Greek.h"


@implementation NSString (GreekUtilities)

/** It removes the accent marks from any capital letters within a Greek word having one. */
-(NSString *)removeAccentsFromCapitalGreek {
	int len = [self length];
	unichar *chars = malloc(len * sizeof(unichar));
	[self getCharacters:chars range:(NSRange){.length=len, .location=0}];
	NSMutableString *modified = [NSMutableString string];
	for(int i = 0; i < len; i++) {
		switch(chars[i]) {
				
				// Ά -> Α
			case 0x0386: case 0x1FBB:
				[modified appendString:@"\u0391"];
				break;
				
				// Έ -> Ε
			case 0x0388: case 0x1FC9: 
				[modified appendString:@"\u0395"];
				break;
				// Ί -> Ι
			case 0x038A: case 0x1FDB:
				[modified appendString:@"\u0399"];
				break;
				
				// Ό -> Ο	
			case 0x038C: case 0x1FF9:
				[modified appendString:@"\u039F"];
				break;
				
				// Ώ -> Ω
			case 0x038F: case 0x1FFB: 
				[modified appendString:@"\u03A9"];
				break;
				
				// Ή -> Η
			case 0x0389: case 0x1FCB: 
				[modified appendString:@"\u0397"];
				break;	
				
				// Ύ -> Υ
			case 0x038E: case 0x1FEB: [modified appendString:@"\u03A5"];
				break;
			default: [modified appendFormat:@"%C", chars[i]];
		}
	} 
	
	free(chars);
	return modified;
}
@end

