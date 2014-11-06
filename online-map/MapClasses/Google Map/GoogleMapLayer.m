//
//  GoogleMapLayer.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-12.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "GoogleMapLayer.h"
#import "GoogleMapSchema.h"
@implementation GoogleMapLayer


-(id)init : (GoogleLayerType) layertype
{
   
  
    NSMutableString *baseurl;
    switch (layertype) {
        case normals:
            baseurl = @"https://mts%d.google.com/vt/lyrs=m@258000000&hl=zh-CN&gl=CN&src=app&x=%d&s=&y=%d&z=%d&scale=2&s=Gal";
            break;
        case traffic:
            baseurl = @"https://mts%d.google.com/vt?hl=zh-CN&gl=CN&src=app&x=%d&y=%d&z=%d&scale=2&s=Galile&lyrs=m@259000000,traffic|seconds_into_week:-1&style=15";
            break;
        default:
            break;
    }
    GoogleMapSchema *schema = [[GoogleMapSchema alloc] init];
     [super initWithMapSchema:schema baseurl:baseurl];
    
    
    return self;
}



@end
