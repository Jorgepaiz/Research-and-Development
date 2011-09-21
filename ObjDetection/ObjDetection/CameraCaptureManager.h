//
//  CameraCaptureManager.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraCaptureManager : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    @private
    // capture session
    AVCaptureSession            *session;
    AVCaptureVideoOrientation   *orientation;
    
    // device input
    AVCaptureDeviceInput        *videoInput;
    AVCaptureDeviceInput        *audioInput;
    
    // capture outputs
    AVCaptureVideoDataOutput    *videoCaptureOutput;
    AVCaptureMovieFileOutput    *movieFileOutput;
    AVCaptureStillImageOutput   *stillImageOutput;
}

@property (nonatomic, readonly, retain) AVCaptureSession        *session;
@property (nonatomic, assign) AVCaptureVideoOrientation         *orientation;
@property (nonatomic, readonly, retain) AVCaptureDeviceInput    *videoInput;
@property (nonatomic, readonly, retain) AVCaptureDeviceInput    *audioInput;

@end
