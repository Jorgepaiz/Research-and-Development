//
//  iPadViewController.h
//  ObjDetection
//
//  Created by Bosz Digital on 9/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraCaptureManager;

@interface iPadViewController : UIViewController
{
    UIView    *camPreviewView;
    CameraCaptureManager *captureManager;
}

@property (nonatomic, retain) IBOutlet UIView *camPreviewView;
@property (nonatomic, retain) CameraCaptureManager *captureManager;


@end
