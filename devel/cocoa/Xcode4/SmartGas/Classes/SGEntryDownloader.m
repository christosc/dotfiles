//
//  ObservatoryHandler.m
//  CheapGas
//
//  Created by Christos Chryssochoidis on 01/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "SGEntryDownloader.h"
#import "JSON.h"
#import <libxml/HTMLParser.h>
#import <libxml/xpath.h>
#import <Foundation/NSString.h>
#import <Foundation/NSThread.h>
#import <Foundation/NSInvocation.h>
#import "NSString+Utilities.h"
#import "NSString+Greek.h"

@interface SGEntryDownloader ()

-(NSDictionary *) scrapeSubAdminAreas:(NSString *)html;
-(NSDictionary *) scrapeLocalities:(NSString *)html;
-(NSDictionary *)scrapeSublocalities:(NSString *)html;
-(NSArray *) scrapeEntries ;
-(SGEntry *) extractEntryFromNode:(xmlNodePtr) node;

-(void) downloadEntriesForSublocalities:(NSDictionary *) sublocalityDictionary;

//-(NSDictionary *) buildSubAdminAreaDictionary;
-(NSDictionary *) buildLocalitityDictionaryForSubAdminAreaCode:(NSString *)area;
-(NSDictionary *) buildSubLocalityDictionaryForSubAdminAreaCode:(NSString *) area andLocalityCode:(NSString *) locality;

- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection;


-(NSString *)matchString:(NSString *)someString againstStrings:(NSArray *)array;

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;

@property (readonly) NSDictionary *subAdminAreaDictionary;
@property (readwrite, retain) NSURLConnection *entryConnection;
@property (readwrite, retain) NSMutableData *receivedData;
@end







@implementation SGEntryDownloader


//@synthesize gasStationEntries;
//@synthesize geocodeInfo;
//@dynamic updateDistance;
@synthesize fuelType = _fuelType;  
@synthesize delegate = _delegate;
@synthesize receivedData = _receivedData;
//@synthesize operationQueue;
//@synthesize locationManager;
@dynamic subAdminAreaDictionary;
@synthesize entryConnection = _entryConnection;




/*
 -(FuelType)fuelType {
 return fuelType;
 }
 
 -(void) setFuelType:(FuelType)type {
 fuelType = type;
 [self downloadGasStationData];
 }
 */


-(NSDictionary *)subAdminAreaDictionary {
	if(_subAdminAreaDictionary == nil) {
		NSLog(@"%s Beginning", __PRETTY_FUNCTION__);
		NSError *error = nil;
		NSString *HTMLResponseForSubAdministrativeAreas = [[NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.fuelprices.gr/GetGeography"] encoding:NSWindowsCP1253StringEncoding error:&error] retain];
		if(error) {
			NSLog(@"%s Error while accessing observatory page! %@", __PRETTY_FUNCTION__, [error localizedDescription]);
			
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Σφάλμα συνδέσεως" message:@"Η πρόσβαση στο παρατηρητήριο απέτυχε." delegate:self cancelButtonTitle:@"Τέλος" otherButtonTitles:nil];
			alert.tag = 1;
			[alert show];
			[alert release]; // the alert's handler abort the application
			
		}
		
		_subAdminAreaDictionary = [[self scrapeSubAdminAreas:HTMLResponseForSubAdministrativeAreas] retain];
		[HTMLResponseForSubAdministrativeAreas release];
		
		NSLog(@"%s Exiting", __func__);	
	}
	
	return _subAdminAreaDictionary;
}

-(id)initWithFuelType:(enum FuelType)type delegate:object 
{ 
	
	if ((self = [super init])) {
		self.delegate = object;
		self.fuelType = type; 
		self.receivedData = [NSMutableData dataWithLength:0];
        //	[self performSelectorInBackground:@selector(buildSubAdminAreaDictionary) withObject:nil];
        //	operationQueue = [[NSOperationQueue alloc] init];
        //	[operationQueue setMaxConcurrentOperationCount:1];
        
        //	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(buildProvinceDictionary) object:nil];
		
        //	[operationQueue addOperation:operation];
        //	[operation release];
        
        /*	
         [operationQueue addOperationWithBlock:^{
         NSLog(@"operation block starting location updates %s", __func__);
         [locationManager startUpdatingLocation];  				  
         
         [[NSRunLoop currentRunLoop] run];
         NSLog(@"%s location manager start update block exiting.", __func__);
         }];
         
         //		[NSThread detachNewThreadSelector:@selector(startLocationUpdating) toTarget:self withObject:nil];
         
         
         
         */	
		
    }
    return self;
	
}




#pragma mark -
#pragma mark Alerts

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {  // alert for failure in accessing the observatory during controller's initialization
		if (buttonIndex == 0) {
			abort();
		}
		
	}
}






/*
 #pragma mark -
 #pragma mark NSURLConnection Delegate
 
 -(void)connection:(NSURLConnection*) connection didFailWithError:(NSError*) error {
 [connection release];
 
 NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
 [delegate dataUpdateFailed:self withError:error];
 
 }
 
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
 {  
 [receivedData setLength:0]; 
 [self->delegate performSelectorOnMainThread:@selector(dataUpdateStarted:) withObject:self waitUntilDone:NO];  //dataUpdateStarted:self];
 }
 
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
 {  
 [receivedData appendData:data];  
 }
 
 - (void)connectionDidFinishLoading:(NSURLConnection *)connection  
 {  
 
 NSLog(@"CONNECTION_DID_FINISH_LOADING: I am in thread %@", [NSThread currentThread]);
 NSLog(@"Succeeded! Received %d bytes of data",[self->receivedData length]);  
 NSString *receivedDataStr = [[NSString alloc] initWithData:self->receivedData encoding:NSWindowsCP1253StringEncoding];  
 NSLog(@"Data received as price data:%@", receivedDataStr);  
 [receivedDataStr release];
 self.gasStationEntries = [self scrapeAllGasStationInfo]; 
 
 [self->delegate performSelectorOnMainThread:@selector(dataUpdateFinished:) withObject:self waitUntilDone:NO];// dataUpdateFinished:self]; //inform the delegate that new data has arrived
 
 // release the connection object
 [connection release]; 
 
 } 
 
 #pragma mark -
 */




#pragma mark -
-(void)dealoc {
	[_receivedData release];
    //	[gasStationEntries release];
    //	[geocodeInfo release];
	[_subAdminAreaDictionary release];
	[_entryConnection release];	
    //	[locationManager release];
    //	[dataConnection release];
    //	[operationQueue release];
	[super dealloc];
}

#pragma mark -


/** Extracts the "locality" info in the given JSON dictionary. 
 -(NSString *) extractLocality:(NSDictionary *)json {
 // Have to find a result address having type "locality"
 
 NSDictionary *localityDict = nil;
 for(NSDictionary *dict in [json objectForKey:@"results"]) {
 if ([[dict objectForKey:@"types"] containsObject:@"locality"]) {
 localityDict = dict;
 break;
 }
 }
 
 return [[[localityDict objectForKey:@"address_components"] objectAtIndex:0] objectForKey:@"long_name"];
 }
 */

/** Extracts the "administrative_area_level_2" info in the given JSON dictionary. 
 -(NSString *) extractAdminLevel2:(NSDictionary *)json {
 NSDictionary *adminLevel2Dict = nil;
 for(NSDictionary *dict in [json objectForKey:@"results"]) {
 if([[dict objectForKey:@"types"] containsObject:@"administrative_area_level_2"]) {
 adminLevel2Dict = dict;
 break;
 }
 }
 
 return [[[adminLevel2Dict objectForKey:@"address_components"] objectAtIndex:0] objectForKey:@"long_name"];
 }
 */




#pragma mark HTML Scraping

/** Scrapes the provinces' names and respective POST codes from the given HTML, which is the source code of the initial page of the observatory. Returns them in a dictionary <name, code>. */
-(NSDictionary *) scrapeSubAdminAreas:(NSString *)html {
	
	
	
	const char *htmlRawData = [html UTF8String];
	htmlDocPtr htmlDoc = htmlReadMemory(htmlRawData, strlen(htmlRawData), "", "utf-8", HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR);
	if(htmlDoc == NULL) {
		NSLog(@"%s Unable to parse.", __PRETTY_FUNCTION__);
		return nil;
	}
	
	xmlXPathContextPtr xpathCtx = xmlXPathNewContext(htmlDoc);
	if(xpathCtx == NULL)
	{
		NSLog(@"%s Unable to create XPath context.", __PRETTY_FUNCTION__);
		return nil;
	}
	
	const char *query = "//select[@name='nomos']/option[@value != '-1']";
	xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *)query, xpathCtx);
	if(xpathObj == NULL) {
		NSLog(@"%s Unable to evaluate XPath.", __PRETTY_FUNCTION__);
		return nil;
	}
	
	NSMutableArray *provinceNames = [NSMutableArray array];
	NSMutableArray *provinceCodes = [NSMutableArray array];
	//	xmlNodeSetPtr nodes = xpathObj->nodesetval;
	if (!xpathObj->nodesetval)
	{
		
		NSLog(@"%s Provinces results were nil.", __PRETTY_FUNCTION__);
		return [NSDictionary dictionaryWithObjects:provinceCodes forKeys:provinceNames];
	}
	
	NSLog(@"%s Admin level 2 query nr = %d", __PRETTY_FUNCTION__, xpathObj->nodesetval->nodeNr);
	
	
	for (NSInteger i = 0; i < xpathObj->nodesetval->nodeNr; i++)  
	{
		
		//		NSLog(@"NODE #%d", i);
		//		NSLog(@"=========");
		const char *value = (const char *) xpathObj->nodesetval->nodeTab[i]->properties->children->content;
		const char *textContent = (const char *) xpathObj->nodesetval->nodeTab[i]->children->content;
		
		NSString *provinceCode = [NSString stringWithCString:value encoding:NSUTF8StringEncoding];
		NSMutableString *provinceNameRaw = [NSMutableString stringWithCString:textContent encoding:NSUTF8StringEncoding];
		
		// The following procedure is to remove the first word in 'provinceName', which is one of 'ΝΟΜΑΡΧΙΑ', 'ΝΟΜΟΣ'.
		NSArray *words = [provinceNameRaw componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		NSMutableString *provinceNameBuilder = [NSMutableString string];
		for(int i = 1; i < [words count]; i++)  // skip fist word
			[provinceNameBuilder appendFormat:@"%@ ", [words objectAtIndex:i]];
		NSString *provinceName = [provinceNameBuilder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]; //trim last space
		
		
		[provinceCodes addObject:provinceCode];
		[provinceNames addObject:provinceName];
	}
	
	NSDictionary *result = [NSDictionary dictionaryWithObjects:provinceCodes forKeys:provinceNames];
	NSLog(@"%s result dictionary: %@", __PRETTY_FUNCTION__, result);
	
	// cleanup
	xmlXPathFreeObject(xpathObj);
	xmlXPathFreeContext(xpathCtx);
	xmlFreeDoc(htmlDoc);
	
	return result;	
	
	
	
}



/** Scrapes locality (municipality) names and respective POST codes from the HTML source code passed. 
 Returns them in a dictionary <name, code>.
 */
-(NSDictionary *)scrapeLocalities:(NSString *)html {
	NSLog(@"%s HTML recieved: %@", __PRETTY_FUNCTION__, html);
	const char *htmlData = [html UTF8String];
	htmlDocPtr htmlDoc = htmlReadMemory(htmlData, strlen(htmlData), "", "utf-8", HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR);
	if(htmlDoc == NULL) {
		NSLog(@"%s Unable to parse.", __PRETTY_FUNCTION__);
		return nil;
	}
	
	xmlXPathContextPtr xpathCtx = xmlXPathNewContext(htmlDoc);
	if(xpathCtx == NULL)
	{
		NSLog(@"%s Unable to create XPath context.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	const char *query = "//div[@id='contents']/table[1]/tr/td";
	xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *)query, xpathCtx);
	if(xpathObj == NULL) {
		NSLog(@"%s Unable to evaluate XPath.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	NSMutableArray *localityNames = [NSMutableArray array];
	NSMutableArray *localityCodes = [NSMutableArray array];
	//	xmlNodeSetPtr nodes = xpathObj->nodesetval;
	if (!xpathObj->nodesetval)
	{
		
		NSLog(@"%s Locality results were nil.", __PRETTY_FUNCTION__);
		return [NSDictionary dictionaryWithObjects:localityCodes forKeys:localityNames];
	}
	
	NSLog(@"%s Localitites query nr = %d", __PRETTY_FUNCTION__, xpathObj->nodesetval->nodeNr);
	
	for (NSInteger i = 0; i < xpathObj->nodesetval->nodeNr; i+=3)  
	{
		const char *value = (const char *) xpathObj->nodesetval->nodeTab[i]->children->properties->next->next->children->content;
		const char *textContent = (const char *) xpathObj->nodesetval->nodeTab[i+1]->children->content;
		
		NSString *localityCode = [NSString stringWithCString:value encoding:NSUTF8StringEncoding];
		NSMutableString *localityNameRaw = [NSMutableString stringWithCString:textContent encoding:NSUTF8StringEncoding];
		
		// The following procedure is to remove the first word in 'localityName', which is  'ΔΗΜΟΣ' or 'ΚΟΙΝΟΤΗΤΑ'.
		NSArray *words = [localityNameRaw componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		NSMutableString *localityNameBuilder = [NSMutableString string];
		for(int i = 1; i < [words count]; i++)
			[localityNameBuilder appendFormat:@"%@ ", [words objectAtIndex:i]];
		NSString *localityName = [localityNameBuilder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]; //trim last space
		
		
		[localityCodes addObject:localityCode];
		[localityNames addObject:localityName];
	}
	
	NSDictionary *result = [NSDictionary dictionaryWithObjects:localityCodes forKeys:localityNames];
	NSLog(@"%s result dictionary: %@", __PRETTY_FUNCTION__, result);
	
	// cleanup
	xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
	xmlFreeDoc(htmlDoc);
	
	NSLog(@"%s localities dictionary keys = %@", __func__, [result allKeys]);
	NSLog(@"%s localities dictionary values = %@", __func__, [result allValues]);
	return result;
	
}


/** Scrapes sublocality (division of "locality") names and respective POST codes from the HTML source code passed. 
 Returns them in a dictionary <name, code>.
 */
-(NSDictionary *)scrapeSublocalities:(NSString *)html {
	NSLog(@"%s HTML recieved: %@", __PRETTY_FUNCTION__, html);
	const char *htmlData = [html UTF8String];
	htmlDocPtr htmlDoc = htmlReadMemory(htmlData, strlen(htmlData), "", "utf-8", HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR);
	if(htmlDoc == NULL) {
		NSLog(@"%s Unable to parse.", __PRETTY_FUNCTION__);
		return nil;
	}
	
	xmlXPathContextPtr xpathCtx = xmlXPathNewContext(htmlDoc);
	if(xpathCtx == NULL)
	{
		NSLog(@"%s Unable to create XPath context.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	//	const char *query = "//td[@class=\"mainArea\"]/div[@id=\"contents\"]/table/tbody/tr[position()>1]";
	const char *query = "//td[@class=\"mainArea\"]/div[1]/table[1]/tr[position()>1]/td";
	xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *)query, xpathCtx);
	if(xpathObj == NULL) {
		NSLog(@"%s Unable to evaluate XPath.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	
	NSMutableArray *sublocalityCodes = [NSMutableArray array];
	NSMutableArray *sublocalityNames = [NSMutableArray array];
	if (!xpathObj->nodesetval)
	{
		
		NSLog(@"%s SubLocality results were nil.", __PRETTY_FUNCTION__);
		return [NSDictionary dictionaryWithObjects:sublocalityCodes forKeys:sublocalityNames];
	}
	
	NSLog(@"%s Sublocalitites query nr = %d", __PRETTY_FUNCTION__, xpathObj->nodesetval->nodeNr);
	
	for (NSInteger i = 0; i < xpathObj->nodesetval->nodeNr; i+=3) {
		const char *value = (const char *) xpathObj->nodesetval->nodeTab[i]->children->properties->next->next->children->content;
		const char *textContent = (const char *) xpathObj->nodesetval->nodeTab[i+1]->children->content;
		[sublocalityCodes addObject:[NSString stringWithUTF8String:value]];
		NSString *name = [[NSString stringWithUTF8String:textContent] substringFromIndex:4]; // delete leading "Δ.Δ."
		[sublocalityNames addObject:name];
	}   
	
	
	
	
	NSDictionary *result = [NSDictionary dictionaryWithObjects:sublocalityCodes forKeys:sublocalityNames];
	NSLog(@"%s result dictionary: %@", __PRETTY_FUNCTION__, result);
	
	// cleanup
	xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
	xmlFreeDoc(htmlDoc);
	
	return result;
}



/** This method scrapes the info from a single gas station node. */
-(SGEntry *) extractEntryFromNode:(xmlNodePtr) node {
	
	
	NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
	[numFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"] autorelease]];
	NSString *priceString = [NSString stringWithCString:(const char *)node->children->children->children->next->content encoding:NSUTF8StringEncoding];
	// This price string normally is in localized format – but I won't take taht for granted. I'll make a conversion each time, just to be sure...
	NSLog(@"%s priceString = %@", __func__,  priceString);
	NSNumber *priceNonLocalized =  [numFormatter numberFromString:priceString];
	NSLog(@"%s priceNonLocalized = %@", __func__, priceNonLocalized);
    [numFormatter release];
	NSString *product = [[NSString stringWithCString:(const char *)node->children->children->next->next->next->next->children->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
#pragma unused(product)
	NSString *brand = [[NSString stringWithCString:(const char *)node->children->children->next->next->next->next->next->next->children->next->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *address = [[NSString stringWithCString:(const char *)node->children->next->children->children->next->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	/*	
	 // Need a number formatter to format the double value in Greek locale
	 NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
	 [formatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"] autorelease]];
	 [formatter setMaximumFractionDigits:3];
	 */	
 	NSDictionary *priceDict = [NSDictionary dictionaryWithObject:priceNonLocalized forKey:[NSNumber numberWithInt:self.fuelType]];
    //	[priceNonLocalized release];
	SGEntry *entry = [[SGEntry alloc] initWithBrand:brand address:address prices:priceDict]; 
	[entry autorelease];  // I autorelease because it is later retained by being inserted in an array 
	/*	
	 gasStationInfo.literPrice = [price floatValue];
	 gasStationInfo.product = product;
	 gasStationInfo.brand = trademark;
	 gasStationInfo.address = address;
	 */	
	return entry;
	
}



/** This method is responsible for scraping all the gas station data as received from the observatory. */
-(NSArray *) scrapeEntries 
{
	NSString *receivedDataString = [NSString stringWithCString:[self.receivedData bytes] encoding:NSWindowsCP1253StringEncoding];
	NSLog(@"%s POST RESPONSE= %@", __func__, receivedDataString);
	htmlDocPtr doc = htmlReadMemory([self.receivedData bytes], [self.receivedData length], "", NULL, HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR);
	if (doc == NULL)
	{
		NSLog(@"%s Unable to parse.", __func__);
		return nil;
    }
	
	xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
	if(xpathCtx == NULL)
	{
		NSLog(@"%s Unable to create XPath context.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	
	NSString *query = @"//td[@class='mainArea']/table[position()>2]/tr[1]/td[2]/table[1]";
	xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((xmlChar *)[query cStringUsingEncoding:NSUTF8StringEncoding], xpathCtx);
    if(xpathObj == NULL) {
		NSLog(@"%s Unable to evaluate XPath.", __PRETTY_FUNCTION__);
		return nil;
    }
	
	
	
	NSMutableArray *entries = [NSMutableArray array];
	if (!xpathObj->nodesetval)
	{
		
		NSLog(@"%s Gas station entries  were nil.", __PRETTY_FUNCTION__);
		return entries;		
	}
	
	NSLog(@"%s xpathObj->nodesetval->nr = %d", __PRETTY_FUNCTION__, xpathObj->nodesetval->nodeNr);
	
	
	for (NSInteger i = 0; i < xpathObj->nodesetval->nodeNr; i++)
	{
		SGEntry *entry = [self extractEntryFromNode:xpathObj->nodesetval->nodeTab[i]];
		[entries addObject:entry];
	}
	
	/* Cleanup */
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx); 
    
	xmlFreeDoc(doc);
	
	return entries;
}

#pragma mark -
#pragma mark  Observatory interaction
/*
 -(void) buildSubAdminAreaDictionary {
 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
 //	NSLog(@"%s Beginning; operationQueue's count = %d", __PRETTY_FUNCTION__,  [self.operationQueue operationCount]);
 NSLog(@"%s Beginning", __PRETTY_FUNCTION__);
 NSError *error = nil;
 NSString *HTMLResponseForSubAdministrativeAreas = [[NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.fuelprices.gr/GetGeography"] encoding:NSWindowsCP1253StringEncoding error:&error] retain];
 if(error) {
 NSLog(@"%s Error while accessing observatory page! %@", __PRETTY_FUNCTION__, [error localizedDescription]);
 
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Σφάλμα συνδέσεως" message:@"Η πρόσβαση στο παρατηρητήριο απέτυχε." delegate:self cancelButtonTitle:@"Τέλος" otherButtonTitles:nil];
 alert.tag = 1;
 [alert show];
 [alert release]; // the alert's handler abort the application
 
 }
 
 //	self.subAdminAreaDictionary = [self scrapeSubAdminAreas:HTMLResponseForSubAdministrativeAreas]; // retained by property
 [HTMLResponseForSubAdministrativeAreas release];
 
 NSLog(@"%s Exiting", __func__);	
 [pool release];
 }
 */
-(NSDictionary *) buildLocalitityDictionaryForSubAdminAreaCode:(NSString *)area {
	
	NSString *localitiesURLString = [NSString stringWithFormat:@"http://www.fuelprices.gr/GetGeography?nomos=%@", area];
	NSURL *localitiesURL = [NSURL URLWithString:localitiesURLString];
	NSError *error = nil;
	NSString *HTMLResponseForLocalities = [NSString stringWithContentsOfURL:localitiesURL encoding:NSWindowsCP1253StringEncoding error:&error];
	[HTMLResponseForLocalities retain]; //because I want to pass it as arg to another method
	
	if(error) {
		NSLog(@"%s %@", __func__, [error localizedDescription]);
		abort();
	}
	
	
	
	NSLog(@"%s Localities HTML: %@", __func__, HTMLResponseForLocalities);
	NSDictionary *localityDictionary = [self scrapeLocalities:HTMLResponseForLocalities];
	[HTMLResponseForLocalities release];
	return localityDictionary; // object guaranteed to be valid in invoker
}






-(NSDictionary *) buildSubLocalityDictionaryForSubAdminAreaCode:(NSString *) area andLocalityCode:(NSString *) locality
{
	NSString *sublocalitiesURLString = [NSString stringWithFormat:@"http://www.fuelprices.gr/GetGeography?nomos=%@&dimos=%@&submit=%%C5%%F0%%FC%%EC%%E5%%ED%%EF", area, locality];
	NSLog(@"%s sublocalities URL:%@", __func__, sublocalitiesURLString);
	NSURL *sublocalitiesURL = [NSURL URLWithString:sublocalitiesURLString];
	NSError *error = nil;
	NSString *HTMLResponseForSublocalities = [NSString stringWithContentsOfURL:sublocalitiesURL encoding:NSWindowsCP1253StringEncoding error:&error];
	[HTMLResponseForSublocalities retain]; 
	if(error) {
		NSLog(@"%s %@", __PRETTY_FUNCTION__, [error localizedDescription]);
		abort();
	}
	
	NSDictionary *sublocalityDictionary = [self scrapeSublocalities:HTMLResponseForSublocalities]; // autoreleased object; no need to retain or release it
	
	
	
	[HTMLResponseForSublocalities release];
	return sublocalityDictionary;
}

/** Fetches gas station data from the price observatory. It does to web connections:one for fetching and scraping the localities, and one for the actual gas station data. */
-(void) downloadEntriesForSubAdminArea:(NSString *)subAdminAreaName locality:(NSString *)localityName 
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; // need this autorelease pool because this method is to be run in a separate thread
	//	NSLog(@"%s Beginning; operationQueue's count = %d", __PRETTY_FUNCTION__, [self.operationQueue operationCount]);
	NSLog(@"%s Beginning", __func__);
	//	self.geocodeInfo.adminLevel2 = subAdminlevel;
	//	self.geocodeInfo.locality    = locality;
	//	[delegate performSelectorOnMainThread:@selector(dataUpdateStarted:) withObject:self waitUntilDone:YES];
	//	[delegate dataUpdateStarted:self];
	
	/* Provinces' dictionary is already built upon the data controller's initialization. */
	
	/* Match the name of the province as given by Google against those in the provinces' dictionary. */
	NSString *subAdminAreaNameModified = [[[subAdminAreaName uppercaseString] removeAccentsFromCapitalGreek] retain];
	NSString *matchedSubAdminAreaName = [self matchString:subAdminAreaNameModified againstStrings:[self.subAdminAreaDictionary allKeys]];
	[subAdminAreaNameModified release];
	
	//	NSString *currentProvince = geocodeInfo.adminLevel2;
	
	
	
	// Now selectedSubAdminArea has the sub-admin area's name which best matches the one given by Google Map service.
	NSAssert(matchedSubAdminAreaName != nil, @"matchedSubAdminAreaName == nil");
	NSLog(@"%s Matched sub-administrative area name: %@", __func__, matchedSubAdminAreaName);
	// Get the corresponding POST code for the selected sub-admin area
	NSString *matchedSubAdminAreaCode = [self.subAdminAreaDictionary objectForKey:matchedSubAdminAreaName];
	
	
	
	NSDictionary *localityDictionary = [self buildLocalitityDictionaryForSubAdminAreaCode:matchedSubAdminAreaCode];
	NSString *localityNameModified = [[[localityName uppercaseString] removeAccentsFromCapitalGreek] retain];
	NSString *matchedLocalityName = [self matchString:localityNameModified againstStrings:[localityDictionary allKeys]];
	[localityNameModified release];
	
	
	
	NSAssert(matchedLocalityName != nil, @"matchedLocalityName == nil");
	NSLog(@"%s Matched locality:%@", __func__, matchedLocalityName);	
	// Get the POST code for locality
	NSString *matchedLocalityCode = [localityDictionary objectForKey:matchedLocalityName];
    //	[localityDictionary release]; // I release it because this method is invoked only after a change of locality (or sub-administrative area) has been detected
	
	/* The final query to the observatory is make in terms of sublocalities (division of locality) of the selected locality.
	 Due to the sublocalities being a rather small area, in which there might not be even one gas station, the code selects
	 all the existing sublocalities for the selected locality, in order to proceed to final prices' query.
	 */
	
	NSDictionary *sublocalityDictionary = [self buildSubLocalityDictionaryForSubAdminAreaCode:matchedSubAdminAreaCode andLocalityCode:matchedLocalityCode];
	
	[self downloadEntriesForSublocalities:sublocalityDictionary];  // we have all the needed data to proceed to the actual prices' query; so do it
	
	[pool release];
}


/** This method does the actual query to the observatory for the gas station data, according to current location of user
 and was resolved in method fetchGasStationDataAfterLocalityChange. 
 */
-(void) downloadEntriesForSublocalities:(NSDictionary *) sublocalityDictionary
{
	NSMutableString *postString = [NSMutableString string];
	for (NSString *value in sublocalityDictionary.allValues) {
		[postString appendFormat:@"DD=%@&", value];
	}
	
	[postString appendFormat:@"prodclass=%d", self.fuelType];
	[postString appendString:@"&submit=%C5%F0%FC%EC%E5%ED%EF"];
	
	NSLog(@"%s post string to be sent:%@", __PRETTY_FUNCTION__, postString);
	NSData   *postData = [postString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://www.fuelprices.gr/CheckPrices"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"]; 
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setValue:@"close" forHTTPHeaderField:@"Connection"];
	[request setHTTPBody:postData];
	
    
	self.entryConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	assert(self.entryConnection != nil);
	
    /*	
     NSError *connectionError = nil;
     NSURLResponse *urlResponse = nil;
     NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&connectionError];
     [responseData retain];
     
     if(responseData == nil) // some error occurred 
     {
     NSLog(@"%s Error while trying to download price data.", __PRETTY_FUNCTION__);
     NSLog(@"%s %@", __PRETTY_FUNCTION__, connectionError);
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Σφάλμα συνδέσεως" message:@"Η μεταφορά των δεδομένων από το παρατηρητήριο απέτυχε." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
     [alert show];
     [alert release];
     }
     
     //	NSLog(@"%s responseData = %@", __func__, responseData);
     NSLog(@"%s NSString(responseData) = %@", __func__, [NSString stringWithCString:[responseData bytes] encoding:NSWindowsCP1253StringEncoding]);
     self.gasStationEntries = [self scrapeGasStations:responseData];
     [responseData release];
     //	[delegate performSelectorOnMainThread:@selector(dataUpdateFinished:) withObject:self waitUntilDone:YES];
     
     
     [self.spinner stopAnimating];
     [self.webView loadHTMLString:[self generateHTMLForGasStationEntries] baseURL:self.bundleURL];
     //	[self dataUpdateFinished:self];
     
	 NSURLConnection *dataConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
	 if(dataConnection) {
	 receivedData = [[NSMutableData data] retain];
	 }
	 else {
	 NSLog(@"Connection could not be established.");
	 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Σφάλμα συνδέσεως" message:@"Η μεταφορά των δεδομένων από το παρατηρητήριο απέτυχε." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	 [alert show];
	 [alert release];
	 
	 }
	 */	
	// The created NSURLConnection is released upon finishing in connectionDidFinishLoading: method. Ignore static analyzer's warning.
	
	NSLog(@"%s exiting", __func__);
	
}

#pragma mark -
#pragma mark NSURLConection delegate's methods
- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response
{
#pragma unused(theConnection)
    
	
	[self.receivedData setLength:0];
    [self.delegate entryDownloadStarted:self];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)data
{
#pragma unused(theConnection)
	[self.receivedData appendData:data];
	
    
	
    
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
{
#pragma unused(theConnection)
    
	
	[self.entryConnection cancel];
	self.entryConnection = nil;
    
	[self.delegate entryDownloadFailed:self withError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection
// A delegate method called by the NSURLConnection when the connection has been 
// done successfully.  We shut down the connection with a nil status, which 
// causes the image to be displayed.
{
#pragma unused(theConnection)
    //    assert(theConnection == self.entryConnection);
    self.entryConnection = nil;
	NSArray *entries = [[self scrapeEntries] retain];
    [self.delegate entryDownloadFinished:self withEntries:entries];
	[entries release];
}

#pragma mark -
#pragma mark Miscellaneous
-(NSString *)matchString:(NSString *)someString againstStrings:(NSArray *)array 
{
	NSLog(@"%s String to be matched:%@", __func__, someString);
	NSString *match = nil;
	int minDistance = INT_MAX;
	for(NSString *s in array) {
		int distance = [s distanceFrom:someString];
		NSLog(@"%s Distance between \"%@\" and \"%@\" is %d", __func__, s, someString, distance); 
		if (distance < minDistance) {
			match = s;
			minDistance = distance;
		}
	}
	
	return match;
}

/* This function is for debugging purposes. */
void printParsedData(NSArray * parsedData) {
	for(SGEntry *entry in parsedData) {
		//		NSLog(@"%s price = %f", __PRETTY_FUNCTION__,info.literPrice);
		//		NSLog(@"%s product = %@", __PRETTY_FUNCTION__,info.product);
		NSLog(@"%s trademark = %@", __PRETTY_FUNCTION__, entry.brand);
		NSLog(@"%s address = %@", __PRETTY_FUNCTION__, entry.address);
		NSLog(@"\n");
	}
}


@end
