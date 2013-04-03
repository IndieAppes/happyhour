//
//  LocationDelegate.h
//  happyhour
//
//  Created by John Kraal on 4/1/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationDelegate : NSObject <CLLocationManagerDelegate>

@property double lastKnownLatitude;
@property double lastKnownLongitude;
@property BOOL movedQuiteABit;

- (void)locationManager:(CLLocationManager *)manage
     didUpdateLocations:(NSArray *)locations;
- (BOOL)nearLocation:(CLLocationCoordinate2D)location
   allowableDistance:(CLLocationDistance)distance;

@end
