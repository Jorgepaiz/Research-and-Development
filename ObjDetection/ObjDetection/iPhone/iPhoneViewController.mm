//
//  iPhoneViewController.m
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iPhoneViewController.h"
#import "CameraCaptureManager.h"

#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <opencv2/imgproc/imgproc_c.h>

#include <iostream>
#include <vector>


using namespace std;
using namespace cv;


@implementation iPhoneViewController


@synthesize camPreviewView = _camPreviewView;
@synthesize captureManager = _captureManager;
@synthesize imageView      = _imageView;


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
    [super viewDidUnload];
    
    self.camPreviewView = nil;
    self.captureManager = nil;
    self.imageView      = nil;
}

-(void)dealloc
{
    [self.camPreviewView release];
    [self.captureManager release];
    [self.imageView      release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.captureManager = [[CameraCaptureManager alloc] initWithView:self.camPreviewView];
    [self findObject];
}

-(void)findObject
{
    NSLog(@"Find Object");
    NSLog(@"Load images file");
    UIImage *imgS = [UIImage imageNamed:@"people.jpg"];
    UIImage *imgT = [UIImage imageNamed:@"people1.jpg"];
    
    
}

@end
