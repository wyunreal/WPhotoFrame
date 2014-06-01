//
//  WPFViewController.m
//  WPhotoFrame
//
//  Created by Wiljan Arias on 30/05/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "WPFCurrentPhotoViewController.h"

@interface WPFCurrentPhotoViewController ()

@property (strong, nonatomic) UIImageView *currentPhotoView;
@property (nonatomic) int currentPhotoIndex;
@property (strong, nonatomic) NSMutableArray* allPhotoUrls;
@property (nonatomic) CGImageRef nextImage;

- (void)showNextPhoto:(NSTimer*)photoPresenterTimer;
- (void) loadFirstPhoto:(NSTimer*)photoPresenterTimer;

@end


@implementation WPFCurrentPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentPhotoIndex = 0;
    [self fetchAllPhotoUrls];
    
    self.currentPhotoView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: self.currentPhotoView];
    
    [self squeduleSelector:@selector(loadFirstPhoto:) withTime:1.0 repeat:NO];
}


-(void) fetchAllPhotoUrls
{
    self.allPhotoUrls = [[NSMutableArray alloc] initWithCapacity:0];
    [self.dataSource enumeratePhotosUsingBlock:^(NSURL *url)
     {
         [self.allPhotoUrls addObject:url];
     }];
}


-(void) loadFirstPhoto:(NSTimer*)photoPresenterTimer
{
    if (self.allPhotoUrls.count > 0) {
        [self loadPhotoWithUrl: self.allPhotoUrls[self.currentPhotoIndex]];
        [self squeduleSelector:@selector(showNextPhoto:) withTime:2.0 repeat:YES];
    }
}


- (void)showNextPhoto:(NSTimer*)photoPresenterTimer
{
    UIImage *nextPhoto = [UIImage imageWithCGImage: self.nextImage];
    UIImageView * nextPhotoImageView = [[UIImageView alloc] initWithFrame: [self frameForImage:nextPhoto]];
    nextPhotoImageView.image = nextPhoto;
        
    [UIView transitionFromView:self.currentPhotoView
                        toView:nextPhotoImageView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished){
                                        [self.currentPhotoView removeFromSuperview];
                                        self.currentPhotoView = nextPhotoImageView;
                                }];
    
    [self loadPhotoWithUrl: self.allPhotoUrls[self.currentPhotoIndex]];
}


-(void) loadPhotoWithUrl: (NSURL*)url
{
    [self.dataSource fullResolutionPhotoWithUrl:url
                                   successBlock:^(CGImageRef image)
                                                {
                                                    self.nextImage = image;
                                                    self.currentPhotoIndex = (self.currentPhotoIndex+1) % self.allPhotoUrls.count;
                                                }];
}


-(CGRect) frameForImage: (UIImage*) image
{
    CGFloat x, y, height, width;
    CGSize containerSize = self.view.bounds.size;
    float imageAspectRatio = image.size.width / image.size.height;
    float containerAspectRatio = containerSize.width / containerSize.height;
    
    if (imageAspectRatio >= containerAspectRatio) {
        height = containerSize.height;
        width = imageAspectRatio * height;
        x = -fabs(containerSize.width - width) / 2.0;
        y = 0;
    } else {
        width = containerSize.width;
        height = width / imageAspectRatio;
        x = 0;
        y = -fabs(containerSize.height - height) / 2.0;
    }
    return CGRectMake(x, y, width, height);
}


-(void) squeduleSelector: (SEL) selector withTime: (NSTimeInterval) timeInterval repeat: (BOOL) repeat
{
    [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                     target:self selector:selector
                                   userInfo:@{}
                                    repeats:repeat];
}

@end
