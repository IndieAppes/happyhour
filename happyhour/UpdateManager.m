//
//  UpdateManager.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "UpdateManager.h"

@implementation UpdateManager

- (NSURL *)getUpdateURL
{
    NSString *path = [[NSString alloc]
                      initWithCString:"/getBarsNearMe"
                      encoding:NSUTF8StringEncoding];
    NSURL *base = [[NSURL alloc] initWithString:[[[NSBundle mainBundle] infoDictionary]
                      objectForKey:@"UpdateServer"]];
    NSURL *url = [NSURL URLWithString:path relativeToURL:base];
    
    return url;
}

@end
