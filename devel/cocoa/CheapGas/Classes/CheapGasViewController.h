//
//  CheapGasViewController.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCGasStationInfo.h"

@interface CheapGasViewController : UIViewController <UITextFieldDelegate> {
//    IBOutlet UITextField *urlField;
    IBOutlet UIWebView *webView;
	NSMutableData *receivedData;
	NSArray *gasStationInfoEntries;
	IBOutlet UIActivityIndicatorView *activityIndicator;
}

//-(IBAction) loadUrl:(id)sender;
@end

