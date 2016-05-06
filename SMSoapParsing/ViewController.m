//
//  ViewController.m
//  SMSoapParsing
//
//  Created by Shankar Mallick on 05/05/16.
//  Copyright © 2016 shankar101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        SMXSoapBodyGenerator *soapBody = [SMXSoapBodyGenerator SharedInstance];
        SMXRequestController *reqController = [SMXRequestController SharedInstance];
        [reqController ApiCall_With_SoapBody:[soapBody getWorkOrderListWith_SearchText:@"" SortType:@"desc" ColumnName:@"ScheduledStartDate" PageNumber:1 IncludeCompleted:@"false"] success:^(NSDictionary *responseDict)
         {
             
             MyLog(@"%@",responseDict);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             MyLog(@"%@",error);
         }];
        
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
