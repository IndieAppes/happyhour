//
//  UpdateManager.h
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "LocationDelegate.h"

@interface UpdateManager : NSObject

@property (strong) NSArray *localBars;
@property (strong, nonatomic) LocationDelegate* locationDelegate;
@property (strong, atomic) MKMapView *mapView;

- (NSURL*)getUpdateURL;
- (void)updateBars;
- (void)checkForNewHappyHours;
- (CLLocationCoordinate2D)getCurrentLocation;

@end
