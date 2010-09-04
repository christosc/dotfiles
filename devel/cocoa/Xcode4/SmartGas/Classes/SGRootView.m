//
//  PriceWebView.m
//  Smart_Gas
//
//  Created by Christos Chryssochoidis on 13/08/2010.
//  Copyright 2010 University of Athens. All rights reserved.
//

#import "SGRootView.h"


@implementation SGRootView

@synthesize rootViewController = _rootViewController;
@synthesize spinner = _spinner;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		CGFloat middleX = [UIScreen mainScreen].applicationFrame.origin.x / 2;
		CGFloat middleY = [UIScreen mainScreen].applicationFrame.origin.y / 2;
		CGRect spinnerFrame = CGRectMake(middleX, middleY, 150, 150);
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:spinnerFrame];
		[self addSubview:spinner];
		self.spinner = spinner;
		[spinner release];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"%s Beginning", __func__);
	
	NSString *generatedHTML = [[self.rootViewController HTMLForEntries] retain];
	[self loadHTMLString:generatedHTML baseURL:self.rootViewController.bundleURL];
	[generatedHTML release];
}


- (void)dealloc {
	[_spinner release];
    [super dealloc];
}


@end
