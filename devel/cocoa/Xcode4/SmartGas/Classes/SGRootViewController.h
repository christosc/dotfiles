//
//  CheapGasViewController.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGEntry.h"
#import <CoreLocation/CoreLocation.h>
#import "SGEntryDownloader.h"
#import <UIKit/UIWebView.h>
#import <UIKit/UIView.h>
//#import "PriceWebView.h"
#import <MapKit/MapKit.h>
#import <libxml/HTMLParser.h>
#import <libxml/xpath.h>
#import <Foundation/NSString.h>
#import <Foundation/NSThread.h>
#import <Foundation/NSInvocation.h>
#import "SGRootView.h"

@class SGRootView;

@interface SGRootViewController : UIViewController <SGEntryDownloaderDelegate, /*MKReverseGeocoderDelegate,*/ CLLocationManagerDelegate> {
    //    IBOutlet UITextField *urlField;
@private	
    //	BOOL					_downloadActive;
    SGRootView 				*_rootView;
//	UIActivityIndicatorView *_spinner;
    //	UILabel					*loadingLabel;
    //    UINavigationBar         *_navbar;
	NSArray					*_entries;
    //	GeocodeInfo				*geocodeInfo;
	SGEntryDownloader       *_downloader;
	FuelType                 _fuelType;
	CLLocationDistance	     _updateDistance;
	int						 _fuelAmount;
	NSURL                   *_bundleURL;
    //	NSOperationQueue		*operationQueue;
	MKReverseGeocoder       *_reverseGeocoder;
    //	MKPlacemark				*_currentPlacemark;
	NSDictionary			*_subAdminAreaDictionary;
	CLLocationManager       *_locationManager;
	NSOperationQueue		*_downloadQueue;
	NSString * _locality;
	NSString * _subAdminArea;
}


-(id)initWithFuelType:(FuelType)type fuelAmount:(int)amount updateDistance:(CLLocationDistance) distance;

// SGEntryDownloaderDelegate
-(void)entryDownloadStarted:(SGEntryDownloader *)downloader;
-(void)entryDownloadFinished:(SGEntryDownloader *)downloader withEntries:(NSArray *)entries;
-(void)entryDownloadFailed:(SGEntryDownloader *)downloader withError:(NSError *)error;

/*
 // MKReverseGeocoderDelegate
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark;
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error;
 */

// CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation; 
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;


// For the associated view to use
-(NSString *) HTMLForEntries;

//@property (readonly) NSURL           		*bundleURL;
@property (readwrite,assign) SGRootView	 *rootView;
@property (readonly) FuelType				fuelType;
@property (readonly) CLLocationDistance 	updateDistance;
@property (readonly) int					fuelAmount;
//@property (readwrite, retain) NSArray  		*gasStationEntries;
//@property (readwrite, retain) GeocodeInfo 	*geocodeInfo;
@property (readonly) NSURL *bundleURL;
@end

