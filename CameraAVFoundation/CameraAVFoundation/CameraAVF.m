//
//  CameraAVF.m
//  CameraAVFoundation
//
//  Created by Bosz Digital on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraAVF.h"

@implementation CameraAVF

@synthesize captureSession = _captureSession;
@synthesize imageView      = _imageView;
@synthesize customLayer    = _customLayer;
@synthesize previewLayer   = _previewLayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"initWithNibName:bundle on CameraAVF");
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.imageView    = nil;
        self.customLayer  = nil;
        self.previewLayer = nil;
    }
    NSLog(@"init on CameraAVF");
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning on CameraAVF");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad on CameraAVF");
    [super viewDidLoad];
    
    [self initCapture];
}


- (void)viewDidUnload
{
    NSLog(@"viewDidUnload on CameraAVF");
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"shouldAutorotateToInterfaceOrientation on CameraAVF");
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)initCapture
{
    NSLog(@"initCapture on CameraAVF");
}

@end
