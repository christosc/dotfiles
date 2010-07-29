//
//  TestJavaScript.m
//  
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import "TestJavaScript.h"


@implementation TestJavaScript

@implementation


- (void) setUpRequest {
    googleURL = [[NSURL URLWithString:@"http://www.google.com/"] retain];
    googleRequestResponseData = [[NSMutableData data] retain];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0];
    connectionInProgress = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

#pragma mark NSURLConnection delegate methods

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [googleRequestResponseData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [web_screen loadData:googleRequestResponseData MIMEType:@"application/octet-stream" textEncodingName:@"utf-8" baseURL:googleURL];
    NSString *js_result = [web_screen stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('input')[1].value='test';"];
    NSLog (js_result);
    
    [googleURL release];
    [googleRequestResponseData release];
    [connectionInProgress release];
    connectionInProgress = nil;
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog (@"Connection failed to load data from Google!");
    [googleURL release];
    [googleRequestResponseData release];
    [connectionInProgress release];
    connectionInProgress = nil;
}
@end
