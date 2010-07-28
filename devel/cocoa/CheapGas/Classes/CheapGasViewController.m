//
//  CheapGasViewController.m
//  CheapGas
//
//  Created by Christos Chryssochoidis on 23/07/2010.
//  Copyright (c) 2010 University of Athens. All rights reserved.
//

#import "CheapGasViewController.h"
#import <libxml/HTMLtree.h>
#import <libxml/xpath.h>



@implementation CheapGasViewController


//-(BOOL) textFieldShouldClear:(UITextField *)textField
//{
//    //NSURL *url = [NSURL URLWithString: textField.text];
////    NSURLRequest *request = [NSURLRequest requestWithURL:url];
////    [webView loadRequest:request];
//  //  NSString *urlAddress = @"http://www.google.com";
//	
//	//Create a URL object.
//	NSURL *url = [NSURL URLWithString:textField.text];
//	
//	//URL Requst Object
//	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//	
//	//Load the request in the UIWebView.
//	[(UIWebView *)self.view loadRequest:requestObj];
////	[webView setNeedsDisplay];
//	
//	return YES;
//    
//}


-(BOOL) textFieldShouldReturn:(UITextField *)textField

{
	NSURL *url = [NSURL URLWithString:textField.text];
	//
	//URL Requst Object
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webView loadRequest:request];
    [textField resignFirstResponder];
    return YES;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/* Fetches the HTML source code from www.fuelprices.gr relating to Peiraias gas stations,
   and puts them in receivedData ivar. */
-(void)fetchHTMLData {
    NSString *post = @"DD=A4010100&prodclass=1&submit=%C5%F0%FC%EC%E5%ED%EF";
	NSData   *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://www.fuelprices.gr/CheckPrices"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"]; 
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setValue:@"close" forHTTPHeaderField:@"Connection"];
	[request setHTTPBody:postData];
	
	NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES]; // delegate is the view controller
	if(conn) {
		receivedData = [[NSMutableData data] retain];
	}
	else {
		NSLog(@"Connection could not be established.");
        [webView loadHTMLString:@"<html><body><p>Connection could not be established.</p></body></html>" baseURL:nil];
	}

} 



#pragma mark -
#pragma mark NSURLConnection delegate methods

-(void)connection:(NSURLConnection*) connection didFailWithError:(NSError*) error {
    [connection release];
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    NSString *htmlMsg = [NSString stringWithFormat:@"Connection failed! Error - %@ %@", 
                         [error localizedDescription],
                         [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]];
    NSString *html = [NSString stringWithFormat:@"<html><body><p>%@</p></body></html>", htmlMsg];  
    [webView loadHTMLString:html baseURL:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
    [receivedData setLength:0]; 
	[activityIndicator startAnimating];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
    [receivedData appendData:data];  
}

#pragma mark -
#pragma mark HTML parsing

CCGasStationInfo *infoFromNode(xmlNodePtr currentNode) {
	
	
	NSNumberFormatter *numFomatter = [[NSNumberFormatter alloc] init];
	[numFomatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"] autorelease]];
	NSString *priceString = [NSString stringWithCString:(const char *)currentNode->children->children->children->next->content encoding:NSUTF8StringEncoding];
	NSNumber *price =  [numFomatter numberFromString:priceString];
	NSString *product = [[NSString stringWithCString:(const char *)currentNode->children->children->next->next->next->next->children->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *trademark = [[NSString stringWithCString:(const char *)currentNode->children->children->next->next->next->next->next->next->children->next->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *address = [[NSString stringWithCString:(const char *)currentNode->children->next->children->children->next->content encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	CCGasStationInfo *gasStationInfo = [[[CCGasStationInfo alloc] init] autorelease];
	gasStationInfo.literPrice = [price floatValue];
	gasStationInfo.product = product;
	gasStationInfo.trademark = trademark;
	gasStationInfo.address = address;
	
	return gasStationInfo;
	
}
//NSDictionary *DictionaryForNode(xmlNodePtr currentNode, NSMutableDictionary *parentResult);

-(NSArray *) parseHTMLData {
	
	htmlDocPtr doc = htmlReadMemory([receivedData bytes], [receivedData length], "", NULL, HTML_PARSE_NOWARNING | HTML_PARSE_NOERROR);
	if (doc == NULL)
	{
		NSLog(@"Unable to parse.");
		return nil;
    }
	
	xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
	if(xpathCtx == NULL)
	{
		NSLog(@"Unable to create XPath context.");
		return nil;
    }
	
	/* Evaluate xpath expression */
	//NSString *query = @"/html/body/form/table[2]/tbody/tr[3]/td/table[3]/tbody/tr/td[2]/table/tbody/tr";
	//    NSString *query = @"/html/body/form/table[2]/tr[3]/td[1]/table[position()>2]/tr[1]/td[2]/table[1]/tr[position() <= 2]";
	NSString *query = @"//td[@class='mainArea']/table[position()>2]/tr[1]/td[2]/table[1]";
	xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((xmlChar *)[query cStringUsingEncoding:NSUTF8StringEncoding], xpathCtx);
    if(xpathObj == NULL) {
		NSLog(@"Unable to evaluate XPath.");
		return nil;
    }
	
	xmlNodeSetPtr nodes = xpathObj->nodesetval;
	if (!nodes)
	{
		
		NSLog(@"Nodes was nil.");
		return nil;
	}
	
	NSLog(@"nodes->nr = %d", nodes->nodeNr);
	
	NSMutableArray *resultNodes = [NSMutableArray array];
	for (NSInteger i = 0; i < nodes->nodeNr; i++)
	{
//		NSLog(@"NODE #%d", i);
//		NSLog(@"=========");
		
		
		/*
		NSDictionary *nodeDictionary = DictionaryForNode(nodes->nodeTab[i], nil);
		if (nodeDictionary)
		{
			[resultNodes addObject:nodeDictionary];
		}
		*/
		
		CCGasStationInfo *gasStationInfo = infoFromNode(nodes->nodeTab[i]);
		[resultNodes addObject:gasStationInfo];
		
		//NSDictionary *nodeDictionary = DictionaryForNode(nodes->nodeTab[i], nil);
		//if (nodeDictionary)
		//{
		//				[resultNodes addObject:[NSString stringWithCString:(char *)nodes->nodeTab[i]->children[0].content encoding:NSWindowsCP1253StringEncoding ]]; 
//			[resultNodes addObject:[NSValue valueWithPointer:nodes->nodeTab[i]]];
//		[resultNodes addObject:[NSNumber numberWithInt:nodes->nodeTab[i]->children[0].type]];
		
/*		
		NSLog(@"\nNode #%d", i);
		int j = 0;
		for(xmlNodePtr p = nodes->nodeTab[i]->children; p; p = p ->next, j++)  {
			// p is expected to point to a table CELL node!
			NSLog(@"child #%d  (type = %d) (content = %p)", j, p->type, p->content *//*== 3? [NSString stringWithCString:(const char *)p->content encoding:NSWindowsCP1253StringEncoding] : @""); */
/*			if(p->content) {
				NSLog(@"I'm in!!!");
				NSLog(@"%s", (char *) p->content);
				NSLog(@"%@", [NSString stringWithCString:(const char *)p->content encoding:NSWindowsCP1253StringEncoding]);
				NSLog(@"%@", [NSString stringWithCString:(const char *)p->content encoding:NSUTF8StringEncoding]);
				NSLog(@"%@", [NSString stringWithCString:(const char *)p->content encoding:NSASCIIStringEncoding]);
				NSString *stringContent = [NSString stringWithCString:(const char *)p->content encoding:NSWindowsCP1253StringEncoding];
				NSString *trimmedContent = [stringContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
				NSLog(@"%@", trimmedContent);
				printf("%s\n", (char *) p->content);
				fflush(stdout);
				fflush(stderr);
			}
				
		
		
		}
*/			
		
		//}
	}
	
	/* Cleanup */
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx); 
    
	xmlFreeDoc(doc);
	return resultNodes;
}

/* This function is for debugging purposes. */
void printParsedData(NSArray * parsedData) {
	for(CCGasStationInfo *info in parsedData) {
		NSLog(@"price = %f", info.literPrice);
		NSLog(@"product = %@", info.product);
		NSLog(@"trademark = %@", info.trademark);
		NSLog(@"address = %@", info.address);
		NSLog(@"\n");
	}
}

/*
NSDictionary *DictionaryForNode(xmlNodePtr currentNode, NSMutableDictionary *parentResult)
{
	NSMutableDictionary *resultForNode = [NSMutableDictionary dictionary];
	
	if (currentNode->name)
	{
		NSString *currentNodeContent =
		[NSString stringWithCString:(const char *)currentNode->name encoding:NSUTF8StringEncoding];
		[resultForNode setObject:currentNodeContent forKey:@"nodeName"];
	}
	
	
	
	if (currentNode->content && currentNode->type != XML_DOCUMENT_TYPE_NODE)
	{
		NSString *currentNodeContent =
		[NSString stringWithCString:(const char *)currentNode->content encoding:NSUTF8StringEncoding];
		
		if ([[resultForNode objectForKey:@"nodeName"] isEqual:@"text"] && parentResult)
		{
			currentNodeContent = [currentNodeContent
								  stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			
			NSString *existingContent = [parentResult objectForKey:@"nodeContent"];
			NSString *newContent;
			if (existingContent)
			{
				newContent = [existingContent stringByAppendingString:currentNodeContent];
			}
			else
			{
				newContent = currentNodeContent;
			}
			
			[parentResult setObject:newContent forKey:@"nodeContent"];
			return nil;
		}
		
		[resultForNode setObject:currentNodeContent forKey:@"nodeContent"];
	}
	
	
	xmlAttr *attribute = currentNode->properties;
	if (attribute)
	{
		NSMutableArray *attributeArray = [NSMutableArray array];
		while (attribute)
		{
			NSMutableDictionary *attributeDictionary = [NSMutableDictionary dictionary];
			NSString *attributeName =
			[NSString stringWithCString:(const char *)attribute->name encoding:NSUTF8StringEncoding];
			if (attributeName)
			{
				[attributeDictionary setObject:attributeName forKey:@"attributeName"];
			}
			
			if (attribute->children)
			{
				NSDictionary *childDictionary = DictionaryForNode(attribute->children, attributeDictionary);
				if (childDictionary)
				{
					[attributeDictionary setObject:childDictionary forKey:@"attributeContent"];
				}
			}
			
			if ([attributeDictionary count] > 0)
			{
				[attributeArray addObject:attributeDictionary];
			}
			attribute = attribute->next;
		}
		
		if ([attributeArray count] > 0)
		{
			[resultForNode setObject:attributeArray forKey:@"nodeAttributeArray"];
		}
	}
	
	xmlNodePtr childNode = currentNode->children;
	if (childNode)
	{
		NSMutableArray *childContentArray = [NSMutableArray array];
		while (childNode)
		{
			NSDictionary *childDictionary = DictionaryForNode(childNode, resultForNode);
			if (childDictionary)
			{
				[childContentArray addObject:childDictionary];
			}
			childNode = childNode->next;
		}
		if ([childContentArray count] > 0)
		{
			[resultForNode setObject:childContentArray forKey:@"nodeChildArray"];
		}
	}
	
	return resultForNode;
}
*/


/* This function will contruct a dictionary out of a html table node. */ 




//	htmlParserCtxtPtr parser = htmlCreatePushParserCtxt(NULL, NULL, NULL, 0, NULL, 0);
//	htmlCtxtUseOptions(parser, HTML_PARSE_NOBLANKS | HTML_PARSE_NOERROR | HTML_PARSE_NOWARNING | HTML_PARSE_NONET);
//	int parseRes = htmlParseChunk(parser, (const char *)[receivedData bytes], [receivedData length], 1);
//	if(parseRes != 0)
//		NSLog(@"Error while doing HTML parsing!");
//	else
//		NSLog(@"HTML parsing completed successfully");
//	
//	walkTree(parser->myDoc);
//	
//}

#pragma mark -


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	[self fetchHTMLData]; // initiates the web connection and fetches the data.
//    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
}



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



					/* NSURLConecction delegate methods */





-(NSString *)makeJavaScriptCommand {
//	NSMutableString *command = [NSMutableString stringWithString:@"document.createNode('html')><body>"];

/*	
	NSMutableString *command = [NSMutableString string];
	for(CCGasStationInfo *info in gasStationInfoEntries) {
		[command appendFormat:@"t = document.createElement('table')"
		 "tr11 = document.createElement('tr')"
		 "td12 = document.createElement('td')"
		 "td11.innerText = %@"
		 "td12 = document.createElement('td')"
		 "td12.innerText = %f"
		 "t.appendChild(tr1)"
		 "tr1.appendChild(td11)"
		 "tr1.appendChild(td12)"
		 "tr2 = document.createElement('tr')"
		 "td21 = document.createElement('td')"
		 "td21.innerText = %@"
		 "t.appendChild(tr2)"
		 "tr2.appendChild(td21)"
		 "document.body.appendChild(t)"
		 ,info.trademark, info.literPrice, info.address];
		
		//		[command appendFormat:@"<tr><td>%@</td><td>%@</td></tr>", info.trademark, info.literPrice];
		//		[command appendFormat:@"<tr><td>%@</td></tr>", info.address];
		//		[command appendFormat:@"</table>"];
	}	
	//	[command appendString:@"</body></html>"];
*/
 
	NSString *command = [NSString stringWithString:@"document.write('Hello World! form injected JavaScript!');"];	

//	NSString *command = [NSString stringWithString:@"t=document.getElementById('mainTable');"
//						 "row = document.createElement('tr');"
//						 "cell = document.createElement('td');"
//						 "cell.innerText = 'CELL!!!';"
//						 "row.appendChild(cell);"
//						 "t.appendChild(row)"];
	
	return command;

}


-(NSString*) generateHTMLCell:(CCGasStationInfo *)info {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"]];
    [formatter setMaximumFractionDigits:3];
    NSMutableString *cell = [NSMutableString stringWithString:@"<tr><table class=\"entry\"<tr>"];
    [cell appendFormat:@"<td class=\"trademark\">%@</td><td class=\"price\">%@</td></tr><tr>", 
                      info.trademark, [formatter stringFromNumber:[NSNumber numberWithFloat:info.literPrice]]];
    [cell appendFormat:@"<tr><td class=\"address\">%@</td></tr></table></tr>", info.address];
    return cell;
}


-(NSString*)generateViewHTML {
	NSMutableString *html = [NSMutableString string];
    NSString *css = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"main" ofType:@"css"] encoding:NSUTF8StringEncoding error:NULL]; 
	[html appendFormat:@"<html><head><style type=\"text/css\"> %@ </style> </head><body><h1>Gas<h1><table>", css]; 
	for(CCGasStationInfo *info in gasStationInfoEntries) {
        [html appendString:[self generateHTMLCell:info]];
//		[html appendString:@"<table>"];
//		NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//		[formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"el_GR"]];
//        [formatter setMaximumFractionDigits:3];
//		[html appendFormat:@"<tr><td>%@</td><td>%@</td></tr>", info.trademark, [formatter stringFromNumber:[NSNumber numberWithFloat:info.literPrice]]];
//		[html appendFormat:@"<tr><td>%@</td></tr>", info.address];
//		[html appendString:@"</table>"];
	}
	[html appendString:@"</table></body></html>"];
    NSLog(@"%@", html);

	return html;
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
    // do something with the data  
    // receivedData is declared as a method instance elsewhere  
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);  
    NSString *aStr = [[NSString alloc] initWithData:receivedData encoding:NSWindowsCP1253StringEncoding];  
    NSLog(@"%@", aStr);  
	
	gasStationInfoEntries = [self parseHTMLData];
//	[self printParsedData:gasStationInfoEntries];
	[activityIndicator stopAnimating];
//	[webView loadData:receivedData MIMEType:@"text/html" textEncodingName:@"windows-1253" baseURL:nil];  // <-- for debugging puproses
//	NSError *fileLoadingError = nil;
//	NSString *path = [[NSBundle mainBundle] pathForResource:@"page" ofType:@"html"];
//	[webView loadHTMLString:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&fileLoadingError] baseURL:nil];
	[webView loadHTMLString:[self generateViewHTML] baseURL:nil];
//	if(fileLoadingError)
//		NSLog(@"%@", fileLoadingError);
		
	[webView stringByEvaluatingJavaScriptFromString:[self makeJavaScriptCommand]];	
//	[webView reload];

	//NSLog(@"%@", parsedData);
//	NSLog(@"Χρῆστος");

    // release the connection, and the data object  
  //  [receivedData release];  
} 

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

/*
-(void)loadUrl:(id)sender {
    NSString *urlString = urlField.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    
    [(UIWebView*)self.view loadRequest:urlReq];
}
*/





- (void)dealloc {
    [super dealloc];
    [webView release];
}

@end
