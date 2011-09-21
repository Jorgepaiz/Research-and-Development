//
//  iPhoneViewController.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraPreviewView;

@interface iPhoneViewController : UIViewController
{
    CameraPreviewView *camPreviewView;
}

@property (nonatomic, retain) IBOutlet CameraPreviewView *camPreviewView;

@end
