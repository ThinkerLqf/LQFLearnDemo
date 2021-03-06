//
//  Runtime_User.h
//  LQFLearnDemo
//
//  Created by liqunfei on 2017/9/15.
//  Copyright © 2017年 LQF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person_Runtime.h"

@interface Runtime_User : Person_Runtime
           
@property (nonatomic, strong) NSNumber *mbrank;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_image_url;

@end
