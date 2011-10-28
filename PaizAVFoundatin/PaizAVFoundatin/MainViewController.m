//
//  MainViewController.m
//  PaizAVFoundatin
//
//  Created by Bosz Digital on 10/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

typedef enum typeLogs {
    none        = 0,
    complete    = 1
} TypeLogs;

int const logLevelDisplay = 1;

@interface MainViewController(InternalMethods)
- (void)setupAVCapture;
- (void)teardownAVCapture;
@end


@implementation MainViewController

- (void)setupAVCapture
{
    if (logLevelDisplay == 1)
        NSLog(@"setupAVCapture");
    
    NSError *error = nil;
    
    // create session on iPhone or iPad
    AVCaptureSession    *session = [AVCaptureSession new];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [session setSessionPreset:AVCaptureSessionPreset640x480];
    else
        [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    // select a video device, make an input
    AVCaptureDevice      *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    // add input
    if ([session canAddInput:deviceInput])
        [session addInput:deviceInput];
    
    // make a still image output
    stillImageOutput = [AVCaptureStillImageOutput new];
    [stillImageOutput addObserver:self forKeyPath:@"capturingStillImage" options:NSKeyValueObservingOptionNew context:@"AVCaptureStillImageIsCapturingStillImageContext"];
    if ([session canAddOutput:stillImageOutput])
        [session addOutput:stillImageOutput];
    
    // make a video data output
    videoDataOutput = [AVCaptureVideoDataOutput new];
    
    // we want BGRA, both CoreGraphics and OpenGL work very fast with 'BGRA'
    [videoDataOutput setVideoSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey]];
    [videoDataOutput setAlwaysDiscardsLateVideoFrames:YES]; // discard if the data output queue is blocked (as we process the still image)
    
    
    // create a serial dispatch queue used for the sample buffer delegate as well as when a still image is captured
    // a serial dispatch queue must be used to guarantee that video frames will be delivered in order
    videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
    [videoDataOutput setSampleBufferDelegate:self queue:videoDataOutputQueue];
    if ([session canAddOutput:videoDataOutput])
        [session addOutput:videoDataOutput];
    [[videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:NO];
    
    // display on previewLayer
    previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    CALayer *rootLayer = [previewView layer];
    [rootLayer setMasksToBounds:YES];
    [previewLayer setFrame:[rootLayer bounds]];
    [rootLayer addSublayer:previewLayer];
    [session startRunning];
}


- (void)teardownAVCapture
{
    if (logLevelDisplay == 1)
        NSLog(@"teardownAVCapture");
    
    [stillImageOutput removeObserver:self forKeyPath:@"isCapturingStillImage"];
    [previewLayer removeFromSuperlayer];
}


#pragma mark - View lifecycle
- (void)viewDidLoad
{
    if (logLevelDisplay == 1)
        NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    // load de camera view
    effectiveScale = 1.0;
    [self setupAVCapture];
}


- (void)viewDidUnload
{
    if (logLevelDisplay == 1)
        NSLog(@"viewDidUnload");
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    if (logLevelDisplay == 1)
        NSLog(@"didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    if (logLevelDisplay == 1)
        NSLog(@"dealloc");
    
    [self teardownAVCapture];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (logLevelDisplay == 1)
        NSLog(@"shouldAutorotateToInterfaceOrientation");
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)handlePinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    if (logLevelDisplay == 1)
        NSLog(@"handlePinchGesture");
    
    NSUInteger numTouches = [recognizer numberOfTouches];
    for (int i=0; i<numTouches; ++i)
    {
        CGPoint location = [recognizer locationOfTouch:i inView:previewView];
        //CGPoint convertedLocation = [previewView convertPoint:location toView:<#(UIView *)#>
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]])
        beginGestureScale = effectiveScale;
    
    return YES;
}


@end
