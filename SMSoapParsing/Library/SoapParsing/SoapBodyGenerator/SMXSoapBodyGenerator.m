//
//  SMXSoapBodyGenerator.m
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import "SMXSoapBodyGenerator.h"


@implementation SMXSoapBodyGenerator

+(SMXSoapBodyGenerator *)SharedInstance
{
    static SMXSoapBodyGenerator *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
-(NSString *)getWorkOrderListWith_SearchText:(NSString *)searchText SortType:(NSString *)sortType ColumnName:(NSString *)columnName PageNumber:(int)pageNumber IncludeCompleted:(NSString *)includeCompleted{
    
    NSString *LoginSessionID =@"45eae420-a0c9-4790-bf11-8151ff154327";
    int LIST_PAGESIZE=50;
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderSearchAndSortByFilterText xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<SearchText>%@</SearchText>"
                        "<SortType>%@</SortType>"
                        "<ColumnName>%@</ColumnName>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "<IncludeCompleted>%@</IncludeCompleted>"
                        "</WorkOrderSearchAndSortByFilterText>"
                        "</soap:Body>"
                        "</soap:Envelope>",LoginSessionID,searchText,sortType,columnName,pageNumber,LIST_PAGESIZE,includeCompleted];//[[Common SharedInstance] getValueForKeypath:LoginSessionID]
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
/*-(NSString *)loginUserId:(NSString*)userId Password:(NSString*)password{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<LoginV2 xmlns=\"http://tempuri.org/\">"
                        "<LogInID>%@</LogInID>"
                        "<Password>%@</Password>"
                        "<RegistrationKey>%@</RegistrationKey>"
                        "<DeviceType>2</DeviceType>"
                        "</LoginV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",userId,password,[[Common SharedInstance] getValueForKeypath:kDeviceToken]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)logoutWithLoginSessionID{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<LogoutV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<RegistrationKey>%@</RegistrationKey>"
                        "</LogoutV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[[Common SharedInstance] getValueForKeypath:kDeviceToken]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Work Order & Work Order Details API

-(NSString *)getWorkOrderListWith_SearchText:(NSString *)searchText SortType:(NSString *)sortType ColumnName:(NSString *)columnName PageNumber:(int)pageNumber IncludeCompleted:(NSString *)includeCompleted{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderSearchAndSortByFilterText xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<SearchText>%@</SearchText>"
                        "<SortType>%@</SortType>"
                        "<ColumnName>%@</ColumnName>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "<IncludeCompleted>%@</IncludeCompleted>"
                        "</WorkOrderSearchAndSortByFilterText>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],searchText,sortType,columnName,pageNumber,LIST_PAGESIZE,includeCompleted];//[[Common SharedInstance] getValueForKeypath:LoginSessionID]
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
-(NSString *)checkingPermissionSidepanel{
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<SecurityMenu xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "</SecurityMenu>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
        MyLog(@"%@",soapbody);
        return soapbody;
}
-(NSString *)getWorkOrderDetailWith_WorkOrderID:(NSString *)workOrderID{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderDetailNew xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderID>%@</WorkOrderID>"
                        "</WorkOrderDetailNew>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],workOrderID];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postWorkOrdersCompleteWith_WorkOrderDetails:(WODWorkOrder *)mWODWorkOrder{
    NSString *completeAllTasks = @"";
    if (mWODWorkOrder.CompleteAllTasks) {
        completeAllTasks = @"true";
    } else {
         completeAllTasks = @"false";
    }
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrdersComplete xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "<Hours>%@</Hours>"
                        "<FailureCode>%@</FailureCode>"
                        "<CompleteAllTasks>%@</CompleteAllTasks>"
                        "<Comments>%@</Comments>"
                        "<UpdateIndex>%d</UpdateIndex>"
                        "</WorkOrdersComplete>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],mWODWorkOrder.WorkOrderId,mWODWorkOrder.ActualDuration,mWODWorkOrder.FailureCode,completeAllTasks,mWODWorkOrder.CompleteComments,mWODWorkOrder.UpdateIndex];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getWorkOrdersCancelReason{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<RetrieveLookUpListByKey xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<key>cancel</key>"
                        "</RetrieveLookUpListByKey>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getWorkOrdersFailureCodes{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<RetrieveLookUpListByKey xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<key>failure</key>"
                        "</RetrieveLookUpListByKey>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postWorkOrdersCancelWith_WorkOrderDetails:(WODWorkOrder *)mWODWorkOrder{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrdersCancel xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "<CancelReason>%@</CancelReason>"
                        "<CompleteComment>%@</CompleteComment>"
                        "<UpdateIndex>%d</UpdateIndex>"
                        "</WorkOrdersCancel>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],mWODWorkOrder.WorkOrderId,mWODWorkOrder.CancelReason,mWODWorkOrder.CompleteComments,mWODWorkOrder.UpdateIndex];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postWorkOrdersCompleteTask_WithTaskIDs:(NSMutableArray *)arrTaskIDs{
    NSString *TaskIDs = [arrTaskIDs componentsJoinedByString:@","];
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrdersCompleteTask xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Tasks>%@</Tasks>"
                        "</WorkOrdersCompleteTask>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],TaskIDs];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postWorkOrdersCancelTask_WithTaskIDs:(NSMutableArray *)arrTaskIDs CancelReason:(NSString *)cancelReason{
    NSString *TaskIDs = [arrTaskIDs componentsJoinedByString:@","];
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderCancelTask xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Tasks>%@</Tasks>"
                        "<CancelReason>%@</CancelReason>"
                        "</WorkOrderCancelTask>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],TaskIDs,cancelReason];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getPersonnelIdList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PersonnelRetrieval xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "</PersonnelRetrieval>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    MyLog(@"%@",soapbody);
    return soapbody;
}
// Work order Labour Add Delete..
-(NSString *)WorkOrderLabourAdd:(NSString *)WorkOredId withHours:(NSString *)_hours withData:(NSString *)_date withPersonalId:(int)_personalId
{
   // _date=@"1/1/2015";
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderLaborAddV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderID>%@</WorkOrderID>"
                        "<Hours>%@</Hours>"
                        "<StartDate>%@</StartDate>"
                        "<PesonnelId>%d</PesonnelId>"
                        "</WorkOrderLaborAddV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],WorkOredId,_hours,_date,_personalId];
    MyLog(@"%@",soapbody);
    return soapbody;
    
}
//Downdate
-(NSString *)DownDateAdd:(NSString *)WorkOredId withDownDt:(NSString *)_DwnDt withDwnMnt:(NSString *)_DwnMnt withCreaterPersonalId:(NSString *)_CrtrpersonalId withEqpMentId:(NSString *)_eqpMntId withDownTimeId:(NSString *)_downTmId
{
    // _date=@"1/1/2015";
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AddWorkOrderDownTime xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderID>%@</WorkOrderID>"
                        "<DownDate>%@</DownDate>"
                        "<MinutesDown>%@</MinutesDown>"
                        "<CreatorPersonnelId>%@</CreatorPersonnelId>"
                        "<EquipmentId>%@</EquipmentId>"
                        "<DowntimeID>%@</DowntimeID>"
                        "</AddWorkOrderDownTime>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],WorkOredId,_DwnDt,_DwnMnt,_CrtrpersonalId,_eqpMntId,_downTmId];
    MyLog(@"%@",soapbody);
    return soapbody;
    
}
-(NSString *)WorkOrderLabourDelete_WithTimeCardIDs:(NSMutableArray *)arrTimeCardIDs WorkOrderDetails:(WODWorkOrder *)mWODWorkOrder
{
    NSString *TimeCardIDs = [arrTimeCardIDs componentsJoinedByString:@","];
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderLabourDeleteV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<TimecardId>%@</TimecardId>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "</WorkOrderLabourDeleteV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],TimeCardIDs,mWODWorkOrder.WorkOrderId];
    MyLog(@"%@",soapbody);
    return soapbody;
}


-(NSString *)postWorkOrdersPartIssue_WithPartID:(NSString *)partID WorkOrder:(WODWorkOrder *)mWODWorkOrder Quantity:(NSString *)quantity{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderPartIssue xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartClientLookUpId>%@</PartClientLookUpId>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "<WorkOrderClientLookUpId>%@</WorkOrderClientLookUpId>"
                        "<Quantity>%@</Quantity>"
                        "</WorkOrderPartIssue>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],partID,mWODWorkOrder.WorkOrderId,mWODWorkOrder.ClientLookupId,quantity];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postWorkOrdersPartReturn_WithPartHistoryIDs:(NSMutableArray *)arrPartHistoryIDs WorkOrder:(WODWorkOrder *)mWODWorkOrder{
    
    NSString *PartHistoryIDs = [arrPartHistoryIDs componentsJoinedByString:@","];
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderPartReturn xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartHistoryId>%@</PartHistoryId>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "</WorkOrderPartReturn>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],PartHistoryIDs,mWODWorkOrder.WorkOrderId];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Notifications, Alerts, Notification & Alert Details API

-(NSString *)getNotificationListWith_PageNumber:(int)pageNumber{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AlertORNotificationList xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "</AlertORNotificationList>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],pageNumber,50];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
-(NSString *)getNotificationDetailsforAlertId:(NSString *)_alertId{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetAlertDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<AlerttId>%@</AlerttId>"
                        "</GetAlertDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],_alertId];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postApproveOrDeny_WithAlertDetails:(NotificationsList *)mNotificationList Status:(NSString *)status{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AlertApproveDeny xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<ObjectID>%@</ObjectID>"
                        "<ObjectName>%@</ObjectName>"
                        "<Status>%@</Status>"
                        "</AlertApproveDeny>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mNotificationList.ObjectId ],mNotificationList.ObjectName,status];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postAlertForward_WithAlertDetails:(NotificationsList *)mNotificationList SendToPersonnelID:(NSString *)personnelID Comments:(NSString *)comments{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AlertNotificationForward xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<AlertUserID>%@</AlertUserID>"
                        "<SendToPersonnelId>%@</SendToPersonnelId>"
                        "<Comments>%@</Comments>"
                        "</AlertNotificationForward>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mNotificationList.AlertUserId],personnelID,comments];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postAlertDelete_WithAlertDetails:(NotificationsList *)mNotificationList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AlertNotificationDelete xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<AlertUserID>%@</AlertUserID>"
                        "</AlertNotificationDelete>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mNotificationList.AlertUserId ]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postNotificationForward_WithNotificationDetails:(NotificationsList *)mNotificationsList SendToPersonnelID:(NSString *)personnelID Comments:(NSString *)comments{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<NotificationForward xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<NotificationID>%@</NotificationID>"
                        "<SendToPersonnelId>%@</SendToPersonnelId>"
                        "<Comments>%@</Comments>"
                        "</NotificationForward>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],@"",personnelID,comments];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postNotificationDelete_WithNotificationDetails:(NotificationsList *)mNotificationList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<NotificationDelete xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<NotificationID>%@</NotificationID>"
                        "</NotificationDelete>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],@""];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Parts & Parts Details API

-(NSString *)getPartsListWith_SearchText:(NSString *)searchText PageNumber:(int)pageNumber{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PartSearchByFilterTextV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<SearchText>%@</SearchText>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "</PartSearchByFilterTextV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],searchText,pageNumber,LIST_PAGESIZE];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getPartsDetailWith_PartID:(NSString *)partID{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PartDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartId>%@</PartId>"
                        "</PartDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],partID];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getPartsDetailsAddPartIssueUnit{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<RetrieveLookUpListByKey xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<key>issueunit</key>"
                        "</RetrieveLookUpListByKey>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postPartsDetailAddPartWith_PartDetails:(PartsDetails *)mPartsDetails Bse64image:(NSString *)base64Image{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PartAdd xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<ClientLookUpId>%@</ClientLookUpId>"
                        "<Description>%@</Description>"
                        "<IssueUnit>%@</IssueUnit>"
                        "<OnHandQty>%@</OnHandQty>"
                        "<Cost>%@</Cost>"
                        "<ImageData>%@</ImageData>"
                        "</PartAdd>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],mPartsDetails.ClientLookupId_AddPart,mPartsDetails.Description_Addpart,mPartsDetails.IssueUnit,mPartsDetails.OnHandQty_Addpart,mPartsDetails.Cost_Addpart,base64Image];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postPartsDetailAddPicture_PartDetails:(PartsDetails *)mPartsDetails Bse64image:(NSString *)base64Image{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PartImageUpload xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartId>%@</PartId>"
                        "<Picture>%@</Picture>"
                        "</PartImageUpload>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mPartsDetails.PartId],base64Image];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getPartsDetailsFileNameList:(PartsDetails *)mPartsDetails{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetPartFileNameList xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartId>%@</PartId>"
                        "</GetPartFileNameList>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mPartsDetails.PartId]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getPartsDetailsGetPartFileDetails:(PartFileNameList *)mPartFileNameList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetPartFileDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<FileInfoId>%@</FileInfoId>"
                        "</GetPartFileDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mPartFileNameList.FileInfoId]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postPartsDetailPartOnHandQtyUpdate_PartDetails:(PartsDetails *)mPartsDetails{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<PartOnHandQtyUpdate xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<PartID>%@</PartID>"
                        "<OnHandQty>%d</OnHandQty>"
                        "<updateIndex>%d</updateIndex>"
                        "</PartOnHandQtyUpdate>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mPartsDetails.PartId],mPartsDetails.QtyOnHand,mPartsDetails.UpdateIndex];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Add Work Orders API

-(NSString *)getAddWorkChargeType{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetChargeType xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "</GetChargeType>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getAddWorkHierarchyEquipmentList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<HierarchyEquipment xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "</HierarchyEquipment>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getAddWorkLocationList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<LocationList xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "</LocationList>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getAddWorkTypeList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<RetrieveLookUpListByKey xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<key>type</key>"
                        "</RetrieveLookUpListByKey>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postAddWorkOrderV2With_Description:(NSString *)description ChargeType:(NSString *)chargeType ChargeTo:(NSString *)chargeTo Type:(NSString *)type Picture:(NSString *)base64String{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AddWorkOrderV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Description>%@</Description>"
                        "<ChargeType>%@</ChargeType>"
                        "<ChargeTo>%@</ChargeTo>"
                        "<Type>%@</Type>"
                        "<Picture>%@</Picture>"
                        "</AddWorkOrderV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],description,chargeType,chargeTo,type,base64String];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postAddWorkRequestV2With_Description:(NSString *)description ChargeType:(NSString *)chargeType ChargeTo:(NSString *)chargeTo Type:(NSString *)type Picture:(NSString *)base64String{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AddWorkRequestV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Description>%@</Description>"
                        "<ChargeType>%@</ChargeType>"
                        "<ChargeTo>%@</ChargeTo>"
                        "<Type>%@</Type>"
                        "<Picture>%@</Picture>"
                        "</AddWorkRequestV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],description,chargeType,chargeTo,type,base64String];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postAddEmergencyWorkOrderV2With_WorkOrderID:(NSString *)workOrderID Description:(NSString *)description ChargeType:(NSString *)chargeType ChargeTo:(NSString *)chargeTo Type:(NSString *)type Picture:(NSString *)base64String{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<AddEmergencyWorkOrderV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "<Description>%@</Description>"
                        "<ChargeType>%@</ChargeType>"
                        "<ChargeTo>%@</ChargeTo>"
                        "<Type>%@</Type>"
                        "<Picture>%@</Picture>"
                        "</AddEmergencyWorkOrderV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],workOrderID,description,chargeType,chargeTo,type,base64String];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postFollowUpWorkOrderV2With_WorkOrderID:(NSString *)workOrderID Description:(NSString *)description ChargeType:(NSString *)chargeType ChargeTo:(NSString *)chargeTo Type:(NSString *)type Picture:(NSString *)base64String{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<FollowUpWorkOrderV2 xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "<Description>%@</Description>"
                        "<ChargeType>%@</ChargeType>"
                        "<ChargeTo>%@</ChargeTo>"
                        "<Type>%@</Type>"
                        "<Picture>%@</Picture>"
                        "</FollowUpWorkOrderV2>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],workOrderID,description,chargeType,chargeTo,type,base64String];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Work Request & Work Request Details API

-(NSString *)getWorkRequestListWith_SearchText:(NSString *)searchText SortType:(NSString *)sortType ColumnName:(NSString *)columnName PageNumber:(int)pageNumber{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkRequestSearchAndSortByFilterText xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<SearchText>%@</SearchText>"
                        "<SortType>%@</SortType>"
                        "<ColumnName>%@</ColumnName>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "</WorkRequestSearchAndSortByFilterText>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],searchText,sortType,columnName,pageNumber,LIST_PAGESIZE];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getWorkRequestDetailWith_WorkOrderID:(NSString *)workOrderID{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkOrderDetailNew xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderID>%@</WorkOrderID>"
                        "</WorkOrderDetailNew>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],workOrderID];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Add Work Orders API
-(NSString *)postWorkRequestAddWith_Description:(NSString *)description Picture:(NSString *)base64String{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<WorkRequestAdd xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Description>%@</Description>"
                        "<Picture>%@</Picture>"
                        "</WorkRequestAdd>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],description,base64String];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Equipment & Equipment Details API

-(NSString *)getEquipmentListWith_SearchText:(NSString *)searchText SortType:(NSString *)sortType ColumnName:(NSString *)columnName PageNumber:(int)pageNumber{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<EquipmentSearchandSortByFilterText xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<SearchText>%@</SearchText>"
                        "<SortColumn>%@</SortColumn>"
                        "<SortType>%@</SortType>"
                        "<PageNumber>%d</PageNumber>"
                        "<PageSize>%d</PageSize>"
                        "</EquipmentSearchandSortByFilterText>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],searchText,columnName,sortType,pageNumber,LIST_PAGESIZE];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getEquipmentsDetailWith_EquipmentID:(NSString *)equipmentID{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetEquipmentDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<EquipmentId>%@</EquipmentId>"
                        "</GetEquipmentDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],equipmentID];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getEquipmentTypesForAddEquipment{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetLookUpListByName xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<ListName>EQUIP_TYPE</ListName>"
                        "<Filter></Filter>"
                        "</GetLookUpListByName>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postEquipmentsDetailAddEquipmentWith_EquipmentDetails:(EquipmentsDetails *)mEquipmentsDetails Bse64image:(NSString *)base64Image{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<EquipmentInsert xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<Name>%@</Name>"
                        "<Make>%@</Make>"
                        "<Model>%@</Model>"
                        "<SerialNumber>%@</SerialNumber>"
                        "<Location>%@</Location>"
                        "<Type>%@</Type>"
                        "<Picture>%@</Picture>"
                        "</EquipmentInsert>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],mEquipmentsDetails.Name_Add_AddEquipment,mEquipmentsDetails.Make_Add__AddEquipment,mEquipmentsDetails.Model_Add__AddEquipment,mEquipmentsDetails.SerialNumber_Add__AddEquipment,mEquipmentsDetails.Location_Add__AddEquipment,mEquipmentsDetails.Type_Add_AddEquipment,base64Image];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)postEquipmentsDetailAddPicture_EquipmentDetails:(EquipmentsDetails *)mEquipmentsDetails Bse64image:(NSString *)base64Image{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<EquipmentImageUpload xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<EquipmentId>%@</EquipmentId>"
                        "<Picture>%@</Picture>"
                        "</EquipmentImageUpload>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mEquipmentsDetails.EquipmentId],base64Image];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

-(NSString *)getEquipmentsDetailsFileNameList:(EquipmentsDetails *)mEquipmentsDetails{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetEquipmentFileNameList xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<EquipmentId>%@</EquipmentId>"
                        "</GetEquipmentFileNameList>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mEquipmentsDetails.EquipmentId]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
-(NSString *)getWorkOrderFileNameList:(WODWorkOrder *)mWorkorder{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetWorkOrderFileNameList xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<WorkOrderId>%@</WorkOrderId>"
                        "</GetWorkOrderFileNameList>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],mWorkorder.WorkOrderId];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
-(NSString *)getEquipmentsDetailsGetEquipmentFileDetails:(EquipmentFileNameList *)mEquipmentFileNameList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetEquipmentFileDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<FileInfoId>%@</FileInfoId>"
                        "</GetEquipmentFileDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mEquipmentFileNameList.FileInfoId]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
-(NSString *)getWorkorderDetailsGetEquipmentFileDetails:(WorkOrderFileNameList *)mWorkOrderFileNameList{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<GetWorkOrderFileDetails xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<FileInfoId>%@</FileInfoId>"
                        "</GetWorkOrderFileDetails>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],[NSString stringWithFormat:@"%d",mWorkOrderFileNameList.FileInfoId]];
    
    MyLog(@"%@",soapbody);
    return soapbody;
}
#pragma mark - Delete File API

-(NSString *)postDeleteFileWith_URL:(NSString *)fileURL{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<DeleteFile xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<FileURL>%@</FileURL>"
                        "</DeleteFile>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],fileURL];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}

#pragma mark - Push Notification API

-(NSString *)postRegisterDeviceForPushNotification:(NSString *)deviceToken{
    
    NSString *soapbody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Body>"
                        "<DeleteFile xmlns=\"http://tempuri.org/\">"
                        "<LoginSessionID>%@</LoginSessionID>"
                        "<FileURL>%@</FileURL>"
                        "</DeleteFile>"
                        "</soap:Body>"
                        "</soap:Envelope>",[[Common SharedInstance] getValueForKeypath:LoginSessionID],deviceToken];
    
    //MyLog(@"%@",soapbody);
    return soapbody;
}*/

@end
