//
//  WebViewExampleAppDelegate.m
//  WebViewExample
//

#import "SamorostExampleAppDelegate.h"

@implementation WebViewExampleAppDelegate

@synthesize window;
@synthesize webView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window orderFrontRegardless];
}

- (void)awakeFromNib {
    
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/html/Samorost2.html"];
    if([[NSFileManager defaultManager] fileExistsAtPath:htmlPath]){
        [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
        [window setDelegate:self];
    }else{
        NSAlert *alert = [NSAlert alertWithMessageText:@"Error" defaultButton:@"Ok" alternateButton:NULL otherButton:nil informativeTextWithFormat:@"Resource files not found."];
        [alert runModal];
        [NSApp terminate:self];
    }
}

- (void)windowWillClose:(NSNotification *)aNotification {
	[NSApp terminate:self];
}

@end