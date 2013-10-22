//
//  M4MapPoint.m
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/22/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "M4MapPoint.h"

@implementation M4MapPoint

@synthesize coordinate, title, creationDate, dateFormatter, subtitle;


-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    
    if (self) {
        coordinate = c;
        creationDate = [NSDate date];
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        
//        NSLog(@"Created on: %@", [t stringByAppendingFormat:@"Added on %@", [dateFormatter stringFromDate:creationDate]]);
        
//        t = [t stringByAppendingFormat:@" %@", [dateFormatter stringFromDate:creationDate]];
        [self setSubtitle:[dateFormatter stringFromDate:creationDate]];
        
        [self setTitle:t];
        
        
    }
    
    return self;
}

- (id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(0, 0) title:@"Home"];
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeDouble:coordinate.latitude forKey:@"latitude"];
    [encoder encodeDouble:coordinate.longitude forKey:@"longitude"];
    [encoder encodeObject:title forKey:@"title"];
    [encoder encodeObject:subtitle forKey:@"subtitle"];
    [encoder encodeObject:creationDate forKey:@"creationDate"];
    [encoder encodeObject:dateFormatter forKey:@"dateFormatter"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        [self setCreationDate:[decoder decodeObjectForKey:@"creationDate"]];
        [self setTitle:[decoder decodeObjectForKey:@"title"]];
        [self setSubtitle:[decoder decodeObjectForKey:@"subtitle"]];
        [self setDateFormatter:[decoder decodeObjectForKey:@"dateFormatter"]];
        [self setCoordinate:CLLocationCoordinate2DMake([decoder decodeDoubleForKey:@"latitude"], [decoder decodeDoubleForKey:@"longitude"])];
    }
    
    return self;
}

@end
