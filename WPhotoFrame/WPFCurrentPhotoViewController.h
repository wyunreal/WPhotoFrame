//
//  WPFViewController.h
//  WPhotoFrame
//
//  Created by Wiljan Arias on 30/05/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPFPhotosDataSource.h"

@interface WPFCurrentPhotoViewController : UIViewController

@property (strong, nonatomic) WPFPhotosDataSource *dataSource;

@end
