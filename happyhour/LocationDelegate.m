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

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];

    self.lastKnownLatitude = newLocation.coordinate.latitude;
    self.lastKnownLongitude = newLocation.coordinate.longitude;
    
    NSLog(@"new location %f %f",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude);
}

@end
