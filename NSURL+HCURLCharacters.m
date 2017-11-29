//
//  NSURL+HDURLCharacters.m
//  HDMall
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Haier. All rights reserved.
//

#import "NSURL+HCURLCharacters.h"

@implementation NSURL (HCURLCharacters)

+ (NSURL *)URLWithChineseCharacters:(NSString *)URLStr {
    NSString *url = [URLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self URLWithString:url];
}

@end
