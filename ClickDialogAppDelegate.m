//
//  ClickDialogAppDelegate.m
//  ClickDialog
//
//  Created by Zack Smith on 3/28/12.
//  Copyright 2012 318. All rights reserved.
//

#import "ClickDialogAppDelegate.h"

@implementation ClickDialogAppDelegate

@synthesize window;
@synthesize webView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// "Activate" Application
	[NSApp arrangeInFront:self];
	[NSApp activateIgnoringOtherApps:YES];
	// Load the webview
	NSBundle *mainBundle = [NSBundle bundleForClass:[self class]];
	NSURL *url = [mainBundle URLForResource:@"web"
							  withExtension:@"html"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [[webView mainFrame] loadRequest:requestObj];
}

- (IBAction)userClickedCancel:(id)sender
{
	exit(1);
}

-(IBAction)userClickedOk:(id)sender
{
	[NSApp terminate:self];
	
}

// Found on http://www.cocoabuilder.com/archive/cocoa/220715-webview-open-new-windows-in-default-browser.html
- (void)webView:(WebView *)sender decidePolicyForNavigationAction:
(NSDictionary *)actionInformation request:(NSURLRequest *)request
		  frame:(WebFrame *)frame decisionListener:(id
													<WebPolicyDecisionListener>)listener
{
	if ([[actionInformation objectForKey:WebActionNavigationTypeKey]
		 intValue] != WebNavigationTypeOther) {
		[listener ignore];
		[[NSWorkspace sharedWorkspace] openURL:[request URL]];
	}
	else
		[listener use];
}

@end
