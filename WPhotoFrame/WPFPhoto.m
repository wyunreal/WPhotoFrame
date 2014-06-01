//
//  WPFPhoto.m
//  WPhotoFrame
//
//  Created by Wiljan Arias on 01/06/14.
//  Copyright (c) 2014 Wiljan Arias. All rights reserved.
//

#import "WPFPhoto.h"

@implementation WPFPhoto

-(id) initWithImage: (CGImageRef) fullResolution thumbnail: (CGImageRef) thumbnail {
    if (self = [super init]) {
        self.fullResolutionImage = fullResolution;
        self.thumbnailImage = thumbnail;
    }
    return self;
}

@end
