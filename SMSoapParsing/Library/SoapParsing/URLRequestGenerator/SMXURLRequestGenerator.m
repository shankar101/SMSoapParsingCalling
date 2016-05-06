//
//  SMXURLRequestGenerator.m
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import "SMXURLRequestGenerator.h"
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define kBASE_URL @""

@implementation SMXURLRequestGenerator

+(SMXURLRequestGenerator *)SharedInstance
{
    static SMXURLRequestGenerator *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

-(NSMutableURLRequest *)createMutableURLRequestWithBody:(NSString *)soapBody
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    [request setTimeoutInterval:60];
    [request setURL:[NSURL URLWithString:@""]];
    [request setHTTPMethod:@"POST"];
    
    NSMutableData *postbody = [NSMutableData data];
    [postbody appendData:[soapBody dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:postbody];
    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField: @"Content-Type"];
    return request;
}
-(NSString *)getValueForKeypath:(NSString *)key
{
    return [USER_DEFAULTS valueForKeyPath:key];
}
@end
