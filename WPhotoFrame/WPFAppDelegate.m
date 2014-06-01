//
//  WPFAppDelegate.m
//  WPhotoFrame
//
//  Created by Wiljan Arias on 30/05/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "WPFAppDelegate.h"
#import "WPFPhoto.h"
#import "WPFPhotosDataSource.h"

@implementation WPFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    WPFPhotosDataSource* photosDataSource = [[WPFPhotosDataSource alloc] init];
    WPFCurrentPhotoViewController* currentPhotoViewController = [[WPFCurrentPhotoViewController alloc] init];
    currentPhotoViewController.dataSource = photosDataSource;
    [[self window] setRootViewController:currentPhotoViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
