//
//  NSString+LQF.m
//  LQFLearnDemo
//
//  Created by liqunfei on 2017/8/7.
//  Copyright © 2017年 LQF. All rights reserved.
//

#import "NSString+LQF.h"

@implementation NSString (LQF)

+ (NSString *)addQuotationMark:(NSString *)str {
    NSString *tobeStr = [NSString stringWithFormat:@"\"%@\"",str];
    return tobeStr;
}

+ (CGSize)calculateSizeWithText:(NSString *)text
                          width:(CGFloat)width
                           font:(CGFloat)font {
    return [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

@end
