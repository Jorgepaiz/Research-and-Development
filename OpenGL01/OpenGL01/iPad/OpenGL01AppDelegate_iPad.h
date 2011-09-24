//
//  OpenGL01AppDelegate_iPad.h
//  OpenGL01
//
//  Created by Eng. Jorge Paiz on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenGL01AppDelegate.h"

@class iPadViewController;

@interface OpenGL01AppDelegate_iPad : OpenGL01AppDelegate
{
    iPadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet iPadViewController *viewController;

@end
