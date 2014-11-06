//
//  BaiduMapLayer.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "BaiduMapLayer.h"

@implementation BaiduMapLayer

-(id)init
{
    
    BaiduMapSchema *schema = [[BaiduMapSchema alloc] init];
    //@"http://shangetu%d.map.bdimg.com/it/u=x=%d;y=%d;z=%d;v=017;type=web&fm=44&udt=20130712"];//
    [super initWithMapSchema:schema baseurl:@"http://online%d.map.bdimg.com/tile/?qt=tile&x=%d&y=%d&z=%d&styles=pl&udt=20140314"];
    return self;
}
@end
