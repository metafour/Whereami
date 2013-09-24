//
//  M4MapPoint.m
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 9/22/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "M4MapPoint.h"

@implementation M4MapPoint

@synthesize coordinate;
@synthesize title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

- (id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(0, 0) title:@"Home"];
}

@end
