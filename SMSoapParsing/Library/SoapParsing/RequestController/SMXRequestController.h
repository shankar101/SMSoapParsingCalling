//
//  SMXRequestController.h
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMXRequestController : NSObject

+(SMXRequestController *)SharedInstance;

-(void)ApiCall_With_SoapBody:(NSString *)soapBody success:(void(^)(NSDictionary *responseDict))success  failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;
-(void)ApiCall_To_Download_Attachment_With_SoapBody:(NSString *)soapBody FileName:(NSString *)filename success:(void(^)(NSDictionary *responseDict))success  failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
