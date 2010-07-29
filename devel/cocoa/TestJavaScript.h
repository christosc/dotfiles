//
//  TestJavaScript.h
//  
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestJavaScript : NSObject {
    NSURLConnection *connectionInProgress;
    NSData *googleRequestResponseData;
    NSURL *googleURL;

}

@end
