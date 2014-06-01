//
//  WPFPhoto.h
//  WPhotoFrame
//
//  Created by Wiljan Arias on 01/06/14.
//  Copyright (c) 2014 Wiljan Arias. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPFPhoto : NSObject

@property (nonatomic, retain) CGImageRef thumbnailImage __attribute__((NSObject));
@property (nonatomic, retain) CGImageRef fullResolutionImage __attribute__((NSObject));

-(id) initWithImage: (CGImageRef) fullResolution thumbnail: (CGImageRef) thumbnail;

@end
