//
//  CheapGasViewController.m
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import "SGRootViewController.h"
#import "NSString+Greek.h"
#import "NSString+Utilities.h"

#import <stdlib.h>
//#import "CCHTMLParser.h"


@interface SGRootViewController () 
-(NSString*) HTMLForEntry:(SGEntry *)entry;
-(void)startLocationUpdates;


-(NSString *) extractLocalityFromJSONDict:(NSDictionary*)jsonDict;
-(NSString *) extractSubAdminAreaFromJSONDict:(NSDictionary*)jsonDict;


@property (readwrite, assign) FuelType fuelType;
@property (readwrite, assign) CLLocationDistance updateDistance;
@property (readwrite, assign) int fuelAmount;
@property (readwrite, retain) MKReverseGeocoder *reverseGeocoder;
@property (readwrite, retain) MKPlacemark *currentPlacemark;
@property (readwrite, retain) NSDictionary *subAdminAreaDictionary;
@property (readwrite, retain) NSOperationQueue *downloadQueue;
@property (readwrite, retain) SGEntryDownloader *downloader;
@property (readwrite) UIActivityIndicatorView *spinner;
@property (readwrite, retain) CLLocationManager *locationManager;
//@property (readwrite, assign) BOOL downloadActive;
@property (readwrite, retain) NSArray *entries;
@property (readwrite, retain) NSString *locality;
@property (readwrite, retain) NSString *subAdminArea;


/*
 -(NSDictionary *) scrapeSubAdminAreas:(NSString *)html;
 -(NSDictionary *)scrapeLocalities:(NSString *)html;
 -(NSDictionary *)scrapeSublocalities:(NSString *)html;
 -(SGEntryDownloader *) gasStationFromXMLNode:(xmlNodePtr) currentNode;
 -(NSArray *) scrapeGasStations:(NSData *)responseData;
 */

//-(NSString*) htmlForGasStationEntries;
//-(NSString*) htmlForGasStation:(GasStation *)gasStation;

@end











@implementation SGRootViewController


#pragma mark Property implementation

@synthesize fuelType = _fuelType, updateDistance = _updateDistance, fuelAmount = _fuelAmount;
@dynamic bundleURL;
@synthesize reverseGeocoder = _reverseGeocoder;
@synthesize currentPlacemark = _currentPlacemark;
@synthesize subAdminAreaDictionary = _subAdminAreaDictionary;
@synthesize spinner = _spinner;
@synthesize downloadQueue = _downloadQueue;
@synthesize downloader = _downloader;
@synthesize locationManager = _locationManager;
//@synthesize downloadActive = _downloadActive;
@synthesize entries = _entries;
@synthesize rootView = _rootView;
@synthesize locality = _locality;
@synthesize subAdminArea = _subAdminArea;
-(NSURL *)bundleURL {
	if (_bundleURL == nil) {
		NSString *path = [[NSBundle mainBundle] bundlePath];
 	 	_bundleURL = [[NSURL fileURLWithPath:path] retain];
	}
	return _bundleURL;
}


#pragma mark -
#pragma mark Initialization

-(id)initWithFuelType:(FuelType)fuelType fuelAmount:(int)amount updateDistance:(CLLocationDistance) distance{
	if ((self = [super initWithNibName:nil bundle:nil])) {
        
		self.fuelType = fuelType;
		self.fuelAmount   = amount;
		self.updateDistance = distance;
		self.downloader = [[SGEntryDownloader alloc] initWithFuelType:fuelType delegate:self];
        //		self.downloadActive = NO;
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.distanceFilter = self.updateDistance;
		self.locationManager.delegate = self;
		
		if([CLLocationManager locationServicesEnabled] != YES)
			NSLog(@"%s Location services not enabled!", __func__);
		else
			NSLog(@"%s Location services enabled!", __func__);
		
        //		[NSThread detachNewThreadSelector:@selector(startLocationUpdates) toTarget:self withObject:nil];
        //		[self performSelectorInBackground:@selector(startLocationUpdates) withObject:nil];
        //		[self startLocationUpdates];
		/*		 
         self.operationQueue = [[NSOperationQueue alloc] init];
         [self.operationQueue setMaxConcurrentOperationCount:1];
		 NSInvocationOperation *operation = [NSInvocation alloc] initWithTarget:self.downloader selector:@selector(buildSubAdminDictionary) object:nil];
         [self.operationQueue addOperation:operation];
         [operation release];
         */ 
	}
	
	return self;
}

-(void)startLocationUpdates
{
	NSLog(@"%s Beginning, thread %@", __func__, [NSThread currentThread]);
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[[NSRunLoop currentRunLoop] run];
	[self.locationManager startUpdatingLocation];	
	[self.locationManager stopUpdatingLocation];
	[self.locationManager startUpdatingLocation];	
	
    
	[pool release];
}


#pragma mark -
#pragma mark View handling 

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	self.rootView = [[SGRootView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.rootView.rootViewController = self;
	self.view = self.rootView;
	self.view.multipleTouchEnabled = YES;
    //	[self.locationManager stopUpdatingLocation];
    //	[self performSelectorInBackground:@selector(startLocationUpdates) withObject:nil];
    //	_spinner = [[UIActivityIndicatorView alloc] initWithFrame:<#(CGRect)frame#>
	
	/*	
	 CGFloat centerX = webView.bounds.size.width  / 2.0;
	 CGFloat centerY = webView.bounds.size.height / 2.0;
	 UIActivityIndicatorView *aSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	 aSpinner.frame = CGRectMake(centerX, centerY, 40, 40);
	 //	aSpinner.frame.origin = CGPointMake(centerX, centerY);
	 //	aSpinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	 //	aSpinner.alpha = 0.5;
	 self->spinner = aSpinner;
	 //	CGRect spinnerFrame = spinner.frame;
	 //	spinnerFrame.origin.x = webView.bounds.size.width  / 2.0;
	 //	spinnerFrame.origin.y = webView.bounds.size.height / 2.0;
	 //	spinner.frame = spinnerFrame;
	 [webView addSubview:spinner];
	 */
}


/*
 - (void)drawRect:(CGRect)rect {
 NSLog(@"%s Beginning", __func__);
 NSString *generatedHTML = [self generateGasStationEntriesHTML:gasStationEntries];
 [webView loadHTMLString:generatedHTML baseURL:self->bundleURL];
 }
 */

/*
 - (void)hideLoadingIndicators
 {
 if (self.spinner) {
 [spinner stopAnimating];
 [spinner removeFromSuperview];
 [spinner release];
 spinner = nil;
 
 [loadingLabel removeFromSuperview];
 [loadingLabel release];
 loadingLabel = nil;
 }
 }
 
 
 - (void)showLoadingIndicators
 {
 if (!spinner) {
 spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
 
 loadingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
 loadingLabel.font = [UIFont systemFontOfSize:20];
 loadingLabel.textColor = [UIColor grayColor];
 loadingLabel.text = @"Φόρτωση...";
 [loadingLabel sizeToFit];
 
 static CGFloat bufferWidth = 8.0;
 
 CGFloat totalWidth = spinner.frame.size.width + bufferWidth + loadingLabel.frame.size.width;
 
 [self->webView addSubview:spinner];
 CGRect spinnerFrame = spinner.frame;
 spinnerFrame.origin.x = (self.webView.bounds.size.width - totalWidth) / 2.0;
 spinnerFrame.origin.y = (self.webView.bounds.size.height - spinnerFrame.size.height) / 2.0;
 spinner.frame = spinnerFrame;
 
 
 
 CGRect labelFrame = loadingLabel.frame;
 labelFrame.origin.x = (self.webView.bounds.size.width - totalWidth) / 2.0 + spinnerFrame.size.width + bufferWidth;
 labelFrame.origin.y = (self.webView.bounds.size.height - labelFrame.size.height) / 2.0;
 loadingLabel.frame = labelFrame;
 [self->webView addSubview:loadingLabel];
 spinner.alpha = 1;
 [spinner startAnimating];
 NSLog(@"%s Spinner started animating…", __PRETTY_FUNCTION__);
 
 }
 }
 
 */

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%s %@", __PRETTY_FUNCTION__, [[NSRunLoop currentRunLoop] currentMode]);      
    /*	
     if (dataController == nil) {
     dataController = [[DataController alloc] initWithUpdateDistance:self.updateDistance fuelType:UNLEADED95 delegate:self];
     }
     
     //[self beginLoadingPriceData];
     
     */
    
	[NSThread detachNewThreadSelector:@selector(startLocationUpdates) toTarget:self withObject:nil];
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	//	[webView release];
	self.rootView = nil;
}


/*
 -(void)beginLoadPriceData
 {
 
 
 NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:dataController selector:@selector(synchronousLoadFlickrData) object:nil];
 [operationQueue addOperation:operation];
 [operation release];
 }
 */


#pragma mark -
#pragma mark HTML generation

/** Generates the HTML on-the-fly for the list of gas station entries to be shown in the webview. 
 *	Input: The array of GasStationInfo entries.
 *	Output: The string containing the HTML for a list/table of gas station info entries. 
 */ 
-(NSString*)HTMLForEntries {
	
	NSMutableString *html = [NSMutableString string];  
	[html appendFormat:
	 @"<html"
	 "<head>"
	 "<link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\" />"
	 "</head>"
	 "<body>"
	 "<div id=\"title\""
	 "<h1>"
	 "%@"
	 "</h1>"
	 "%@"
	 "</div>"
	 "<hr>", self.locality, self.subAdminArea];
	
	if ([self.entries count] > 0) {
		[html appendString:@"<table id=\"maintable\">"]; 		 
	}
	else {
		[html appendString:@"<h3 style=\"text-align:center;\">Καμμία καταχώριση στο παρατηρητήριο τιμών καυσίμων για τον τόπον αυτόν</h3>"];
		
	}
	
	for(SGEntry *entry in self.entries) {
        [html appendString:[self HTMLForEntry:entry]];
	}
	if ([self.entries count] > 0) {
		[html appendString:@"</table>"];
	}
	[html appendString:
	 @"</body>"
	 "</html>"];
    NSLog(@"%s generated HTML: %@", __PRETTY_FUNCTION__ ,html);
	
	return html;   // This NSMutableString will be autoreleased
}



-(NSString*) HTMLForEntry:(SGEntry *)entry {
    
	
	// The price info is in SGEntry's dictionary, so we need to make an object to make a key for it
	NSNumber *fuelTypeObj = [NSNumber numberWithInt:self.fuelType];
	NSNumber *price = [entry.prices objectForKey:fuelTypeObj];
    //	NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    //	[numFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"] autorelease]];
    
	NSString *priceLocalized =  [price descriptionWithLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"] autorelease]];
	NSLog(@"%s priceLocalized = %@", __func__, priceLocalized);
    //    [numFormatter release];
    
    //	[fuelTypeObj release];
    NSMutableString *cell = [NSMutableString stringWithFormat:
							 @"<tr>"
							 "<td>"
							 "<table class=\"entry\">"
							 "<tr class=\"trademarkPrice\">"
							 "<td class=\"trademark\">%@</td><td class=\"price\">%@ €/l</td>"
							 "</tr>"
							 "<tr class=\"address\">"
							 "<td>%@</td><td class=\"arrow\"><img src=\"UITV_accessory_disclosure-modified.png\" alt=\"arrow\"></td>"
							 "</tr>"
							 "</table>"
							 "</td>"
							 "</tr>", entry.brand, priceLocalized, entry.address];
    
 	return cell;
}

#pragma mark -

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 
 [self fetchHTMLData]; // initiates the web connection and fetches the data.
 //    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
 //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 //    [webView loadRequest:request];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */



















#pragma mark Memory management


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	[self.view release];
	// Release any cached data, images, etc that aren't in use.
	NSLog(@"%s MEMORY WARNING RECEIVED!", __PRETTY_FUNCTION__);
}




















- (void)dealloc {
    //   [webView release];  // released in viewDidUnload
	[_spinner release];
	[_entries release];
    //	[geocodeInfo release];
	[_downloader release];
	[_bundleURL release];
	[_locality release];
	[_subAdminArea release];
	[_locationManager release];
    //	[operationQueue release];
	
	[super dealloc];
    
}













/*
 #pragma mark -
 #pragma mark DataObserver protocol implementation
 -(void)dataUpdateStarted:(DataController *)dataController {
 //	[self perfomSelectorOnMainThread:@selector(showLoadingIndicators) withObject:nil waitUntilDone:NO];
 NSLog(@"%s beginning", __PRETTY_FUNCTION__);
 [self showLoadingIndicators];	
 
 }
 
 -(void) dataUpdateFinished:(DataController *)senderController {
 NSLog(@"%s beginning", __PRETTY_FUNCTION__);
 self.gasStationEntries = senderController.gasStationEntries;
 self.geocodeInfo = senderController.geocodeInfo;
 // need to regenerate the html
 
 //	[self.webView 
 //	[self performSelectorOnMainThread:@selector(hideLoadingIndicators) withObject:nil waitUntilDone:NO];
 
 [self hideLoadingIndicators];
 [self.view setNeedsDisplay];
 //	[webView loadHTMLString:generatedHTML baseURL:self->bundleURL];
 
 }
 
 -(void)dataUpdateFailed:(DataController *)controller withError:(NSError *)error {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection failed" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
 [alert show];
 [alert release];
 }
 */

/*
 #pragma mark -
 #pragma mark MKReverseGeocoderDelegate
 
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
 {
 //	NSString *locality = placemark.locality;
 //	NSString *subAdminLevel = geocoder.placemark.subAdministrativeArea;
 
 NSLog(@"%s New placemark.subAdministrativeLevel = %@, locality = %@", __PRETTY_FUNCTION__, placemark.subAdministrativeArea, placemark.locality);
 
 if([placemark.locality isEqualToString:self.currentPlacemark.locality] && [placemark.subAdministrativeArea isEqualToString:self.currentPlacemark.subAdministrativeArea])
 return;  // if we haven't changed position in any significant way, return immediately to avoid redundant work
 
 self.currentPlacemark = placemark; // save new placemark so as to be able compare with the next time
 [self.downloader downloadEntriesForPlace:placemark];
 
 
 
 
 }
 
 
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
 {
 NSLog(@"%s MKReverseGeocoder has failed.", __func__);
 }
 */

-(NSString *) extractLocalityFromJSONDict:(NSDictionary*)jsonDict
{
	NSArray *results = [jsonDict objectForKey:@"results"];
	NSDictionary *results0 = [results objectAtIndex:0];
	NSArray *addressComponents = [results0 objectForKey:@"address_components"];
	
	NSString *locality = nil;
	for(NSDictionary *component in addressComponents) {
		NSArray *types = [component objectForKey:@"types"];
		if([types containsObject:@"locality"]) {
			locality = [component objectForKey:@"long_name"];
			break;
		}
        
	}
	
	return locality;
}

-(NSString *) extractSubAdminAreaFromJSONDict:(NSDictionary*)jsonDict
{
	NSArray *results = [jsonDict objectForKey:@"results"];
	NSDictionary *results0 = [results objectAtIndex:0];
	NSArray *addressComponents = [results0 objectForKey:@"address_components"];
	
	NSString *subAdminArea = nil;
	for(NSDictionary *component in addressComponents) {
		NSArray *types = [component objectForKey:@"types"];
		if([types containsObject:@"administrative_area_level_2"]) {
			subAdminArea =  [component objectForKey:@"long_name"];
			break;
		}
        
	}
	
	return subAdminArea;
}


#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
	
	NSLog(@"%s Beginning, thread %@", __PRETTY_FUNCTION__, [NSThread currentThread]);
    //	NSLog(@"%s operation queue's count = %d", __PRETTY_FUNCTION__, [self.operationQueue operationCount]);
	NSLog(@"%s arg location manager's distanceFilter = %f", __PRETTY_FUNCTION__, manager.distanceFilter);
	NSLog(@"%s self location manager's distanceFilter = %f", __PRETTY_FUNCTION__, self.locationManager.distanceFilter);
	// First check if "new" position is new enough as per the documentation. 
	NSDate *eventDate = newLocation.timestamp;
	NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	NSLog(@"%s howRecent=%d", __func__,  abs(howRecent));
	if (abs(howRecent) < 15.0) {  
		
		
		
        //		if(self.downloadActive)	
		
		NSLog(@"%s line %d lat:%f long:%f", __PRETTY_FUNCTION__, __LINE__, newLocation.coordinate.latitude, newLocation.coordinate.longitude);	
		
        //		if (self.reverseGeocoder.querying) {
        //			[self.reverseGeocoder cancel];
        //		}
        //		self.reverseGeocoder = [[[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate] autorelease]; // asynchronous call
        //		self.reverseGeocoder.delegate = self;
        //		[self.reverseGeocoder start];		
		
		
		
		// Get geocode info through the Google Maps service to have localized results
		NSMutableString *urlString = [NSMutableString stringWithString:@"http://maps.google.com/maps/api/geocode"];
		[urlString appendString:@"/json"];
		[urlString appendFormat:@"?latlng=%f,%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
		[urlString appendString:@"&language=el"];
		[urlString appendString:@"&sensor=true"];
		NSLog(@"%s Google Maps URL to be sent: %@", __PRETTY_FUNCTION__, urlString);
		NSURL *serviceUrl = [NSURL URLWithString:urlString];
		
		NSString *jsonResponse = [NSString stringWithContentsOfURL:serviceUrl encoding:NSUTF8StringEncoding error:nil];
		NSLog(@"%s JSON response = %@", __PRETTY_FUNCTION__, jsonResponse);
		NSDictionary *json = [jsonResponse JSONValue];
		
		NSString *locality = [self extractLocalityFromJSONDict:json];
		NSString *subAdminArea = [self extractSubAdminAreaFromJSONDict:json];
		NSLog(@"%s extracted subAdminArea:%@ locality:%@", __func__, subAdminArea, locality);
		if ([locality isEqualToString:self.locality] && [subAdminArea isEqualToString:self.subAdminArea] ) {
			NSLog(@"%s Not proceeding to download gas station data because locality or sub-admin area did not change!", __func__);
			
			
		}
		else {
			
            
			[locality retain];
			[subAdminArea retain];
			self.locality = locality;
			self.subAdminArea = subAdminArea;
			
			[self.downloader downloadEntriesForSubAdminArea:subAdminArea locality:locality];
			[locality release];
			[subAdminArea release];
			
			
			
            
            /*		
             NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[DataController instanceMethodSignatureForSelector:@selector(downloadGasStationDataAfterChangeToAdminLevel2:andLocality:)]];
             [invocation setTarget:self];
             [invocation setSelector:@selector(downloadGasStationDataAfterChangeToAdminLevel2:andLocality:)];
             [invocation setArgument:&adminLevel2 atIndex:2];
             [invocation setArgument:&locality atIndex:3];
             [invocation retainArguments];
             NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithInvocation:invocation];
             [operationQueue addOperation:operation];
             [operation release];
             */		
			/*		
			 @synchronized(self) {
			 [self downloadGasStationDataAfterLocalityChange];	
			 }
			 
			 */		
		}
		
	}
	
	NSLog(@"%s Exiting", __PRETTY_FUNCTION__);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	[[[[UIAlertView alloc] initWithTitle:@"Location manager error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] autorelease] show];
	NSLog(@"%s %@", __PRETTY_FUNCTION__, [error localizedDescription]);
}




-(void)showIndicator 
{
	[self.spinner startAnimating];
}

-(void)hideIndicator
{
	[self.spinner stopAnimating];
}

#pragma mark -
#pragma mark SGEntryDownloader delegate's methods
-(void)entryDownloadStarted:(SGEntryDownloader *)downloader
{
    //	self.downloading = YES;
    //	[self perfomSelectorOnMainThread:@selector(showIndicator)];
	[self.rootView.spinner performSelectorOnMainThread:@selector(startAnimating) withObject:nil waitUntilDone:NO];	
    //	[self.rootView.spinner startAnimating];
}

-(void) entryDownloadFinished:(SGEntryDownloader *)downloader withEntries:(NSArray *) entries
{
    //	self.downloading = NO;
    // Entry download finished; now we must update the UI
    //	NSString *HTMLToBeDisplayed = [self HTMLForEntries];
	self.entries = entries;
	[self.rootView.spinner performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:NO];
    //	[self.rootView.spinner stopAnimating];
	[self.rootView setNeedsDisplay];
	
    //	[self performSelectorOnMainThread:@selector(hideIndicator)];
    //	[self.webView loadHTMLString:HTMLToBeDisplayed baseURL:self.bundleURL];
    
}

-(void) entryDownloadFailed:(SGEntryDownloader *)theDownloader withError:(NSError *)error
{
	NSLog(@"%s %@", __func__, [error localizedDescription]);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Κατέβασμα δεδομένων απέτυχε" message:@"Κατέβασμα δεδομένων πρατηρίων καυσίμων απέτυχε." delegate:nil cancelButtonTitle:@"Τέλος" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

@end
