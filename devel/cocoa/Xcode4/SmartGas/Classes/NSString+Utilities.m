//
//  NSString+Utilities.m
//  Smart_Gas
//
//  Created by Christos Chryssochoidis on 14/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "NSString+Utilities.h"


@implementation NSString (Utilities)

int min(int i1, int i2, int i3) {
	int min = i1 < i2 ? i1 : i2;
	min = min < i3 ? min : i3;
	return min;
}


/* Edit distance between two strings. */
-(NSUInteger) distanceFrom:(NSString *)s {
	int m = [self length];
	int n = [s length];
	
	int d[m+1][n+1];
	
	for(int i = 0; i < m+1; i++)
		d[i][0] = i;
	for(int j = 0; j < n+1; j++)
		d[0][j] = j;
	
	for(int j = 1; j <= n; j++) {
		for(int i = 1; i <= m; i++) {
			if([self characterAtIndex:i-1] == [s characterAtIndex:j-1]) 
				d[i][j] = d[i-1][j-1];
			else
				d[i][j] = min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+1);
		}
	}
	
	return d[m][n];		
}

@end
