//
//  BaseMapSchema.h
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>

@class AGSPoint;
@class AGSLOD;
@class AGSSpatialReference;
@class AGSTileInfo;
@class AGSEnvelope;
@protocol BaseMapSchema <NSObject>


@property (nonatomic,retain) AGSSpatialReference* spatialReference;
@property (nonatomic,retain) AGSEnvelope* fullEnvelope;
@property (nonatomic,retain) AGSTileInfo* tileInfo;
@property (nonatomic,retain) NSString* mapTag;
@end
    
	


