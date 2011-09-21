//
//  CameraCaptureManagerDelegate.h
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CameraCaptureManagerDelegate <NSObject>

@optional
@property (nonatomic, retain) UILabel *lblFPS;

@end
