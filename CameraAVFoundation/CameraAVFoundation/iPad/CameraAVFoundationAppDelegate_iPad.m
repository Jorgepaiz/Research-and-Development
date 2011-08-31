//
//  CameraAVFoundationAppDelegate_iPad.m
//  CameraAVFoundation
//
//  Created by Jorge Paiz on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraAVFoundationAppDelegate_iPad.h"
#import "CameraAVF.h"

@implementation CameraAVFoundationAppDelegate_iPad

@synthesize cameraAVF = _cameraAVF;

- (void)dealloc
{
    NSLog(@"dealloc on CameraAVFoundationAppDelegate_iPad");
    [self.cameraAVF release];
    
	[super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"application:didFinishLaunchingWithOptions on CameraAVFoundationAppDelegate_iPad");
    self.cameraAVF = [[CameraAVF alloc] init];
    [self.window setRootViewController:self.cameraAVF];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
