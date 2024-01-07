# imageKitScanner

Simple example of controlling a document scanner in macOS.

I got most of the way through writing an app to directly use ImageCaptureCore, but noticed in the
header files that Apple recommends just using IKScannerDeviceView to do the bulk of the work of
setting the resolution, image depth, and image frame.

## To Compile

Change the bundle ID from com.example… to your preferred bundle ID.

## To Use

With my scanner, it looks like this:

![](images/screenshot.png)

Since the app is sandboxed, you can really only write to its container directory, but this version
opens the resulting scan in **Preview** when done.

## License

Apache V2. License
