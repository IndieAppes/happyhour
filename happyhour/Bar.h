//
//  Bar.h
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Bar : NSObject

@property (atomic) NSInteger id;
@property (atomic) NSString *name;
@property (atomic) NSString *description;
@property (atomic) NSString *phoneNumber;
@property (atomic) CLLocationCoordinate2D location;
@property (atomic) NSURL *website;
@property (atomic) NSArray *openingTimes;
@property (atomic) NSArray *happyHourTimes;
@property (atomic) NSString *address;

- (id)initWithLocation:(CLLocationCoordinate2D)location name:(NSString*)name;
- (BOOL)hasHappyHour;
- (BOOL)happyHourEnding;

@end
