//
//  XMLParser.h
//  PlayyIt
//
//  Created by Apple on 11/03/13.
//  Copyright (c) 2013 Indusnet Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject<NSXMLParserDelegate>
{
    NSMutableString *currentElementValue;
}
@property (retain, nonatomic) NSMutableString *currentElementValue;

- (XMLParser *) initXMLParser;
@end
