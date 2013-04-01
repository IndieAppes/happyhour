//
//  Download.h
//  happyhour
//
//  Created by John Kraal on 3/31/13.
//  Copyright (c) 2013 fancyappes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Download : NSObject {
    NSURLConnection *connection;
}

- (void)postToURL:(NSURL*)url postdata:(NSData*)postData delegate:(id)delegate onSuccess:(SEL)successMethod onFail:(SEL)failureMethod;
- (void)getFromURL:(NSURL*)url delegate:(id)delegate onSuccess:(SEL)successMethod onFail:(SEL)failureMethod;

@end
