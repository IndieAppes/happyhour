//
//  Download.m
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import "Download.h"

@implementation Download

- (void)postToURL:(NSURL*)url
         postdata:(NSData*)postData
         delegate:(id)delegate
        onSuccess:(SEL)successMethod
           onFail:(SEL)failureMethod
{
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:postData];
    
    // Now request it and leave it to the delegates
}

- (void)getFromURL:(NSURL*)url
          delegate:(id)delegate
         onSuccess:(SEL)successMethod
            onFail:(SEL)failureMethod
{
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSLog(@"%@", req);
    
    // Request it
}

@end
