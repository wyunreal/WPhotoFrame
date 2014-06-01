//
//  WPFPhotosDataSource.m
//  WPhotoFrame
//
//  Created by Wiljan Arias on 01/06/14.
//  Copyright (c) 2014 Wiljan Arias. All rights reserved.
//

#import "WPFPhotosDataSource.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation WPFPhotosDataSource

-(void) enumeratePhotosUsingBlock: (void (^)(NSURL*))urlTreatmentBlock
{
    ALAssetsLibrary *al = [[ALAssetsLibrary alloc] init];
    [al enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                      usingBlock:^(ALAssetsGroup *group, BOOL *stop)
                                {
                                    [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop)
                                    {
                                        if (asset) {
                                            urlTreatmentBlock(asset.defaultRepresentation.url);
                                        }
                                    }];
                                }
                    failureBlock:^(NSError *error) {}];
}

-(void) thumbnailWithUrl: (NSURL*) url successBlock: (void (^)(CGImageRef))successBlock;
{
    ALAssetsLibrary *al = [[ALAssetsLibrary alloc] init];
    [al assetForURL:url resultBlock:^(ALAsset *asset)
     {
         if (asset) {
             successBlock(CGImageCreateCopy([asset thumbnail]));
         }
     }
       failureBlock:^(NSError *error) {}];
}

-(void) fullResolutionPhotoWithUrl: (NSURL*) url successBlock: (void (^)(CGImageRef))successBlock;
{
    ALAssetsLibrary *al = [[ALAssetsLibrary alloc] init];
    [al assetForURL:url resultBlock:^(ALAsset *asset)
                    {
                        if (asset) {
                            successBlock(CGImageCreateCopy([[asset defaultRepresentation] fullResolutionImage]));
                        }
                    }
       failureBlock:^(NSError *error) {}];
}

@end
