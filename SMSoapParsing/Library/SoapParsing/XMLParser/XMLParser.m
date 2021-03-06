//
//  XMLParser.m
//  PlayyIt
//
//  Created by Apple on 11/03/13.
//  Copyright (c) 2013 Indusnet Technologies. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize currentElementValue;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
- (XMLParser *) initXMLParser
{
    self = [super init];
    self.currentElementValue = nil;
    
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"LoginV2Response"] || [elementName isEqualToString:@"LogoutV2Response"] || [elementName isEqualToString:@"WorkOrderSearchAndSortByFilterTextResponse"] || [elementName isEqualToString:@"WorkOrderDetailNewResponse"] || [elementName isEqualToString:@"WorkOrdersCompleteResponse"] || [elementName isEqualToString:@"RetrieveLookUpListByKeyResponse"] || [elementName isEqualToString:@"WorkOrdersCancelResponse"] || [elementName isEqualToString:@"WorkOrdersCompleteTaskResponse"] || [elementName isEqualToString:@"WorkOrderCancelTaskResponse"] || [elementName isEqualToString:@"PersonnelRetrievalResponse"] || [elementName isEqualToString:@"WorkOrderLaborAddResponse"] || [elementName isEqualToString:@"WorkOrderLaborRetrivalResponse"] || [elementName isEqualToString:@"WorkOrderLabourDeleteResponse"] || [elementName isEqualToString:@"WorkOrderPartAddResponse"] || [elementName isEqualToString:@"WorkOrderPartIssueResponse"] || [elementName isEqualToString:@"WorkOrderPartReturnResponse"] || [elementName isEqualToString:@"PartSearchByFilterTextV2Response"] || [elementName isEqualToString:@"PartDetailsResponse"] || [elementName isEqualToString:@"PartAddResponse"] || [elementName isEqualToString:@"PartImageUploadResponse"] || [elementName isEqualToString:@"GetPartFileNameListResponse"] || [elementName isEqualToString:@"PartOnHandQtyUpdateResponse"] || [elementName isEqualToString:@"GetPartFileDetailsResponse"] || [elementName isEqualToString:@"GetChargeTypeResponse"] || [elementName isEqualToString:@"HierarchyEquipmentResponse"] || [elementName isEqualToString:@"LocationListResponse"] || [elementName isEqualToString:@"AddWorkOrderV2Response"] || [elementName isEqualToString:@"AddWorkRequestV2Response"] || [elementName isEqualToString:@"AddEmergencyWorkOrderV2Response"] || [elementName isEqualToString:@"FollowUpWorkOrderV2Response"] || [elementName isEqualToString:@"WorkRequestSearchAndSortByFilterTextResponse"] ||  [elementName isEqualToString:@"WorkRequestAddResponse"] || [elementName isEqualToString:@"EquipmentSearchandSortByFilterTextResponse"] || [elementName isEqualToString:@"GetEquipmentDetailsResponse"] || [elementName isEqualToString:@"GetLookUpListByNameResponse"] || [elementName isEqualToString:@"EquipmentInsertResponse"] || [elementName isEqualToString:@"EquipmentImageUploadResponse"] || [elementName isEqualToString:@"GetEquipmentFileNameListResponse"] || [elementName isEqualToString:@"GetEquipmentFileDetailsResponse"] || [elementName isEqualToString:@"AlertORNotificationListResponse"] || [elementName isEqualToString:@"AlertApproveDenyResponse"] || [elementName isEqualToString:@"AlertForwardResponse"] || [elementName isEqualToString:@"AlertDeleteResponse"] || [elementName isEqualToString:@"NotificationForwardResponse"] || [elementName isEqualToString:@"NotificationDeleteResponse"] || [elementName isEqualToString:@"AlertNotificationDeleteResponse"] || [elementName isEqualToString:@"GetAlertDetailsResponse"] || [elementName isEqualToString:@"AlertNotificationForwardResponse"] || [elementName isEqualToString:@"DeleteFileResponse"] || [elementName isEqualToString:@"WorkOrderLabourDeleteV2Response"] || [elementName isEqualToString:@"WorkOrderLaborAddV2Response"]||[elementName isEqualToString:@"AddWorkOrderDownTimeResponse"]||[elementName isEqualToString:@"SecurityMenuResponse"]||[elementName isEqualToString:@"GetWorkOrderFileNameListResponse"]||[elementName isEqualToString:@"GetWorkOrderFileDetailsResponse"])
        self.currentElementValue = [NSMutableString string];
    MyLog(@"%@",self.currentElementValue);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string

{
    if(self.currentElementValue)
        [self.currentElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    ;
}

@end
