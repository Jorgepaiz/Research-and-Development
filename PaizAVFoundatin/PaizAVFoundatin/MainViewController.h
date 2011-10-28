//
//  MainViewController.h
//  PaizAVFoundatin
//
//  Created by Bosz Digital on 10/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate, UIGestureRecognizerDelegate>
{
    // view for display camera
    IBOutlet UIView             *previewView;
    AVCaptureVideoPreviewLayer  *previewLayer;
    AVCaptureVideoDataOutput    *videoDataOutput;
    dispatch_queue_t            *videoDataOutputQueue;
    AVCaptureStillImageOutput   *stillImageOutput;
    
    // zoom
    CGFloat beginGestureScale;
	CGFloat effectiveScale;
}


- (IBAction)handlePinchGesture:(UIPinchGestureRecognizer *)recognizer;

@end
