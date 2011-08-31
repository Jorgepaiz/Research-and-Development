//
//  CameraAVF.m
//  CameraAVFoundation
//
//  Created by Bosz Digital on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraAVF.h"

@implementation CameraAVF

@synthesize captureSession = _captureSession;
@synthesize imageView      = _imageView;
@synthesize customLayer    = _customLayer;
@synthesize previewLayer   = _previewLayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"initWithNibName:bundle on CameraAVF");
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.imageView    = nil;
        self.customLayer  = nil;
        self.previewLayer = nil;
    }
    NSLog(@"init on CameraAVF");
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning on CameraAVF");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad on CameraAVF");
    [super viewDidLoad];
    
    [self initCapture];
}


- (void)viewDidUnload
{
    NSLog(@"viewDidUnload on CameraAVF");
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"shouldAutorotateToInterfaceOrientation on CameraAVF");
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
    NSLog(@"dealloc on CameraAVF");
    [self.captureSession release];
    [self.previewLayer   release];
    [self.customLayer    release];
    [self.imageView      release];
    
    [super dealloc];
}

-(void)initCapture
{
    NSLog(@"initCapture on CameraAVF");
    
    // input
    AVCaptureDeviceInput *captureInput = [AVCaptureDeviceInput deviceInputWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo] error:nil];
    
    // output
    AVCaptureVideoDataOutput *captureOutput = [[AVCaptureVideoDataOutput alloc] init];
    captureOutput.alwaysDiscardsLateVideoFrames = YES;
    captureOutput.minFrameDuration = CMTimeMake(1, 10); // 10 Frames per seconds (FPS)
    
    // serial queue to handle
    dispatch_queue_t queue;
    queue = dispatch_queue_create("cameraQueue", nil);
    [captureOutput setSampleBufferDelegate:self queue:queue];
    dispatch_release(queue);
    
    // video output in BGRA
    NSString *key = (NSString *)kCVPixelBufferPixelFormatTypeKey;
    NSNumber *value = [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA];
    NSDictionary *videoSettings = [NSDictionary dictionaryWithObject:value forKey:key];
    [captureOutput setVideoSettings:videoSettings];
    
    // capture session
    self.captureSession = [[AVCaptureSession alloc] init];
    
    // add input and output
    [self.captureSession addInput:captureInput];
    [self.captureSession addOutput:captureOutput];
    
    [self.captureSession setSessionPreset:AVCaptureSessionPresetMedium];
    
    // add the custom layer
    self.customLayer = [CALayer layer];
    self.customLayer.frame = self.view.bounds;
    self.customLayer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI/2.0f, 0, 0, 1);
    self.customLayer.contentsGravity = kCAGravityResizeAspectFill;
    [self.view.layer addSublayer:self.customLayer];
    
    
    // start capture
    [self.captureSession startRunning];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    NSLog(@"captureOutput:didOutputSampleBuffer:fromConnection on CameraAVF");
}

@end





