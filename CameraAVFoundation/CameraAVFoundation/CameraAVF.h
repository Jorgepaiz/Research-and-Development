//
//  CameraAVF.h
//  CameraAVFoundation
//
//  Created by Bosz Digital on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>

@interface CameraAVF : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    AVCaptureSession *captureSession;
    UIImageView      *imageView;
    CALayer          *customLayer;
    AVCaptureVideoPreviewLayer *previewLayer;
}

@property (nonatomic, retain) AVCaptureSession *captureSession;
@property (nonatomic, retain) UIImageView      *imageView;
@property (nonatomic, retain) CALayer          *customLayer;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *previewLayer; 

-(void)initCapture;

@end
