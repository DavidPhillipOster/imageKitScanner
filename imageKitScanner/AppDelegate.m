//
//  AppDelegate.m
//  imageKitScanner
//
//  Created by david on 1/6/24.
//

#import "AppDelegate.h"
#import <Quartz/Quartz.h>

@interface AppDelegate () <ICDeviceBrowserDelegate, IKScannerDeviceViewDelegate>

@property IBOutlet NSWindow *window;
@property IBOutlet IKScannerDeviceView *scannerView;

@property ICDeviceBrowser *browser;
@property ICScannerDevice *scanner;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.browser = [[ICDeviceBrowser alloc] init];
  self.browser.browsedDeviceTypeMask = ICDeviceTypeMaskScanner | ICDeviceLocationTypeMaskLocal;
  self.browser.delegate = self;
  [self.browser start];
}

- (void)deviceBrowser:(nonnull ICDeviceBrowser *)browser didAddDevice:(nonnull ICDevice *)device moreComing:(BOOL)moreComing {
  if (nil == self.scanner) {
    self.scanner = (ICScannerDevice *)device;
    self.scannerView.scannerDevice = self.scanner;
    [self.scanner requestOpenSession];
  }
}

- (void)deviceBrowser:(nonnull ICDeviceBrowser *)browser didRemoveDevice:(nonnull ICDevice *)device moreGoing:(BOOL)moreGoing {
  if (device == self.scanner) {
    self.scanner = nil;
  }
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
  return YES;
}

- (void)scannerDeviceView: (IKScannerDeviceView *)scannerDeviceView didScanToURL: (NSURL *)url fileData: (NSData *)data error: (NSError *)error {
}


@end
