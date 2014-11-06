//
//  GoogleMapLayer.h
//  RDMapApp
//
//  Created by 李明杨 on 14-4-12.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "BaseMapLayer.h"

typedef NS_ENUM(NSInteger, GoogleLayerType)
{
    normals = 0,
    traffic = 1
    
};
@interface GoogleMapLayer : BaseMapLayer
-(id)init : (GoogleLayerType) layertype;

@end
