//
//  CameraCaptureManager.m
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraCaptureManager.h"


@interface CameraCaptureManager()
-(AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position;
-(AVCaptureDevice *)frontFacingCamera;
-(AVCaptureDevice *)backFacingCamera;
@end

@implementation CameraCaptureManager

@synthesize captureSession      = _captureSession;
@synthesize videoInput          = _videoInput;
@synthesize audioInput          = _audioInput;
@synthesize videoCaptureOutput  = _videoCaptureOutput;
@synthesize movieFileOutput     = _movieFileOutput;
@synthesize stillImageOutput    = _stillImageOutput;
@synthesize previewCaptureLayer = _previewCaptureLayer;



- (id)init
{
    self = [super init];
    if (self) {
        // input
        self.videoInput = [AVCaptureDeviceInput deviceInputWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo] error:nil];
        
        //output
        self.videoCaptureOutput = [[AVCaptureVideoDataOutput alloc] init];
        self.videoCaptureOutput.alwaysDiscardsLateVideoFrames = YES;
        self.videoCaptureOutput.minFrameDuration = CMTimeMake(1, 10);
        
        // serial queue to handle
        dispatch_queue_t queue;
        queue = dispatch_queue_create("cameraQueue", nil);
        [self.videoCaptureOutput setSampleBufferDelegate:self queue:queue];
        dispatch_release(queue);
        
        // video output in BGRA
        NSString *key = (NSString *)kCVPixelBufferPixelFormatTypeKey;
        NSNumber *value = [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA];
        NSDictionary *videoSettings = [NSDictionary dictionaryWithObject:value forKey:key];
        [self.videoCaptureOutput setVideoSettings:videoSettings];
        
        // capture session
        self.captureSession = [[AVCaptureSession alloc] init];
        [self.captureSession addInput:self.videoInput];
        [self.captureSession addOutput:self.videoCaptureOutput];
        
        // preset
        [self.captureSession setSessionPreset:AVCaptureSessionPresetHigh];
        
        // preview layer
        self.previewCaptureLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        self.previewCaptureLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        // start
        //[self.captureSession startRunning];
        NSLog(@"here!");
    }
    
    return self;
}

-(id)initWithView:(UIView *)view
{
    self = [super init];
    [self init];
    self.previewCaptureLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    [view.layer addSublayer:self.previewCaptureLayer];
    
    [self.captureSession startRunning];
    
    return self;
}

-(void)dealloc
{
    [self.captureSession     release];
    [self.videoInput         release];
    [self.audioInput         release];
    [self.videoCaptureOutput release];
    [self.movieFileOutput    release];
    [self.stillImageOutput   release];
    [self.previewCaptureLayer release];
    
    [super dealloc];
}

// camera (front and back)
-(AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position
{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices)
        if ([device position] == position) return  device;
    return nil;
}

-(AVCaptureDevice *)frontFacingCamera
{
    return [self cameraWithPosition:AVCaptureDevicePositionFront];
}

-(AVCaptureDevice *)backFacingCamera
{
    return [self cameraWithPosition:AVCaptureDevicePositionBack];
}

@end
