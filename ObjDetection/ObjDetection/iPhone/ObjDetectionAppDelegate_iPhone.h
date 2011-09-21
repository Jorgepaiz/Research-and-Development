//
//  ObjDetectionAppDelegate_iPhone.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjDetectionAppDelegate.h"

@class iPhoneViewController;

@interface ObjDetectionAppDelegate_iPhone : ObjDetectionAppDelegate
{
    iPhoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet iPhoneViewController *viewController;

@end
