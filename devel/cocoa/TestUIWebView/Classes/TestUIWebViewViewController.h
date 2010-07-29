//
//  TestUIWebViewViewController.h
//  TestUIWebView
//
//  Created by Christos Chryssochoidis on 29/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestUIWebViewViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webview;
    NSMutableData *responseData;
    NSURLRequest *activeConnection;
    NSURL *url;
}

@end

