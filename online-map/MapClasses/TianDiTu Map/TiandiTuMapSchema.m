//
//  TiandiTuMapSchema.m
//  RDMapApp
//
//  Created by 李明杨 on 14-4-13.
//  Copyright (c) 2014年 李明杨. All rights reserved.
//

#import "TiandiTuMapSchema.h"

@implementation TiandiTuMapSchema




-(id) init
{
	[super init];
    _mapTag = @"tianditu";
 	_spatialReference = [AGSSpatialReference spatialReferenceWithWKID:4326];//[[AGSSpatialReference alloc] initWithWKID:4326 WKT:nil];
  

	self.fullEnvelope = [[AGSEnvelope alloc] initWithXmin:70.3226237655762
                                                     ymin:0.901004856101072
                                                     xmax:138.1697929229
                                                     ymax:56.0653986218774
                                         spatialReference:self.spatialReference];
    
	NSMutableArray *lods = [NSMutableArray arrayWithObjects:
                            [[AGSLOD alloc] initWithLevel:0 resolution:1.40625 scale: 590995197.141668],
                            [[AGSLOD alloc] initWithLevel:1 resolution:0.703125 scale: 295497598.570834],
                            [[AGSLOD alloc] initWithLevel:2 resolution:0.3515625 scale: 147748799.285417],
                            [[AGSLOD alloc] initWithLevel:3 resolution:0.17578125 scale: 73874399.6427087],
                            [[AGSLOD alloc] initWithLevel:4 resolution:0.087890625 scale: 36937199.8213544],
                            [[AGSLOD alloc] initWithLevel:5 resolution:0.0439453125 scale: 18468599.9106772],
                            [[AGSLOD alloc] initWithLevel:6 resolution:0.02197265625 scale: 9234299.95533859],
                            [[AGSLOD alloc] initWithLevel:7 resolution:0.010986328125 scale: 4617149.97766929],
                            [[AGSLOD alloc] initWithLevel:8 resolution:0.0054931640625 scale: 2308574.98883465],
                            [[AGSLOD alloc] initWithLevel:9 resolution:0.00274658203125 scale: 1154287.49441732],
                            [[AGSLOD alloc] initWithLevel:10 resolution:0.001373291015625 scale: 577143.747208662],
                            [[AGSLOD alloc] initWithLevel:11 resolution:0.0006866455078125 scale: 288571.873604331],
                            [[AGSLOD alloc] initWithLevel:12 resolution:0.00034332275390625 scale: 144285.936802165],
                            [[AGSLOD alloc] initWithLevel:13 resolution:0.000171661376953125 scale: 72142.9684010827],
                            [[AGSLOD alloc] initWithLevel:14 resolution:0.00008583068848 scale: 36071.4842005414],
                            [[AGSLOD alloc] initWithLevel:15 resolution:0.00004291534424 scale: 18035.7421002707],
                            [[AGSLOD alloc] initWithLevel:16 resolution:0.00002145767212 scale:9017.87105013534],
                            [[AGSLOD alloc] initWithLevel:17 resolution:0.00001072883606 scale: 4508.93552506767],
                            [[AGSLOD alloc] initWithLevel:18 resolution:0.00000536441803 scale: 2254.467762533835],
                            [[AGSLOD alloc] initWithLevel:19 resolution:0.00000268220902 scale: 1127.2338812669175],
                           
                            nil ];
	self.tileInfo = [[AGSTileInfo alloc] 
                     initWithDpi:96 
                     format :@"PNG"
                     lods:lods
                     origin:[AGSPoint pointWithX:-180 y:90 spatialReference:self.spatialReference]
                     spatialReference :self.spatialReference
                     tileSize:CGSizeMake(256,256)
                     ];
   // [self.tileInfo]
	[_tileInfo computeTileBounds:_fullEnvelope ];
	return self;
}
- (void)dealloc {
	self.spatialReference = nil;
	self.fullEnvelope = nil;
	self.tileInfo = nil;
    
	[super dealloc];	
}



@end
