//
//  UpdateManager.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "UpdateManager.h"
#import "Download.h"
#import "Bar.h"

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

// Generation method because I don't know how to initialise and fill a struct on
// one line, hth.
- (CLLocationCoordinate2D)generateStructWithLatitude:(CLLocationDegrees)latitude
                                           longitude:(CLLocationDegrees)longitude
{
    CLLocationCoordinate2D coord;
    coord.longitude = longitude;
    coord.latitude = latitude;
    return coord;
}

- (void)updateBars
{
    // I'm just going to do some mock-bars here. Ignore the ugliness and
    // everything for now, it'll be prettier later.
    
    Bar *bar1 = [[Bar alloc] initWithLocation:[self generateStructWithLatitude:52.075628
                                                                     longitude:4.308702]
                                         name:@"Testbar 1"];
    Bar *bar2 = [[Bar alloc] initWithLocation:[self generateStructWithLatitude:52.075902
                                                                     longitude:4.309191]
                                         name:@"Testbar 2"];
    Bar *bar3 = [[Bar alloc] initWithLocation:[self generateStructWithLatitude:1.0
                                                                     longitude:1.0]
                                         name:@"Testbar 3"];
    Bar *bar4 = [[Bar alloc] initWithLocation:[self generateStructWithLatitude:1.0
                                                                     longitude:1.0]
                                         name:@"Testbar 4"];
    
    localBars = [[NSArray alloc] initWithObjects:bar1, bar2, bar3, bar4, nil];
    
    NSString *postData = [[NSString alloc]
                          initWithFormat:@"latitude=%.6f&longitude=%.6f",
                          self.locationDelegate.lastKnownLatitude,
                          self.locationDelegate.lastKnownLongitude];
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
        for (Bar *bar in localBars) {
            if ([self.locationDelegate nearLocation:bar.location] &&
                ([bar hasHappyHour] || [bar happyHourEnding]))
            {
                NSLog(@"I should now alert the user!");
            }
        }
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
