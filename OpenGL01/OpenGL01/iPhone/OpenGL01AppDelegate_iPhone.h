//
//  OpenGL01AppDelegate_iPhone.h
//  OpenGL01
//
//  Created by Eng. Jorge Paiz on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenGL01AppDelegate.h"

@class iPhoneViewController;

@interface OpenGL01AppDelegate_iPhone : OpenGL01AppDelegate
{
    iPhoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet iPhoneViewController *viewController;

@end
