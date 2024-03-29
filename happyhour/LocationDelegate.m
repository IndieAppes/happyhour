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
    
    double distanceFilter = [[[[NSBundle mainBundle]
                               infoDictionary]
                              objectForKey:@"UpdateDistanceFilter"]
                             doubleValue];
    if (![self nearLocation:newLocation.coordinate
          allowableDistance:distanceFilter]) {
        self.movedQuiteABit = YES;
    }

    self.lastKnownLatitude = newLocation.coordinate.latitude;
    self.lastKnownLongitude = newLocation.coordinate.longitude;
}

- (BOOL)nearLocation:(CLLocationCoordinate2D)location
   allowableDistance:(CLLocationDistance)distance
{
    CLLocation *newLocation = [[CLLocation alloc]
                               initWithLatitude:location.latitude
                               longitude:location.longitude];
    CLLocation *oldLocation = [[CLLocation alloc]
                               initWithLatitude:self.lastKnownLatitude
                               longitude:self.lastKnownLongitude];
    
    CLLocationDistance dist = [newLocation distanceFromLocation:oldLocation];


    return !(dist > distance);
}

@end
