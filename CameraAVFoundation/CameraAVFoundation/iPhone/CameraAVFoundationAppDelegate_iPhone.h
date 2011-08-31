//
//  CameraAVFoundationAppDelegate_iPhone.h
//  CameraAVFoundation
//
//  Created by Jorge Paiz on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraAVFoundationAppDelegate.h"

@class CameraAVF;

@interface CameraAVFoundationAppDelegate_iPhone : CameraAVFoundationAppDelegate {
    CameraAVF *cameraAVF;
}

@property (nonatomic, retain) CameraAVF *cameraAVF;

@end
