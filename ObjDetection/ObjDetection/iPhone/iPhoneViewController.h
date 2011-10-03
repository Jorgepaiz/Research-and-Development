//
//  iPhoneViewController.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraCaptureManager;

@interface iPhoneViewController : UIViewController
{
    UIView    *camPreviewView;
    CameraCaptureManager *captureManager;
    UIImageView *imageView;
    
@private
    IplImage* imgSource;
    IplImage* imgTemplate;
    IplImage* imgOutput;
}

@property (nonatomic, retain) IBOutlet UIView *camPreviewView;
@property (nonatomic, retain) CameraCaptureManager *captureManager;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(void)findObject;

@end
