//
//  M4MapPoint.m
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/22/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "M4MapPoint.h"

@implementation M4MapPoint

@synthesize coordinate, title, creationDate, dateFormatter;


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

@end
