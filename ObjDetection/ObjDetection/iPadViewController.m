//
//  iPadViewController.m
//  ObjDetection
//
//  Created by Bosz Digital on 9/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "iPadViewController.h"
#import "CameraCaptureManager.h"

@implementation iPadViewController


@synthesize camPreviewView = _camPreviewView;
@synthesize captureManager = _captureManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];;
    
    self.camPreviewView = nil;
    self.captureManager = nil;
}

-(void)dealloc
{
    [self.camPreviewView release];
    [self.captureManager release];
    
    [super dealloc];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.captureManager = [[CameraCaptureManager alloc] initWithView:self.camPreviewView];
}

@end
