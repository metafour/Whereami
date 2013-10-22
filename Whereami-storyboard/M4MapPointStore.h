//
//  M4MapPointStore.h
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 10/10/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import <Foundation/Foundation.h>

@class M4MapPoint;

@interface M4MapPointStore : NSObject
{
    NSMutableArray *allPoints;
}

+ (M4MapPointStore *)staticStore;

- (NSArray *)allPoints;
- (void)addPoint:(M4MapPoint *)point;
- (NSString *)itemArchivePath;
- (BOOL)saveChanges;

@end
