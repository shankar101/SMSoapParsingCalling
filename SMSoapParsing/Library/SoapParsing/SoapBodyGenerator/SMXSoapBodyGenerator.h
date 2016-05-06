//
//  SMXSoapBodyGenerator.h
//  SOMAX
//
//  Created by Shankar Mallick on 31/03/15.
//  Copyright (c) 2015 shankar101. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SMXSoapBodyGenerator : NSObject

+(SMXSoapBodyGenerator *)SharedInstance;

-(NSString *)getWorkOrderListWith_SearchText:(NSString *)searchText SortType:(NSString *)sortType ColumnName:(NSString *)columnName PageNumber:(int)pageNumber IncludeCompleted:(NSString *)includeCompleted;
@end
