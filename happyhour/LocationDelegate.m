//
//  LocationDelegate.m
//  happyhour
//
//  Created by John Kraal on 4/1/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "LocationDelegate.h"

@implementation LocationDelegate

@synthesize lastKnownLatitude;
@synthesize lastKnownLongitude;
@synthesize movedQuiteABit;

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];

    // Check if we're not NEAR the new location. If we aren't, set the
    // movedQuiteABit thing to YES. We should never set it to NO and leave that
    // to the updateManager.
    if (![self nearLocation:[newLocation coordinate]]) {
        self.movedQuiteABit = YES;
    }

    self.lastKnownLatitude = newLocation.coordinate.latitude;
    self.lastKnownLongitude = newLocation.coordinate.longitude;
    
    NSLog(@"Boing: %f %f", self.lastKnownLatitude, self.lastKnownLongitude);
}

- (BOOL)nearLocation:(CLLocationCoordinate2D)location
{
    CLLocation *newLocation = [[CLLocation alloc]
                               initWithLatitude:location.latitude
                               longitude:location.longitude];
    CLLocation *oldLocation = [[CLLocation alloc]
                               initWithLatitude:self.lastKnownLatitude
                               longitude:self.lastKnownLongitude];
    
    CLLocationDistance dist = [newLocation distanceFromLocation:oldLocation];
    
    double distanceFilter = [[[[NSBundle mainBundle]
                               infoDictionary]
                              objectForKey:@"UpdateDistanceFilter"]
                             doubleValue];

    return !(dist > distanceFilter);
}

@end
