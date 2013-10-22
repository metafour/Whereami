//
//  M4MapPointStore.m
//  Whereami-storyboard
//
//  Created by Camron Schwoegler on 10/10/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "M4MapPointStore.h"

@implementation M4MapPointStore

+ (M4MapPointStore *)staticStore
{
    static M4MapPointStore *staticStore = nil;
    
    if (!staticStore) {
        staticStore = [[super allocWithZone:nil] init];
    }
    
    return staticStore;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [M4MapPointStore staticStore];
}

- (NSArray *)allPoints
{
    return allPoints;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        NSString *path = [self itemArchivePath];
        
        allPoints = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!allPoints) {
            allPoints = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

- (void)addPoint:(M4MapPoint *)point
{
    [allPoints addObject:point];
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"mappoints.archive"];
}

- (BOOL)saveChanges
{
    // Returns success or failure
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:allPoints toFile:path];
}
@end
