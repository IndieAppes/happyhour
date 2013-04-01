//
//  LocationDelegate.m
//  happyhour
//
//  Created by John Kraal on 4/1/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "LocationDelegate.h"

@implementation LocationDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"new location %f %f",
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude);
    
//    UILocalNotification *noti = [[UILocalNotification alloc] init];
//    noti.alertBody = @"Pay attention!";
//    noti.fireDate = nil;
//    
//    [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
}

@end
