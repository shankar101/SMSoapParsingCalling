//
//  SMXURLRequestGenerator.h
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMXURLRequestGenerator : NSObject

+(SMXURLRequestGenerator *)SharedInstance;
-(NSMutableURLRequest *)createMutableURLRequestWithBody:(NSString *)soapBody;

@end
