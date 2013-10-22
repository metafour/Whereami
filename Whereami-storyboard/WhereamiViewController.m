//
//  WhereamiViewController.m
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/19/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "WhereamiViewController.h"
#import "M4MapPoint.h"
#import "M4MapPointStore.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

@synthesize mappoints;

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        mappoints = [[NSMutableArray alloc] init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
//        NSLog(@"Starting to update location!");
        
//        [locationManager startUpdatingLocation];
        
        
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//    NSLog(@"%@", [locations lastObject]);
    
    // How many seconds ago was this location created?
    CLLocation *newLocation = [locations lastObject];
    
    NSTimeInterval secondsago = [[newLocation timestamp] timeIntervalSinceNow];
    
    if (secondsago < -180) {
        return;
    }
    
    [self foundLocation:[locations lastObject]];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
//    NSLog(@"Failed to update location: %@", error);
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
}

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
    
    // Register action for segmented control
    [mapType addTarget:self action:@selector(mapTypeDidChange:) forControlEvents:UIControlEventValueChanged];
    
    for (M4MapPoint *point in [[M4MapPointStore staticStore] allPoints]) {
        [worldView addAnnotation:point];
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // When worldView is done figuring out where we are this method will get called since we're the delegate for the MKMapView.
    CLLocationCoordinate2D coordinate = [userLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500);
    
    [worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coordinate = [loc coordinate];
    
    // Create M4MapPoint with current data
    M4MapPoint *mappoint = [[M4MapPoint alloc] initWithCoordinate:coordinate title:[locationTitleField text]];
    
    // Add MapPoint to current map
    [worldView addAnnotation:mappoint];
    
    // Add MapPoint to Array for archiving
//    [mappoints addObject:mappoint];
    
    // Add MapPoint to store
    [[M4MapPointStore staticStore] addPoint:mappoint];
    
    // Zoom to the current location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
}

- (void)mapTypeDidChange:(UISegmentedControl *)sender
{
//    NSLog(@"Changing map type: %@", [sender titleForSegmentAtIndex:[sender selectedSegmentIndex]]);
    [worldView setMapType:[mapType selectedSegmentIndex]];
}

//- (NSString *)itemArchivePath
//{
//    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
//    
//    return [documentDirectory stringByAppendingPathComponent:@"mappoints.archive"];
//}
//
//- (BOOL)saveChanges
//{
//    // Returns success or failure
//    NSString *path = [self itemArchivePath];
//    
//    return [NSKeyedArchiver archiveRootObject:mappoints toFile:path];
//    
//}


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
