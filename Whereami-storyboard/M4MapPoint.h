//
//  M4MapPoint.h
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/22/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface M4MapPoint : NSObject <MKAnnotation, NSCoding>

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;
- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;

//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) NSDate *creationDate;
@property (nonatomic) NSDateFormatter *dateFormatter;

@end
