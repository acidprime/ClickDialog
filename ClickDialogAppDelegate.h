//
//  ClickDialogAppDelegate.h
//  ClickDialog
//
//  Created by Zack Smith on 3/28/12.
//  Copyright 2012 318. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface ClickDialogAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet WebView *webView;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;


- (IBAction)userClickedCancel:(id)sender;
- (IBAction)userClickedOk:(id)sender;
@end
