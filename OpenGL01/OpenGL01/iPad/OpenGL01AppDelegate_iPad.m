//
//  OpenGL01AppDelegate_iPad.m
//  OpenGL01
//
//  Created by Eng. Jorge Paiz on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenGL01AppDelegate_iPad.h"
#import "iPadViewController.h"


@implementation OpenGL01AppDelegate_iPad

@synthesize viewController = _viewController;

-(void)dealloc
{
    [self.viewController release];
    
    [super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.viewController = [[iPadViewController alloc] init];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
