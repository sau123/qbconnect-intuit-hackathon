//
//  NetworkCall.m
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/23/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

#import "NetworkCall.h"

@implementation NetworkCall


+ (NSArray*) getData{
    NSArray *array =  @[
  @{
        @"date" : @"1/15/2016",
        @"description": @"Apr ~ 941 Monthly Payment Due for Federal WH/Soc Sec/Mcare Payroll Tax ~ (Form 8109-B)"
    },
  @{
      @"date" : @"1/15/2016",
      @"description": @"Dec ~ Reconcile the Bank Account&#039"
      },
  @{
      @"date" : @"1/15/2016",
      @"description": @"Oct-Dec ~ 1040 Quarterly Payment Due for Federal Individual &lt;Estimated Income&gt; Tax ~ (Form 1040ES4)"
      },
  @{
      @"date" : @"1/31/2016",
      @"description": @"Oct-Dec ~ Quarterly Payment and Report Due for CA Unemployment Payroll Tax ~ (Form DE 6)"
      },
  @{
      @"date" : @"1/31/2016",
      @"description": @"Oct-Dec ~ Quarterly Payment and Report Due for CA Sales Tax ~ (Form BT-401)"
      },
  @{
      @"date" : @"4/15/2016",
      @"description": @"  Mar ~ Reconcile the Bank Account&#039;s"
      },
  @{
      @"date" : @"3/15/2016",
      @"description": @"Prior Year&#039;s ~ Annual Payment and Report Due for CA Corp Income Tax ~ (Form CA100)"
      },
  @{
      @"date" : @"4/15/2016",
      @"description": @"Prior Year&#039;s ~ 1040 Annual Report Due for Federal Individual Income Tax ~ (Form 1040)"
      },
  @{
      @"date" : @"4/15/2016",
      @"description": @"Prior Year&#039;s ~ Annual Payment and Report Due for Federal Income Tax ~ (Form 1065)"
      },
  @{
      @"date" : @"4/15/2016",
      @"description": @"Mar ~ 941 Monthly Payment Due for Federal WH/Soc Sec/Mcare Payroll Tax ~ (Form 8109-B)"
      }
    ];
     
        return array;
        
}

-(NSString*) encodeToPercentEscapeString:(NSString *)string {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef) string,
                                                                                 NULL,
                                                                                 (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8)); }

-(NSString*) decodeFromPercentEscapeString:(NSString *)string {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (CFStringRef) string,
                                                                                                 CFSTR(""),
                                                                                                 kCFStringEncodingUTF8)); }


- (NSData *)httpBodyForParamsDictionary:(NSDictionary *)paramDictionary
{
    NSMutableArray *parameterArray = [NSMutableArray array];
    [paramDictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        NSString *param = [NSString stringWithFormat:@"%@=%@", key, [self encodeToPercentEscapeString:obj]];
        [parameterArray addObject:param];
    }];
    
    NSString *string = [parameterArray componentsJoinedByString:@"&"];
    
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

@end
