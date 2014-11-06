//
//  QQMapLayer.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-14.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "QQMapLayer.h"

@implementation QQMapLayer
-(id)init
{
    
    QQMapSchema *schema = [[QQMapSchema alloc] init];
    
    [super initWithMapSchema:schema baseurl:@"http://%s.map.gtimg.com/maptilesv2/%d/%d/%d/%d_%d.png?version=20130701"];
    return self;
}
@end
