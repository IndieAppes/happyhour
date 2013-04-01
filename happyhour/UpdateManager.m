//
//  UpdateManager.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "UpdateManager.h"
#import "Download.h"

@implementation UpdateManager

@synthesize localBars;
@synthesize locationDelegate;

- (NSURL *)getUpdateURL
{
    NSString *path = [[NSString alloc]
                      initWithCString:"/getBarsNearMe"
                      encoding:NSUTF8StringEncoding];
    NSURL *base = [[NSURL alloc] initWithString:[[[NSBundle mainBundle]
                                                  infoDictionary]
                                                 objectForKey:@"UpdateServer"]];
    NSURL *url = [NSURL URLWithString:path relativeToURL:base];

    return url;
}

- (void)updateBars
{
    localBars = [[NSArray alloc] initWithObjects:@"dicks",
                 @"dongues", @"YOSPOS", @"BITCH", nil];
    NSLog(@"Updating bars near %f %f",
          self.locationDelegate.lastKnownLatitude,
          self.locationDelegate.lastKnownLongitude);
    
    NSString *postData = [[NSString alloc]
                          initWithFormat:@"latitude=%.6f&longitude=%.6f",
                          self.locationDelegate.lastKnownLatitude,
                          self.locationDelegate.lastKnownLongitude];
    NSLog(@"latitude=%.6f&longitude=%.6f",
          self.locationDelegate.lastKnownLatitude,
          self.locationDelegate.lastKnownLongitude);
    Download *dl = [[Download alloc] init];
    [dl postToURL:[self getUpdateURL]
         postdata:[postData dataUsingEncoding:NSUTF8StringEncoding]
         delegate:self
        onSuccess:@selector(retrievedBars:)
           onFail:@selector(failedToRetrieveBars:)];
    
    self.locationDelegate.movedQuiteABit = NO;
}

- (NSArray *)getBarsNearMe
{
    return localBars;
}

- (void)checkForNewHappyHours
{
    if (self.locationDelegate.movedQuiteABit == YES) {
        [self updateBars];
    }
    else {
        NSLog(@"Checking happy hours near %f %f",
              self.locationDelegate.lastKnownLatitude,
              self.locationDelegate.lastKnownLongitude);
    }
}

- (void)retrievedBars:(NSData*)barContent
{
    // barContent is JSON, parse and stick it into Bar objects; stick those in
    // an NSArray and attach to localBars.
}

- (void)failedToRetrieveBars:(id)errorObject
{
    NSLog(@"failed to retrieve local bars.");
}

- (CLLocationCoordinate2D)getCurrentLocation
{
    CLLocationCoordinate2D coord;
    coord.latitude = self.locationDelegate.lastKnownLatitude;
    coord.longitude = self.locationDelegate.lastKnownLongitude;
    return coord;
}

@end
