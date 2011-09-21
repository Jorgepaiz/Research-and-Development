//
//  ObjDetectionAppDelegate_iPad.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjDetectionAppDelegate.h"

@class iPadViewController;

@interface ObjDetectionAppDelegate_iPad : ObjDetectionAppDelegate
{
    iPadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet iPadViewController *viewController;


@end
