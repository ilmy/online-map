//
//  TiandiTuMapLayer.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "TiandiTuMapLayer.h"
#import "TiandiTuMapSchema.h"
@implementation TiandiTuMapLayer

-(id)init : (LayerType) layertype
{
    
    TiandiTuMapSchema *schema = [[TiandiTuMapSchema alloc] init];
    NSMutableString *baseurl;
    switch (layertype) {
        case vec:
            baseurl = @"http://t%d.tianditu.com/DataServer?T=vec_c&X=%d&Y=%d&L=%d";
            break;
        case cav:
            baseurl = @"http://t%d.tianditu.com/DataServer?T=cva_c&X=%d&Y=%d&L=%d";
            break;
        default:
            break;
    }
    [super initWithMapSchema:schema baseurl:baseurl];
    return self;
}


@end

