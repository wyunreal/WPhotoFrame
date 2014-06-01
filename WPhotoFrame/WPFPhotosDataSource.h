//
//  WPFPhotosDataSource.h
//  WPhotoFrame
//
//  Created by Wiljan Arias on 01/06/14.
//  Copyright (c) 2014 Wiljan Arias. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPFPhotosDataSource : NSObject

-(void) enumeratePhotosUsingBlock: (void (^)(NSURL*))urlTreatmentBlock;
-(void) thumbnailWithUrl: (NSURL*) url successBlock: (void (^)(CGImageRef))successBlock;
-(void) fullResolutionPhotoWithUrl: (NSURL*) url successBlock: (void (^)(CGImageRef))successBlock;

@end
