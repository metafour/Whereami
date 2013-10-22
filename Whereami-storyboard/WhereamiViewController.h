//
//  WhereamiViewController.h
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/19/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UISegmentedControl *mapType;
}

@property (nonatomic) NSMutableArray *mappoints;

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
- (void)mapTypeDidChange:(UISegmentedControl *)sender;
//- (NSString *)itemArchivePath;
//- (BOOL)saveChanges;

@end