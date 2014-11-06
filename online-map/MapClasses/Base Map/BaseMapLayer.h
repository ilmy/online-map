//
//  BaseMapLayer.h
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>

#import "BaseMapSchema.h"
typedef NS_ENUM(NSInteger, LayerType)
{
    vec = 0,
    cav = 1
    
};

@interface BaseMapLayer : AGSTiledLayer
{
	AGSTileInfo* _tileInfo;
	AGSEnvelope* _fullEnvelope;
    AGSEnvelope* _initExtent;
	AGSUnits _units;
    NSString* _mapurl;
    NSString* _mapTag;
    
    
}


-(id)initWithMapSchema:(id<BaseMapSchema>) baseMapSchema baseurl:(NSString*) baseurl;
@end
