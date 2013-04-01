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
    CLLocation *oldLocation = [[CLLocation alloc]
                               initWithLatitude:self.lastKnownLatitude
                               longitude:self.lastKnownLongitude];
    CLLocationDistance dist = [newLocation distanceFromLocation:oldLocation];
    
    double distanceFilter = (double)[[[[NSBundle mainBundle]
                                       infoDictionary]
                                      objectForKey:@"UpdateDistanceFilter"]
                                     intValue];
    
    if (dist > distanceFilter) {
        self.movedQuiteABit = YES;
    }

    self.lastKnownLatitude = newLocation.coordinate.latitude;
    self.lastKnownLongitude = newLocation.coordinate.longitude;
    
    NSLog(@"Boing: %f %f", self.lastKnownLatitude, self.lastKnownLongitude);
}

@end
