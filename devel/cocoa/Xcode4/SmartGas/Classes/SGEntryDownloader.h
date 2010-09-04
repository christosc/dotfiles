//
//  ObservatoryHandler.h
//  CheapGas
//
//  Created by Christos Chryssochoidis on 01/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "SGEntry.h"
//#import "GeocodeInfo.h"
#import <UIKit/UIWebView.h>
#import <MapKit/MapKit.h>
#import "JSON/JSON.h"

typedef enum FuelType {
	UNLEADED95=1,
	UNLEADED100,
	SUPER,
	DIESEL,
	HEATING_OIL
} FuelType;



@protocol SGEntryDownloaderDelegate;



/** This class is responsible for acquiring the prices data. It will get the price data lazily, upon call of the data property. 
 
 */

@interface SGEntryDownloader : NSObject  {
@private	
    //	NSMutableData 			*receivedData;
    //	NSArray 				*_gasStationEntries;	  
	NSDictionary 			*_subAdminAreaDictionary;          // (Province name, POST code) dictionary
    
	NSMutableData			*_receivedData;										
	FuelType	 			 _fuelType;
	id<SGEntryDownloaderDelegate>		 _delegate;
	NSURLConnection         *_entryConnection;
    //	NSOperationQueue        *operationQueue;
}

-(id)initWithFuelType:(enum FuelType)type delegate:object;
//-(void) buildSubAdminAreaDictionary;

/** This method is to be called in a backgorund thread. */
//-(void)downloadEntriesForPlace:(MKPlacemark *)place;
-(void) downloadEntriesForSubAdminArea:(NSString *)subAdminAreaName locality:(NSString *)localityName ;
@property (readwrite, assign) id<SGEntryDownloaderDelegate> delegate;
//@property (readwrite, retain) NSArray 	   *gasStationEntries;

@property (readwrite, assign) FuelType 				fuelType;  		   // if this is set, we must update the data 



@end


/** The protocol that every DataDownloader's delegate should conform to. */
@protocol SGEntryDownloaderDelegate
-(void)entryDownloadStarted:(SGEntryDownloader *)downloader;
-(void)entryDownloadFinished:(SGEntryDownloader *)downloader withEntries:(NSArray *)entries;
-(void)entryDownloadFailed:(SGEntryDownloader *)downloader withError:(NSError *)error;

@end

