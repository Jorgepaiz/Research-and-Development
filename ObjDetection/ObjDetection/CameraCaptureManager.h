//
//  CameraCaptureManager.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>


@interface CameraCaptureManager : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    @private
    // capture session
    AVCaptureSession            *captureSession;
    
    // device input
    AVCaptureDeviceInput        *videoInput;
    AVCaptureDeviceInput        *audioInput;
    
    // capture outputs
    AVCaptureVideoDataOutput    *videoCaptureOutput;
    AVCaptureMovieFileOutput    *movieFileOutput;
    AVCaptureStillImageOutput   *stillImageOutput;
    
    // preview layer
    AVCaptureVideoPreviewLayer  *previewCaptureLayer;
}

@property (nonatomic, retain) AVCaptureSession          *captureSession;
@property (nonatomic, retain) AVCaptureDeviceInput      *videoInput;
@property (nonatomic, retain) AVCaptureDeviceInput      *audioInput;
@property (nonatomic, retain) AVCaptureVideoDataOutput  *videoCaptureOutput;
@property (nonatomic, retain) AVCaptureMovieFileOutput  *movieFileOutput;
@property (nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *previewCaptureLayer;

-(id)initWithView:(UIView *)view;

@end
