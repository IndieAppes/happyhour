//
//  Bar.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "Bar.h"

@implementation Bar

@synthesize id;
@synthesize name;
@synthesize description;
@synthesize phoneNumber;
@synthesize location;
@synthesize website;
@synthesize openingTimes;
@synthesize happyHourTimes;
@synthesize address;

- (id)initWithLocation:(CLLocationCoordinate2D)loc
                  name:(NSString*)nam
{
    if (self = [super init]) {
        self.location = loc;
        self.name = nam;
    }
    return self;
}

- (BOOL)hasHappyHour
{
    return NO;
}

- (BOOL)happyHourEnding
{
    return NO;
}

@end
