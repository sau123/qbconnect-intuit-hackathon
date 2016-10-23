//
//  NetworkCall.h
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/23/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkCall : NSObject

- (NSData *)httpBodyForParamsDictionary:(NSDictionary *)paramDictionary;
+ (NSArray*) getData;

@end
