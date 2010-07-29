//
//  TestUIWebViewViewController.m
//  TestUIWebView
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import "TestUIWebViewViewController.h"

@implementation TestUIWebViewViewController

- (void) setupConnection {
    url = [[NSURL URLWithString:@"http://www.google.com/"] retain];
    responseData = [[NSMutableData data] retain];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    activeConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}




// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    if (self = [super initWithNibName:nibName  bundle:nibBundle]) {
        [self setupConnection];
    }
    return self;
}





// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    webview = [[UIWebView alloc] init];
    webview.delegate = self;
//    [self setupConnection];
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark NSURLConnection delegate methods

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [webview loadData:responseData MIMEType:@"application/octet-stream" textEncodingName:@"utf-8" baseURL:url];
    NSString *js_result = [webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('input')[1].value='test';"];
    NSLog (@"%@", js_result);
    
    [url release];
    [responseData release];
    [activeConnection release];
    activeConnection = nil;
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog (@"Connection failed to load data from Google!");
    [url release];
    [responseData release];
    [activeConnection release];
    activeConnection = nil;
}

@end
