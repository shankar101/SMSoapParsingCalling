//
//  SMXRequestController.m
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import "SMXRequestController.h"
#define DOC_PATH(path)[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:path]

@implementation SMXRequestController

+(SMXRequestController *)SharedInstance
{
    static SMXRequestController *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

#pragma mark- Sope Method and Delegate

-(void)ApiCall_With_SoapBody:(NSString *)soapBody success:(void(^)(NSDictionary *responseDict))success  failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    if([[AFNetworkReachabilityManager sharedManager] isReachable])
    {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[[SMXURLRequestGenerator SharedInstance] createMutableURLRequestWithBody:soapBody]];
        operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
            
            
            NSXMLParser *xmlParser = (NSXMLParser *)responseObject;
            XMLParser *parser = [[XMLParser alloc] initXMLParser];
            [xmlParser setDelegate: parser];
            
            [xmlParser parse];
            NSString* jsonpolls=parser.currentElementValue;
            jsonpolls = [jsonpolls stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            NSDictionary *jsondic = [jsonpolls objectFromJSONString];
            
            MyLog(@"%@",jsondic);
            
            success (jsondic);
            
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            MyLog(@"Got post fan forum discussion operation failure with response: %@", operation.responseString);
            MyLog(@"Error: %@", error);
            failure (operation,error);
        }];
        [operation start];
    }else{
        [self ShowAlertWithMessage:@"No internet connection in your device"];
        //[[Common SharedInstance] stopLoading_onView:nil];
        return;
    }
}

#pragma mark- Download Chat Content

-(void)ApiCall_To_Download_Attachment_With_SoapBody:(NSString *)soapBody FileName:(NSString *)filename success:(void(^)(NSDictionary *responseDict))success  failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[[SMXURLRequestGenerator SharedInstance] createMutableURLRequestWithBody:soapBody]];
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"image/jpeg", @"video/mp4",  nil];
    
    NSString *filePath = DOC_PATH(filename);
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        /*if (delegate && [delegate respondsToSelector:@selector(receivedResponseForChatContentDownload:)])
        {
            [delegate receivedResponseForChatContentDownload:filePath];
        }
        else
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];*/
        
        /*NSXMLParser *xmlParser = (NSXMLParser *)responseObject;
        XMLParser *parser = [[XMLParser alloc] initXMLParser];
        [xmlParser setDelegate: parser];
        
        [xmlParser parse];
        NSString* jsonpolls=parser.currentElementValue;
        jsonpolls = [jsonpolls stringByReplacingOccurrencesOfString:@"\n" withString:@""];*/
        NSDictionary *jsondic = [[NSDictionary alloc] initWithObjectsAndKeys:filePath,@"FilePath", nil];
        //[jsondic setValue:filePath forKey:@"FilePath"];
        
        //MyLog(@"%@",jsondic);
        
        success (jsondic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure (operation,error);
        
        if (error != nil && error.code == -1001)
        {
            //NSLog(@"Timed Out");
            /*if (delegate && [delegate respondsToSelector:@selector(dataReceivedTimedOut)])
            {
                [delegate dataReceivedTimedOut];
            }*/
        }
        else if (error != nil)
        {
            //NSLog(@"Error");
            /*if (delegate && [delegate respondsToSelector:@selector(dataReceivedFailed)])
            {
                [delegate dataReceivedFailed];
            }*/
        }
    }];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
        float percentComplete = ((float)totalBytesWritten / (float)totalBytesExpectedToWrite) * 100;
        MyLog(@"%f",percentComplete);
    }];
    
    [operation start];
}
-(void)ShowAlertWithMessage:(NSString *)AlertMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SMSoapParsing" message:AlertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}
@end
